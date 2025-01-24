<?php

namespace App\Http\Controllers;

use App\Models\Bank;
use App\Models\BankSekolah;
use App\Models\Pembayaran;
use App\Models\Tagihan;
use App\Models\User;
use App\Models\WaliBank;
use App\Notifications\PembayaranNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Storage;
use Notification;

class WaliMuridPembayaranController extends Controller
{
    public function index()
    {
        $pembayaran = Pembayaran::where('wali_id', auth()->user()->id)
            ->latest()
            ->orderBy('tanggal_konfirmasi', 'desc')
            ->paginate(settings()->get('app_pagination', 50));

        $data = [
            'models' => $pembayaran,
            'title' => 'DATA PEMBAYARAN',
        ];

        return view('wali.pembayaran_index', $data);
    }

    public function show(Pembayaran $pembayaran)
    {
        auth()->user()->unreadNotifications->where('id', request('id'))->first()?->markAsRead();

        return view('wali.pembayaran_show', [
            'model' => $pembayaran,
            // Tambahkan URL file bukti bayar
            'buktiBayarUrl' => $pembayaran->bukti_bayar
                ? asset('storage/' . $pembayaran->bukti_bayar)
                : null,
        ]);
    }

    public function create(Request $request)
    {
        $data = [
            'tagihan' => Tagihan::waliSIswa()->findOrFail($request->tagihan_id),
            'model' => new Pembayaran(),
            'method' => 'POST',
            'route' => 'wali.pembayaran.store',
            'listBankSekolah' => BankSekolah::pluck('nama_bank', 'id'),
            'listBank' => Bank::pluck('nama_bank', 'id'),
            'listWaliBank' => WaliBank::where('wali_id', Auth::user()->id)->get()->pluck('nama_bank_full', 'id'),
        ];

        if ($request->bank_sekolah_id != '') {
            $data['bankYangDipilih'] = BankSekolah::findOrFail($request->bank_sekolah_id);
        }

        $data['url'] = route('wali.pembayaran.create', [
            'tagihan_id' => $request->tagihan_id,
        ]);

        return view('wali.pembayaran_form', $data);
    }

    public function store(Request $request)
    {
        $request->validate([
            'tanggal_bayar' => 'required',
            'jumlah_dibayar' => 'required',
            'bukti_bayar' => 'required|image|mimes:jpg,png,jpeg|max:5048',
        ]);

        // Simpan file bukti bayar
        $buktibyar = $request->file('bukti_bayar')->store('public/bukti-bayar');

        $dataPembayaran = [
            'bank_sekolah_id' => $request->bank_sekolah_id,
            'wali_bank_id' => $request->wali_bank_id,
            'tagihan_id' => $request->tagihan_id,
            'wali_id' => auth()->user()->id,
            'tanggal_bayar' => $request->tanggal_bayar,
            'jumlah_dibayar' => str_replace('.', '', $request->jumlah_dibayar),
            'bukti_bayar' => $buktibyar,
            'metode_pembayaran' => 'transfer',
            'user_id' => 0,
        ];

        DB::beginTransaction();

        try {
            $pembayaran = Pembayaran::create($dataPembayaran);

            // Kirim notifikasi ke operator
            $userOperator = User::where('akses', 'operator')->get();
            Notification::send($userOperator, new PembayaranNotification($pembayaran));

            DB::commit();
        } catch (\Throwable $th) {
            DB::rollBack();
            flash('Gagal menyimpan data pembayaran ' . $th->getMessage())->error();
            return back();
        }

        flash('Pembayaran berhasil disimpan dan akan segera dikonfirmasi oleh operator')->success();
        return redirect()->route('wali.pembayaran.show', $pembayaran->id);
    }

    public function destroy($id)
    {
        $pembayaran = Pembayaran::findOrFail($id);

        if ($pembayaran->tanggal_konfirmasi != null) {
            flash('Data pembayaran ini sudah dikonfirmasi, tidak bisa dihapus')->error();
            return back();
        }

        $imagePath = $pembayaran->bukti_bayar;

        if (Storage::exists($imagePath)) {
            Storage::delete($imagePath);
        }

        $pembayaran->delete();

        flash('Data pembayaran berhasil dihapus')->success();
        return redirect()->route('wali.pembayaran.index');
    }
}
