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


# TUGAS 8: Flutter Navigation, Layouts, Forms, and Input Elements

<details>
  <summary></summary>

## `Const` di Flutter 

#### Fungsi `const` di Flutter?

1. **Menghemat Memori**  
   Ketika kita menggunakan `const`, Flutter tidak membuat ulang objek setiap kali dibutuhkan. Sebaliknya, Flutter akan memakai objek yang sama (reuse) berulang kali, sehingga penggunaan memori jadi lebih efisien.

2. **Mengurangi Beban Rendering**  
   Widget yang didefinisikan sebagai `const` tidak perlu di-render ulang jika isinya tidak berubah. Ini berarti Flutter tidak harus menggambar ulang widget tersebut, yang membuat performa aplikasi lebih mulus dan stabil.

3. **Mempercepat Waktu Kompilasi**  
   Karena nilai-nilai `const` sudah tetap sejak awal, Flutter bisa memprosesnya lebih cepat saat kompilasi. Hasilnya, aplikasi lebih cepat dan kemungkinan error runtime berkurang.
  
#### Kapan Sebaiknya Gunakan `const`?

1. **Untuk Widget yang Nggak Pernah Berubah**  
   Jika punya widget yang tampilannya nggak bakal berubah, seperti `Text` atau `Icon`, pakai `const` supaya lebih efisien.  
   ```dart
   const Text('Hello, Flutter');
   ```

2. **Untuk Layout Sederhana**
    Elemen layout seperti `Row`, `Column`, atau `Padding` yang tampilannya tetap bisa dijadikan `const` agar lebih hemat memori.
    ```dart
      const Padding(
      padding: EdgeInsets.all(16.0),
      child: Text('Static Text'),
      );
    ```

3. **Untuk Variabel dengan Nilai Tetap**
    Kalau ada nilai yang nggak akan berubah, seperti angka atau warna tertentu, sebaiknya pakai `const`.
    ```dart
      const primaryColor = Colors.blue;
    ```

#### Kapan sebaiknya tidak gunakan `Const`?

1. **Widget yang Dinamis atau Berubah**
  Jika widget membutuhkan data yang berubah selama runtime (misalnya data dari server, state management, atau input user), hindari const karena nilai yang konstan tidak dapat diubah setelah ditentukan.

2. **Kondisi yang Memerlukan Perhitungan Ulang**
  Jika Anda ingin menghitung ulang suatu nilai atau membuat objek baru berdasarkan kondisi tertentu, gunakan kata kunci `final` atau biarkan tanpa `const`.

3. **Interaksi dengan State Management**
  Ketika berinteraksi dengan `StatefulWidget` atau `library state management`, `widget` cenderung membutuhkan perubahan nilai berdasarkan `state`, sehingga `const` tidak cocok digunakan di sini.


## `Column` dan `Row` pada Flutter?

1. **Column**  
   `Column` adalah widget di Flutter yang menampilkan anak-anaknya secara vertikal (dari atas ke bawah). Ini cocok digunakan jika kita ingin menumpuk widget satu di atas yang lain, seperti daftar teks atau tombol yang ditampilkan secara vertikal.

    ```dart 
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('Ini adalah teks pertama'),
          Text('Ini adalah teks kedua'),
          ElevatedButton(
            onPressed: () {},
            child: Text('Tombol'),
          ),
        ],
      )

    ```

2. **Row**  
   `Row`, sebaliknya, menampilkan anak-anaknya secara horizontal (dari kiri ke kanan). `Row` berguna jika kita ingin menyusun widget secara berdampingan, seperti ikon atau tombol dalam satu garis horizontal.

   ```dart
    Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Icon(Icons.home),
        Text('Home'),
        ElevatedButton(
          onPressed: () {},
          child: Text('Tombol'),
        ),
      ],
    )
   ```


#### Perbandingan `Column` vs `Row`

| Aspek            | Column                          | Row                          |
|------------------|---------------------------------|------------------------------|
| Arah Layout      | Vertikal (atas ke bawah)        | Horizontal (kiri ke kanan)   |
| Gunakan untuk    | Menyusun widget secara vertikal | Menyusun widget secara horizontal |
| Alignment        | `MainAxisAlignment` (vertikal)  | `MainAxisAlignment` (horizontal) |
| Cross Alignment  | `CrossAxisAlignment` (horizontal) | `CrossAxisAlignment` (vertikal) |


## Elemen input yang  digunakan pada halaman form pada proyek

Pada halaman form yang saya buat, satu-satunya elemen input yang digunakan adalah `TextFormField`. `TextFormField` digunakan untuk menerima input dari pengguna dan dapat memiliki validasi yang memastikan input sesuai dengan yang diharapkan. Pada aplikasi ini, `TextFormField` digunakan untuk memasukkan beberapa data seperti nama produk, deskripsi, harga, dan rating. Setiap `TextFormField` memiliki beberapa atribut penting, seperti:

1. `decoration`: Mengatur tampilan input, seperti hintText, labelText, dan border.
2. `onChanged`: Callback yang dipanggil setiap kali teks diubah, sehingga kita bisa memperbarui variabel  terkait.
3. `validator`: Fungsi yang digunakan untuk validasi input, memastikan data sesuai aturan yang kita tentukan (misalnya, tidak boleh kosong atau harus berupa angka).

Berikut adalah contoh TextFormField yang digunakan untuk memasukkan nama produk.

```dart
Padding(
  padding: const EdgeInsets.all(8.0),
  child: TextFormField(
    decoration: InputDecoration(
      hintText: "Nama Produk", // Teks contoh yang muncul di dalam field saat kosong
      labelText: "Nama Produk", // Label yang muncul di atas atau dalam field
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5.0), // Membuat border melengkung
      ),
    ),
    onChanged: (String? value) {
      setState(() {
        _nama = value!; // Memperbarui variabel _nama setiap kali ada perubahan
      });
    },
    validator: (String? value) {
      if (value == null || value.isEmpty) {
        return "Nama Produk tidak boleh kosong!"; // Pesan error jika input kosong
      }
      return null; // Validasi berhasil jika input tidak kosong
    },
  ),
),
```

#### Elemen Input Flutter yang Tidak Digunakan dalam Goodsify

1. **Checkbox**  
    Checkbox adalah widget input yang memungkinkan pengguna untuk membuat pilihan boolean, seperti memilih antara "ya" atau "tidak".

2. **Radio Button**  
    Radio button memungkinkan pengguna untuk memilih satu opsi dari beberapa pilihan yang disediakan.

3. **Dropdown Button**  
    Dropdown button menyediakan daftar pilihan dalam bentuk dropdown, memungkinkan pengguna memilih satu nilai dari beberapa opsi.

4. **Switch**  
    Switch adalah widget mirip Checkbox, tetapi tampilannya seperti saklar on/off, yang biasa digunakan untuk pilihan aktif/nonaktif.

5. **Slider**  
    Slider memungkinkan pengguna memilih nilai dalam rentang tertentu dengan menggeser tombol pada sumbu horizontal.

6. **DatePicker dan TimePicker**  
    DatePicker dan TimePicker adalah widget yang menyediakan antarmuka bagi pengguna untuk memilih tanggal dan waktu.


## cara  mengatur tema (theme) dalam aplikasi Flutter

Dalam aplikasi Flutter, kita dapat mengatur tema pada widget `MaterialApp`, yang berfungsi seperti file `base.html` pada website. Widget ini menjadi referensi tema utama bagi seluruh widget dalam aplikasi, sehingga komponen lainnya dapat mengikuti gaya dan skema warna yang telah ditentukan.Pada aplikasi yang saya buat, tema dasar diatur melalui `MaterialApp` seperti contoh berikut:

```dart 
MaterialApp(
  title: 'Goodsify',
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
        .copyWith(secondary: Colors.deepPurple[400]),
    useMaterial3: true,
  ),
  home: MyHomePage(),
);
```

Setelah tema utama diatur, elemen lain dalam aplikasi dapat mengambil referensi dari tema ini untuk menjaga konsistensi tampilan. Berikut adalah contoh implementasi tema pada salah satu elemen di aplikasi saya:

```dart 
AppBar(
  title: const Text('Goodsify'),
  backgroundColor: Theme.of(context).colorScheme.primary,
);
```

## Cara navigasi dalam aplikasi dengan banyak halaman pada Flutter

Untuk mengatur supaya tiadk pusing dalam navigasi banyaknya halaman di Flutter, aku membagi bagian bagiannya dalam folder yang berbeda. Aku membuat folder `screens` yang berisikan halaman halaman yang nantinya akan ditampilkan dalam aplikasi. Folder ini berisi `menu.dart` untuk main page dan `productentry_vorm.dart` untuk halaman forum produk. Selain folder `screens` aku juga membuat folder `widgets` yang berisi `widgets` atau bagian bagian dari aplikasi ini. ini berisi `left_drawer.dart` dan `product_card.dart`. Nantinya mereka akan dihubungkan melalui function `import`. Untuk emnghubungkan `widget` dengan `screen`, aku menggunakan fungsi `Navigator.push` dan `Navigator.pushReplacement`. 

</details>