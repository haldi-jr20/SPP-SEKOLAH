<?php

namespace App\Http\Controllers;

use App\Models\BankSekolah as Model;
use App\Http\Requests\StoreBankSekolahRequest;
use App\Http\Requests\UpdateBankSekolahRequest;
use App\Models\Bank;
use Illuminate\Http\Request;

class BankSeklolahController extends Controller
{
    private $viewIndex      = 'banksekolah_index';
    private $viewCreate     = 'banksekolah_form';
    private $viewEdit       = 'banksekolah_form';
    private $viewShow       = 'banksekolah_show';
    private $routePrefix    = 'banksekolah';

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $models = Model::latest()->paginate(settings()->get('app_pagination', 50));

        return view('operator.' . $this->viewIndex, [
            'models'        => $models,
            'title'         => 'Data Rekening Sekolah',
            'routePrefix'   => $this->routePrefix,
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $listbank = Bank::pluck('nama_bank', 'id');

        // Tambahkan logika untuk menangani kasus tabel bank kosong
        if ($listbank->isEmpty()) {
            // Kirim pesan error jika tidak ada data bank
            flash('Data bank belum tersedia, tambahkan terlebih dahulu.')->error();
            return redirect()->route($this->routePrefix . '.index');
        }

        $data = [
            'model'     => new Model(),
            'method'    => 'POST',
            'route'     => $this->routePrefix . '.store',
            'button'    => 'Simpan Data',
            'listbank'  => $listbank,
            'title'     => 'Tambah Data Biaya',
        ];

        return view('operator.' . $this->viewCreate, $data);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \App\Http\Requests\StoreBankSekolahRequest  $request
     * @return \Illuminate\Http\Response
     */
    public function store(StoreBankSekolahRequest $request)
    {
        $requestData = $request->validated();
        $bank = Bank::find($request['bank_id']);
        
        if (!$bank) {
            flash('Bank tidak ditemukan.')->error();
            return back();
        }

        unset($requestData['bank_id']);

        $requestData['kode']        = $bank->sandi_bank;
        $requestData['nama_bank']   = $bank->nama_bank;

        Model::create($requestData);
        flash('Data berhasil ditambahkan');
        return redirect()->route($this->routePrefix . '.index');
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $listbank = Bank::pluck('nama_bank', 'id');

        if ($listbank->isEmpty()) {
            flash('Data bank belum tersedia, tambahkan terlebih dahulu.')->error();
            return redirect()->route($this->routePrefix . '.index');
        }

        $data = [
            'model'     => Model::findOrFail($id),
            'method'    => 'PUT',
            'route'     => [$this->routePrefix . '.update', $id],
            'button'    => 'Ubah Data',
            'listbank'  => $listbank,
            'title'     => 'Ubah Data Biaya',
        ];

        return view('operator.' . $this->viewEdit, $data);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \App\Http\Requests\UpdateBankSekolahRequest  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UpdateBankSekolahRequest $request, $id)
    {
        $model = Model::findOrFail($id);

        $model->fill($request->validated());
        $model->save();

        flash('Data berhasil diubah');

        return redirect()->route($this->routePrefix . '.index');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $model = Model::findOrFail($id);
        $model->delete();

        flash('Data berhasil dihapus');
        return redirect()->route($this->routePrefix . '.index');
    }
}
