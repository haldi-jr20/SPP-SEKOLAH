@extends('layouts.app_sneat')

@section('content')
<div class="row">
    <div class="col-md-12">
        <div class="card mb-4">

            <div class="card-body">

                <div class="table-responsive">

                    <table class="table table-light">
                        <thead>
                            <tr>
                                <td colspan="2" class="bg-secondary text-white fw-bold">
                                    DATA PEMBAYARAN
                                </td>
                            </tr>

                            <tr>
                                <th width="30%">No</th>
                                <td>: {{ $model->id }}</td>
                            </tr>
                            <tr>
                                <th>Id Tagihan</th>
                                <td>: {{ $model->tagihan_id }}</td>
                            </tr>
                            <tr>
                                <th class="align-center">Item Tagihan</th>
                                <td>
                                    <table class="table table-sm table-striped">
                                        <thead class="table-secondary text-center">
                                            <tr>
                                                <th>No</th>
                                                <th>Nama Biaya</th>
                                                <th>Jumlah</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            @foreach ($model->tagihan->tagihanDetail as $item)
                                            <tr>
                                                <td class="text-center">{{ $loop->iteration }}.</td>
                                                <td>{{ $item->nama_biaya }}</td>
                                                <td>{{ format_rupiah($item->jumlah_biaya) }}</td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <th>Total Tagihan</th>
                                <td>: {{ format_rupiah($model->tagihan->tagihanDetail->sum('jumlah_biaya')) }}</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="bg-secondary text-white fw-bold">
                                    INFORMASI SISWA
                                </td>
                            </tr>
                            <tr>
                                <th>Nama Siswa</th>
                                <td>: {{ ucwords($model->tagihan->siswa->nama) }}</td>
                            </tr>
                            <tr>
                                <th>Nama Wali Murid</th>
                                <td>: {{ ucwords($model->wali->name) }}</td>
                            </tr>

                            @if ($model->metode_pembayaran != 'manual')

                            <tr>
                                <td colspan="2" class="bg-secondary text-white fw-bold">
                                    INFORMASI BANK PENGIRIM
                                </td>
                            </tr>
                            <tr>
                                <th>Bank Pengirim</th>
                                <td>: {{ $model->waliBank->nama_bank }}</td>
                            </tr>
                            <tr>
                                <th>No Rekening</th>
                                <td>: {{ $model->waliBank->nomor_rekening }}</td>
                            </tr>
                            <tr>
                                <th>Atas Nama</th>
                                <td>: {{ ucwords($model->waliBank->nama_rekening) }}</td>
                            </tr>
                            <tr>
                                <td colspan="2" class="bg-secondary text-white fw-bold">
                                    INFORMASI BANK TUJUAN / SEKOLAH
                                </td>
                            </tr>
                            <tr>
                                <th>Bank Tujuan</th>
                                <td>: {{ $model->bankSekolah->nama_bank }}</td>
                            </tr>
                            <tr>
                                <th>No. Rekening</th>
                                <td>: {{ $model->bankSekolah->nomor_rekening }}</td>
                            </tr>
                            <tr>
                                <th>Atas Nama</th>
                                <td>: {{ ucwords($model->bankSekolah->nama_rekening) }}</td>
                            </tr>

                            @endif

                            <tr>
                                <td colspan="2" class="bg-secondary text-white fw-bold">
                                    INFORMASI PEMBAYARAN
                                </td>
                            </tr>
                            <tr>
                                <th>Metode Pembayaran</th>
                                <td>: {{ ucwords($model->metode_pembayaran) }}</td>
                            </tr>
                            <tr>
                                <th>Tanggal Pembayaran</th>
                                <td>: {{ optional($model->tanggal_bayar)->translatedFormat('d F Y') }}</td>
                            </tr>
                            <tr>
                                <th>Jumlah Tagihan</th>
                                <td>: {{ format_rupiah($model->tagihan->tagihanDetail->sum('jumlah_biaya')) }}</td>
                            </tr>
                            <tr>
                                <th>Jumlah yang dibayar</th>
                                <td>: {{ format_rupiah($model->jumlah_dibayar) }}</td>
                            </tr>

                            @if ($model->metode_pembayaran != 'manual')
                            <tr>
                                <th>Bukti Pembayaran</th>
                                <td>:
                                    @if ($model->bukti_bayar)
                                    <a href="{{ asset('storage/' . $model->bukti_bayar) }}" target="_blank" rel="noopener noreferrer" class="btn btn-success btn-sm">
                                        Lihat Bukti Bayar
                                    </a>
                                @else
                                    <span class="badge text-bg-secondary">Tidak Ada</span>
                                @endif
                                </td>
                            </tr>

                            @endif

                            <tr>
                                <th>Status Konfirmasi</th>
                                <td>:
                                    @if ($model->status_konfirmasi == 'Belum Dikonfirmasi')
                                    <span class="badge rounded-pill text-bg-danger">{{
                                        ucwords($model->status_konfirmasi) }}
                                        oleh Operator</span>
                                    @else
                                    <span class="badge rounded-pill text-bg-success">{{
                                        ucwords($model->status_konfirmasi) }}
                                        oleh Operator</span>

                                    @endif
                                </td>
                            </tr>
                            <tr>
                                <th>Status Pembayaran</th>
                                <td>:
                                    @if ($model->tagihan->getStatusTagihanWali() == 'Belum Dibayar')
                                    <span class="badge rounded-pill text-bg-danger">{{
                                        $model->tagihan->getStatusTagihanWali() }}</span>
                                    @else
                                    <span class="badge rounded-pill text-bg-success">{{
                                        $model->tagihan->getStatusTagihanWali() }}</span>
                                    @endif
                                </td>
                            </tr>
                            <tr>
                                <th>Tanggal Konfirmasi</th>
                                <td>:
                                    @if ($model->tanggal_konfirmasi == null)
                                    <span class="badge rounded-pill text-bg-danger">
                                        Belum dikonfirmasi oleh Operator</span>
                                    @else
                                    {{ optional($model->tanggal_konfirmasi)->translatedFormat('d F Y H:i') }}
                                    @endif

                                </td>
                            </tr>
                        </thead>
                    </table>

                    @if ($model->tanggal_konfirmasi == null)
                    <div class="text-end">
                        {!! Form::open([
                        'route' => $route,
                        'method' => 'PUT',
                        'onsubmit' => 'return confirm("Apakah anda yakin.?")'
                        ]) !!}
                        {!! Form::hidden('pembayaran_id', $model->id, []) !!}

                        {!! Form::submit('KONFIRMASI PEMBAYARAN', ['class' => 'btn btn-primary mt-2']) !!}

                        {!! Form::close() !!}
                    </div>
                    @else
                    <div class="alert alert-dark text-center mt-3" role="alert">
                        <strong class="fs-2">TAGIHAN INI SUDAH LUNAS</strong>
                    </div>
                    @endif

                </div>

            </div>
        </div>
    </div>

</div>
@endsection