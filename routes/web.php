<?php

use App\Http\Controllers\Auth\LoginController;
use App\Http\Controllers\Auth\RegisterController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

// Login URL
Route::get('login/login-url', [LoginController::class, 'loginUrl'])->name('login.url');

// Authentication routes
Auth::routes();

// Redirect to the home route
Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

// Operator routes
Route::prefix('operator')->middleware(['auth', 'auth.operator'])->group(function () {
    // Operator-specific routes
    Route::get('beranda', [App\Http\Controllers\BerandaOperatorController::class, 'index'])->name('operator.beranda');

    // Resources
    Route::resource('user', App\Http\Controllers\UserController::class);
    Route::resource('banksekolah', App\Http\Controllers\BankSeklolahController::class);
    Route::resource('wali', App\Http\Controllers\WaliController::class);
    Route::resource('siswa', App\Http\Controllers\SiswaController::class);
    Route::delete('siswa/{id}', [App\Http\Controllers\SiswaController::class, 'destroy'])->name('siswa.destroy');
    Route::resource('walisiswa', App\Http\Controllers\WaliSiswaController::class);
    Route::resource('biaya', App\Http\Controllers\BiayaController::class);
    Route::get('delete-biaya-item/{id}', [App\Http\Controllers\BiayaController::class, 'deleteItem'])->name('delete.biaya.item');
    Route::resource('tagihan', App\Http\Controllers\TagihanController::class);
    Route::resource('pembayaran', App\Http\Controllers\PembayaranController::class);
    Route::resource('setting', App\Http\Controllers\SettingController::class);

    // Print kwitansi
    Route::get('kwitansi-pembayaran/{id}', [App\Http\Controllers\KwitansiPembayaranController::class, 'show'])->name('kwitansipembayaran.show');

    // Kartu SPP
    Route::get('kartuspp', [App\Http\Controllers\KartuSppController::class, 'index'])->name('kartuspp.index');

    // Status akun siswa
    Route::get('status/update', [App\Http\Controllers\StatusController::class, 'update'])->name('status.update');
});

// Login Wali
Route::get('/login-wali', [LoginController::class, 'showLoginFormWali'])->name('login.wali');

// Register Wali
// Flash message untuk menampilkan notifikasi sukses setelah registrasi berhasil.
Route::get('/register-wali', [RegisterController::class, 'showRegistrationForm'])->name('register.wali');
Route::post('/register-wali', [RegisterController::class, 'register'])->name('register.wali.submit');

// Wali routes
Route::prefix('wali')->middleware(['auth', 'auth.wali'])->name('wali.')->group(function () {
    Route::get('beranda', [App\Http\Controllers\BerandaWaliController::class, 'index'])->name('beranda');
    Route::resource('siswa', App\Http\Controllers\WaliMuridSiswaController::class);
    Route::resource('tagihan', App\Http\Controllers\WaliMuridTagihanController::class);
    Route::resource('pembayaran', App\Http\Controllers\WaliMuridPembayaranController::class);
});

// Admin routes
Route::prefix('admin')->middleware(['auth', 'auth.admin'])->group(function () {
    // Admin-specific routes
});

// Logout route
Route::get('logout', function () {
    Auth::logout();
    return redirect('login');
})->name('logout');
