# 🎧 TWS Store App

Sebuah aplikasi e-commerce modern berbasis **Flutter** yang dikhususkan untuk penjualan produk True Wireless Stereo (TWS). Aplikasi ini dirancang dengan antarmuka yang bersih (clean & modern UI) berbalut warna utama putih, dan menggunakan state management **Provider** untuk menangani keranjang belanja (cart) secara efisien dan reaktif.

---

## ✨ Fitur Utama (Features)

1. **Beranda Produk (Home Screen)**
   - Menampilkan daftar produk TWS dalam bentuk Grid yang modern dengan *card* yang elegan dilengkapi efek bayangan (shadow) yang subtle.
   - **Pencarian (Search):** Pengguna dapat mencari produk berdasarkan nama secara *real-time*.
   - **Kategori (Filter):** Fitur filter (misal: 'All', 'ANC TWS', 'Sports', 'Audiophile') menggunakan *chips* horizontal yang interaktif.
   - **Add to Cart:** Tombol langsung di setiap *card* produk untuk mempermudah penambahan barang ke keranjang beserta notifikasi *SnackBar* sukses.

2. **Keranjang Belanja (Cart Screen)**
   - Menampilkan seluruh item yang ditambahkan ke keranjang belanja lengkap dengan foto, nama, harga, dan kuantitas.
   - **Update Kuantitas (+/-):** Pengguna bisa menambah atau mengurangi jumlah barang. Jika dikurangi hingga 0, barang otomatis terhapus dari keranjang.
   - **Hapus Item:** Indikator ikon tempat sampah (trash) untuk langsung menghapus satu tipe barang dari keranjang secara spesifik.
   - **Total Harga:** Secara dinamis menghitung seluruh total belanja secara *real-time*.
   - **Clear Cart:** Tombol di bagian atas untuk mengosongkan keseluruhan isi keranjang.

3. **Halaman Pembayaran (Checkout Screen)**
   - Memberikan ringkasan harga produk, dan rincian biaya pengiriman (gratis ongkos kirim secara *default* di versi ini).
   - Menyediakan form data alamat pengiriman dengan validasi agar tidak ada input yang kosong sebelum proses checkout selesai.
   - Setelah checkout berhasil, keranjang akan dibersihkan (*cleared*) dan pengguna akan dikembalikan ke layar utama.

---

## 🛠 Teknologi yang Digunakan

- **Framework:** Flutter SDK
- **Bahasa Pemrograman:** Dart
- **State Management:** `provider: ^6.1.2`
- **Arsitektur:** Model-View-Provider (di dalam konteks implementasi ChangeNotifier)

---

## 📂 Struktur Direktori & Modul (Architecture)

Struktur proyek ini disusun agar modular dan *scalable*. Berikut penjelasan setiap direktori yang ada di dalam `lib/`:

```text
lib/
│
├── models/
│   ├── cart_item.dart      # Blueprint data untuk 1 item di dalam keranjang (product + kuantitas)
│   └── product.dart        # Blueprint data inti produk (id, name, price, imageUrl, dll)
│
├── providers/
│   ├── cart_provider.dart    # Logic/State untuk manajemen keranjang belanja (+, -, hapus, total)
│   └── product_provider.dart # Logic/State untuk manajemen daftar produk & filter/pencarian
│
├── screens/
│   ├── cart_screen.dart      # Tampilan keranjang dan rendering data dari CartProvider
│   ├── checkout_screen.dart  # Tampilan summary pembayaran & validasi formulir pembeli
│   └── home_screen.dart      # Tampilan utama toko (search bar, filter, grid produk)
│
├── widgets/
│   ├── cart_item_card.dart   # UI Component bentuk Card khusus di halaman Keranjang
│   └── product_card.dart     # UI Component bentuk Card detail produk di HomeScreen
│
└── main.dart                 # Titik masuk utama aplikasi (Main Entry Point) & setup MultiProvider
```

### Penjelasan Logic (Provider)

Aplikasi ini sangat mengandalkan `ChangeNotifier` dari Provider:
1. **`CartProvider` (`lib/providers/cart_provider.dart`)**
   - Menggunakan Map (`Map<String, CartItem>`) agar akses pencatatan barang *O(1)* yang sangat cepat.
   - Fitur logic: `addItem()` memeriksa jika barang sudah ada maka `quantity` nya ditambah, jika belum ada dimasukkan data baru. Metode `updateQuantity()` memastikan state UI akan selalu *rebuild* (via `notifyListeners()`) setiap ada perubahan total item.

2. **`ProductProvider` (`lib/providers/product_provider.dart`)**
   - Menampung seluruh data *mock product* dan lokasi gambar lokal *(assets/images/...)*.
   - Terdapat variabel *private* `_searchQuery` dan `_selectedCategory`. 
   - Fungsi `getter items` akan secara mandiri mengembalikan _list product_ yang sudah tersaring/terfilter tanpa merubah data asli sehingga pencarian terasa dinamis tanpa membebani memori tambahan.

---

## 🎨 Tampilan dan Logika Gaya (UI & Styling Logic)

Aplikasi ini menggunakan desain gaya ***Minimalist & Clean***:
- Warna Dominan: Putih dan Hitam.
- *Scaffold Background* menggunakan abu-abu *subtle* `Color(0xFFF8F9FA)` agar elemen *Card* utama berwarna putih solid dengan *Drop Shadow* terlihat mencolok atau *pop-out*.
- Ujung *widgets* dihaluskan menggunakan `BorderRadius.circular(16)` memberikan identitas modern yang tidak kaku.
- **Font Typography:** Inter (Dikomfigurasi via `ThemeData` agar keseluruhan aplikasi terlihat seragam).

---

## 🚀 Cara Menjalankan Aplikasi

1. **Clone repository ini** 
   ```bash
   git clone https://github.com/superamarr/TWS-Store.git
   ```
2. **Masuk ke folder proyek**
   ```bash
   cd shopping_tws
   ```
3. **Download semua _dependencies_**
   ```bash
   flutter pub get
   ```
4. **Jalankan Aplikasi**
   Pastikan emulator Android/iOS berjalan, atau jalankan melalui web:
   ```bash
   flutter run
   ```

---

_Didesain dan dikerjakan sebagai bagian dari Tugas Pemrograman Aplikasi Bergerak (PAB)._
