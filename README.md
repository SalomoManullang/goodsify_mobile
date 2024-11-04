# goodsify

# TUGAS 7: Elemen Dasar Flutter
<details>
  <summary></summary>

## Pengerjaan Project Flutter

1. Instalasi Flutter di Windows

    #### Langkah 1: Unduh Flutter SDK
    1. Buka situs resmi Flutter di [flutter.dev](https://flutter.dev) dan unduh Flutter SDK untuk Windows.
    2. Ekstrak file `.zip` Flutter yang telah diunduh ke direktori pilihan Anda, misalnya `C:\src\flutter` (hindari direktori seperti `C:\Program Files` yang memerlukan izin administrator).

    #### Langkah 2: Tambahkan Flutter ke PATH
    1. Buka pengaturan **Environment Variables** di Windows:
      - Klik kanan pada **This PC** atau **Computer** > **Properties** > **Advanced system settings** > **Environment Variables**.
    2. Di bagian **System variables**, cari variabel `Path` dan klik **Edit**.
    3. Tambahkan path ke folder `bin` dari Flutter SDK, misalnya `C:\src\flutter\bin`.
    4. Klik **OK** untuk menyimpan perubahan.

    #### Langkah 3: Verifikasi Instalasi Flutter
    1. Buka **Command Prompt** atau **PowerShell**.
    2. Jalankan perintah berikut untuk memastikan instalasi berhasil:
      ```bash
      flutter doctor
      ```

    #### Langkah 4: Instal IDE untuk Pengembangan Flutter
    
    Download Visual Studio Code dan Android Studio

    #### Langkah 5: Membuat Proyek Flutter Baru

    Buka Command Prompt atau PowerShell di direktori tempat Anda ingin membuat proyek. Jalankan perintah berikut untuk membuat proyek Flutter baru:
    ```bash
      flutter create my_flutter_app
      cd my_flutter_app
    ```

    Untuk menjalankan proyek pada emulator atau perangkat yang terhubung, gunakan perintah berikut:
    bash
    ```bash 
      flutter run
    ```

    ### Membuat tiga tombol sederhana dengan ikon dan teks untuk :

    1. **Lihat Daftar Produk**: Tombol ini digunakan untuk melihat daftar produk yang tersedia. Teks yang ditampilkan pada tombol adalah "Lihat Daftar Produk".
    2. **Tambah Produk**: Tombol ini memungkinkan pengguna untuk menambah produk baru. Teks yang ditampilkan pada tombol adalah "Tambah Produk".
    3. **Logout**: Tombol ini digunakan untuk keluar dari aplikasi. Teks yang ditampilkan pada tombol adalah "Logout".

    1. **Konfigurasi item pada Home Page & Implementasi warna-warna yang berbeda untuk setiap tombol**

    Untuk membuat tiga tombol pada halaman utama, kita menggunakan widget `ItemHomepage` untuk mendefinisikan data tombol, seperti nama, ikon, dan warna. Kemudian, kita menampilkan setiap tombol menggunakan `widget` `ItemCard` dalam `GridView`.

    ```bash 
      final List<ShopItem> items = [
      ShopItem("Product List", Icons.checklist, Colors.deepOrange.shade400),
      ShopItem("Add Product", Icons.add_shopping_cart, Colors.orange.shade400),
      ShopItem("Logout", Icons.logout, Colors.lightGreen.shade400),
      ];

    ```

    2. **tampilkan tombol-tombol ini dalam GridView di dalam widget build seperti berikut:**

    Pada GridView.count, kita mengatur:

    `crossAxisCount`: Jumlah kolom dalam grid.
    `children`: Menampilkan tombol-tombol berdasarkan daftar items dengan memanggil widget ItemCard untuk setiap item.

    ```bash
      GridView.count(
        primary: false,
        padding: const EdgeInsets.all(10), // Kurangi padding
        crossAxisSpacing: 5, // Kurangi jarak horizontal antar card
        mainAxisSpacing: 5, // Kurangi jarak vertikal antar card
        crossAxisCount: 3, // Jumlah kolom dalam grid
        shrinkWrap: true,
        children: items.map((ShopItem item) {
          return ShopCard(item);
        }).toList(),}

    ```

    3. **Memunculkan Snackbar dengan tulisan:**

    Setiap tombol akan menampilkan pesan menggunakan `Snackbar` saat ditekan. Di dalam `widget` `ItemCard`, kita memanggil `ScaffoldMessenger` untuk menampilkan `Snackbar` yang berbeda sesuai tombol yang ditekan:

      "You pressed View Products button!" ketika tombol Lihat Daftar Produk ditekan.
      "You pressed Add Product button!" ketika tombol Tambah Produk ditekan.
      "You pressed Logout button!" ketika tombol Logout ditekan.

    ```bash
        class MyHomePage extends StatelessWidget {
        final String name = 'Salomo Immanuel'; // Nama
        final String className = 'PBP B'; //Kelas
        MyHomePage({super.key});

        final List<ShopItem> items = [
          ShopItem("Product List", Icons.checklist, Colors.deepOrange.shade400),
          ShopItem("Add Product", Icons.add_shopping_cart, Colors.orange.shade400),
          ShopItem("Logout", Icons.logout, Colors.lightGreen.shade400),
        ];

        @override
        Widget build(BuildContext context) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'Goodsify',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              backgroundColor: Theme.of(context).colorScheme.primary,
            ),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0), // Set padding dari halaman
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center, // Posisikan konten di tengah secara vertikal
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                        child: Text(
                          'Goodsify',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade900,
                          ),
                        ),
                      ),
                      // Info cards for name and class
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          InfoCard(title: 'Name', content: name),
                          InfoCard(title: 'Class', content: className),
                        ],
                      ),
                      const SizedBox(height: 16.0), // Spacing between info cards and grid

                      // Grid layout
                      Center(
                        child: GridView.count(
                          primary: false,
                          padding: const EdgeInsets.all(10), // Kurangi padding
                          crossAxisSpacing: 5, // Kurangi jarak horizontal antar card
                          mainAxisSpacing: 5, // Kurangi jarak vertikal antar card
                          crossAxisCount: 3, // Jumlah kolom dalam grid
                          shrinkWrap: true,
                          children: items.map((ShopItem item) {
                            return ShopCard(item);
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      }

      ```


## stateless widget dan stateful widget

### 📘 Stateless Widget

- **Definisi**: Stateless widget adalah widget yang **tidak memiliki state** yang dapat berubah setelah dirender.
- **Karakteristik**:
  - Tampilan dan perilaku tetap konstan selama aplikasi berjalan.
  - Tidak merespons perubahan data atau interaksi pengguna.
- **Penggunaan Umum**:
  - Elemen UI yang statis atau hanya menampilkan data tetap, seperti teks atau ikon.

### 📗 Stateful Widget

- **Definisi**: Stateful widget adalah widget yang **memiliki state** yang dapat berubah selama runtime.
- **Karakteristik**:
  - Tampilan dan perilaku dapat diperbarui berdasarkan perubahan data atau interaksi pengguna.
  - Memiliki lifecycle methods seperti `initState`, `setState`, dan `dispose` untuk mengelola state widget.
- **Penggunaan Umum**:
  - Elemen UI yang membutuhkan interaksi atau merespons perubahan data, seperti form input, animasi, atau komponen yang memerlukan update data.

### 📊 Perbedaan Utama

| Kriteria                 | Stateless Widget                                   | Stateful Widget                                      |
|--------------------------|----------------------------------------------------|------------------------------------------------------|
| **Perubahan State**      | Tidak berubah setelah dirender                     | Dapat berubah saat runtime menggunakan `setState`    |
| **Lifecycle Methods**    | Tidak memiliki lifecycle methods                   | Memiliki lifecycle methods seperti `initState`, `dispose` |
| **Penggunaan**           | Untuk tampilan statis atau data yang tidak berubah | Untuk tampilan dinamis atau data yang dapat berubah   |
| **Kinerja**              | Lebih ringan, tidak perlu melacak perubahan        | Lebih berat karena melacak dan merender ulang state  |

### 🎯 Kapan Menggunakan?

- Gunakan **Stateless Widget** untuk elemen UI yang **tidak membutuhkan perubahan state** atau tidak perlu merespons interaksi pengguna.
- Gunakan **Stateful Widget** untuk elemen UI yang **perlu merespons perubahan** atau interaksi pengguna, seperti tombol dengan counter, form input, atau tampilan dengan data yang dapat berubah.


## Widget yang digunakan pada project `Goodsify`

Berikut adalah beberapa widget dasar di Flutter yang sering digunakan untuk membangun layout dan struktur aplikasi.

### 📋 Scaffold
- **Deskripsi**: Widget dasar yang menyediakan struktur layout aplikasi.
- **Fungsi**: Menyediakan komponen utama seperti app bar, body, dan floating action button.

### 📌 AppBar
- **Deskripsi**: Header di bagian atas aplikasi.
- **Fungsi**: Digunakan untuk menampilkan judul, ikon, atau opsi lainnya yang relevan dengan halaman.

### 📝 Text
- **Deskripsi**: Widget untuk menampilkan teks.
- **Fungsi**: Menampilkan teks statis atau dinamis dalam aplikasi.

### 🎨 Icon
- **Deskripsi**: Widget untuk menampilkan ikon.
- **Fungsi**: Sering digunakan pada tombol atau untuk memberikan konteks visual pada elemen UI.

### 📐 Padding
- **Deskripsi**: Menambahkan jarak di sekitar widget tertentu.
- **Fungsi**: Membantu memperindah tampilan dengan memberikan ruang di sekitar widget.

### 📜 SingleChildScrollView
- **Deskripsi**: Memungkinkan tampilan untuk bisa di-scroll.
- **Fungsi**: Berguna untuk layout dengan konten yang lebih panjang dari tinggi layar.

### 📏 Row dan Column
- **Row**: Mengatur widget secara horizontal.
- **Column**: Mengatur widget secara vertikal.
- **Fungsi**: Membantu mengatur tata letak widget dalam orientasi yang diinginkan.

### 📦 Card
- **Deskripsi**: Widget kotak dengan bayangan dan sudut membulat.
- **Fungsi**: Digunakan untuk menampilkan konten dengan batas yang jelas, seperti daftar atau informasi tertentu.

### 📐 GridView
- **Deskripsi**: Menampilkan item dalam format grid.
- **Fungsi**: Mengatur widget dalam bentuk grid (baris dan kolom), sering digunakan untuk menyusun item dalam bentuk kartu.

### 👆 InkWell
- **Deskripsi**: Membuat widget menjadi clickable.
- **Fungsi**: Memberikan efek animasi ripple saat widget ditekan, menambahkan kesan interaktif.


## `setState()` function


### Fungsi
`setState()` digunakan dalam stateful widget untuk memberi tahu Flutter bahwa ada perubahan state yang perlu di-render ulang. Saat `setState()` dipanggil, Flutter akan menjalankan ulang `build` method untuk memperbarui tampilan yang terkait dengan state tersebut.

### Variabel yang Terdampak
Hanya variabel dalam class state (misalnya, `_MyWidgetState`) yang diubah di dalam `setState()` yang akan menyebabkan widget diperbarui. Variabel lain yang tidak diubah di dalam `setState()` tidak akan memicu pembaruan tampilan.


## Perbedaan `const` dan `final`


Dalam Dart, `const` dan `final` digunakan untuk mendeklarasikan variabel yang tidak dapat diubah setelah diinisialisasi. Namun, ada perbedaan penting antara keduanya.

### `final`

- **Definisi**: `final` digunakan untuk variabel yang nilainya hanya bisa diinisialisasi sekali dan tidak dapat diubah setelah itu.
- **Inisialisasi**: Nilai `final` dapat ditetapkan saat runtime (saat program berjalan).
- **Penggunaan Umum**: Cocok untuk nilai yang tidak berubah tetapi hanya diketahui pada runtime, seperti hasil fungsi atau interaksi pengguna.

### `const`

- **Definisi**: `const` digunakan untuk variabel yang merupakan **compile-time constant**, artinya nilainya sudah ditentukan saat kompilasi dan tidak akan pernah berubah.
- **Inisialisasi**: Nilai `const` harus berupa nilai konstan yang sudah diketahui sebelum runtime.
- **Penggunaan Umum**: Digunakan untuk nilai yang selalu tetap, seperti angka atau string konstan yang tidak berubah sepanjang waktu.

### Perbedaan Utama

| Kriteria                | `final`                                       | `const`                                            |
|-------------------------|-----------------------------------------------|----------------------------------------------------|
| **Inisialisasi**        | Saat runtime                                  | Saat kompilasi                                     |
| **Perubahan Nilai**     | Tidak bisa diubah setelah inisialisasi        | Tidak bisa diubah, tetap sejak kompilasi           |
| **Nilai**               | Bisa bergantung pada runtime                  | Harus diketahui saat kompilasi                     |
| **Contoh Penggunaan**   | Waktu saat ini atau hasil fungsi              | Angka atau string yang tetap                       |

---

Gunakan `final` untuk variabel yang nilainya hanya diketahui saat runtime, dan `const` untuk variabel konstan yang nilainya diketahui saat kompilasi.


</details>

