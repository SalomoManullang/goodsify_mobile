# goodsify

# TUGAS 7: Elemen Dasar Flutter
<details>
  <summary></summary>

## Pengerjaan Project Flutter

1. Instalasi Flutter di Windows

    ### Langkah 1: Unduh Flutter SDK
    1. Buka situs resmi Flutter di [flutter.dev](https://flutter.dev) dan unduh Flutter SDK untuk Windows.
    2. Ekstrak file `.zip` Flutter yang telah diunduh ke direktori pilihan Anda, misalnya `C:\src\flutter` (hindari direktori seperti `C:\Program Files` yang memerlukan izin administrator).

    ### Langkah 2: Tambahkan Flutter ke PATH
    1. Buka pengaturan **Environment Variables** di Windows:
      - Klik kanan pada **This PC** atau **Computer** > **Properties** > **Advanced system settings** > **Environment Variables**.
    2. Di bagian **System variables**, cari variabel `Path` dan klik **Edit**.
    3. Tambahkan path ke folder `bin` dari Flutter SDK, misalnya `C:\src\flutter\bin`.
    4. Klik **OK** untuk menyimpan perubahan.

    ### Langkah 3: Verifikasi Instalasi Flutter
    1. Buka **Command Prompt** atau **PowerShell**.
    2. Jalankan perintah berikut untuk memastikan instalasi berhasil:
      ```bash
      flutter doctor
      ```

    ### Langkah 4: Instal IDE untuk Pengembangan Flutter
    
    Download Visual Studio Code dan Android Studio

    ### Langkah 5: Membuat Proyek Flutter Baru

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

### Fungsi `const` di Flutter?

1. **Menghemat Memori**  
   Ketika kita menggunakan `const`, Flutter tidak membuat ulang objek setiap kali dibutuhkan. Sebaliknya, Flutter akan memakai objek yang sama (reuse) berulang kali, sehingga penggunaan memori jadi lebih efisien.

2. **Mengurangi Beban Rendering**  
   Widget yang didefinisikan sebagai `const` tidak perlu di-render ulang jika isinya tidak berubah. Ini berarti Flutter tidak harus menggambar ulang widget tersebut, yang membuat performa aplikasi lebih mulus dan stabil.

3. **Mempercepat Waktu Kompilasi**  
   Karena nilai-nilai `const` sudah tetap sejak awal, Flutter bisa memprosesnya lebih cepat saat kompilasi. Hasilnya, aplikasi lebih cepat dan kemungkinan error runtime berkurang.
  
### Kapan Sebaiknya Gunakan `const`?

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

### Kapan sebaiknya tidak gunakan `Const`?

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


### Perbandingan `Column` vs `Row`

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

### Elemen Input Flutter yang Tidak Digunakan dalam Goodsify

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

# TUGAS 9: Integrasi Layanan Web Django dengan Aplikasi Flutter

<details>
  <summary></summary>

## Pengerjaan Project 

### membuat fitur authentikasi pada djago dan mengintegrasikannya pada Flutter

1. **buat `django-app` bernama `authentication` pada project django sebelumnya**
    ini nantinya akan digunakan sebagai penghubung authentikasi antara project di django dan project di Flutter. tidak lupa aku juga menambahkan app nya pada `setting.py` agar bisa dijalankan. 

2. **membuat function login dan register pada `views.py` di `authentication`

    function ini nantinya akan digunakan untuk mengambil informasi dari flutter dan menjalankan proses login dan register disini. 

    ```bash
    @csrf_exempt
    def login(request):
        username = request.POST['username']
        password = request.POST['password']
        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                auth_login(request, user)
                # Status login sukses.
                return JsonResponse({
                    "username": user.username,
                    "status": True,
                    "message": "Login sukses!"
                    # Tambahkan data lainnya jika ingin mengirim data ke Flutter.
                }, status=200)
            else:
                return JsonResponse({
                    "status": False,
                    "message": "Login gagal, akun dinonaktifkan."
                }, status=401)

        else:
            return JsonResponse({
                "status": False,
                "message": "Login gagal, periksa kembali email atau kata sandi."
            }, status=401)

    @csrf_exempt
    def register(request):
        if request.method == 'POST':
            data = json.loads(request.body)
            username = data['username']
            password1 = data['password1']
            password2 = data['password2']

            # Check if the passwords match
            if password1 != password2:
                return JsonResponse({
                    "status": False,
                    "message": "Passwords do not match."
                }, status=400)
            
            # Check if the username is already taken
            if User.objects.filter(username=username).exists():
                return JsonResponse({
                    "status": False,
                    "message": "Username already exists."
                }, status=400)
            
            # Create the new user
            user = User.objects.create_user(username=username, password=password1)
            user.save()
            
            return JsonResponse({
                "username": user.username,
                "status": 'success',
                "message": "User created successfully!"
            }, status=200)
        
        else:
            return JsonResponse({
                "status": False,
                "message": "Invalid request method."
            }, status=400)
    ```
    Setelah itu tidak lupa juga aku menghubungkan functionnya di `urls.py` agar bisa berjalan dengan lancar. 

3. **membuat page login dan register dan menghubungkannya dengan django**

    pertama tama, aku menginstall package yang dibutuhkan 
    ```bash 
    flutter pub add provider
    flutter pub add pbp_django_auth
    ```

    kemudian, pada berkas `main.dart` aku juga menambahkan kode ini supaya bisa terhubung
    ```bash
        return Provider(
      create: (_) {
        CookieRequest request = CookieRequest();
        return request;
      },
      ```

      kemudian, aku membuat file baru bernama `register.dart` dan `login.dart` sebagai tampilan dari page register dan login yang nantinya akan diimplementasikan. untuk menghubungkan antara flutter dan django, aku juga menambahkan kode ini :
      ```bash 
            final response = await request
          .login("http://127.0.0.1:8000/auth/login/", {
        'username': username,
        'password': password,
      });

        final response = await request.postJson(
      "http://127.0.0.1:8000/auth/register/",
      jsonEncode({
        "username": username,
        "password1": password1,
        "password2": password2,
      }));
      ```
      kedua kode ini bertujuan untuk menghubungkan antara local server yang berisi project django yang sudah kita buat dengan project flutter ini, sehingga nantinya antara local dan flutter akan terhubung, akun yang sudah dibuat di local juga akan muncul di flutter.

### membuat model kustom untuk aplikasi

pertama tama, aku harus mengambil endpoint json dari project django ku sebelumnya. aku menambahkan `/json` pada link localhost project django, nanti akan memunculkan daftar produk dan atribut dari produk tersebut, kemudian aku akan copy semuanya dan masuk ke website `quicktype` dan paste kode json tersebut, nanti aku akan mendapatkan kode berisi model kustom untuk produk yang kubuat, kemudian aku akan copy kodenya. Kembali ke project flutter, aku membuat folder berisi file yang bernama `product_entry.dart` yang berisi informasi modelproduk. Kemudian aku paste kode dari `quicktype` dan itulah kode custom yang sudah kubuat.

### membuat page berisi list produk yang ada

1. **buat page baru untuk list produk**

    pertama tama, aku membuat page baru bernama `list_productentry.dart` Page ini nantinya akan berguna sebagai page untuk menunjukkan produk yang ada pada aplikasi.

2. **fetch data dari server django**
  
    Pertama tama, dalam `list_productentry.dart` aku menambahkan kode ini
    ```bash
        final response = await request.get('http://127.0.0.1:8000/json/');
    ```
    kode ini bertujuan untuk mendapatkan request dari json di local server. Kemudian, aku menambahkan semua data dalam bentuk json menjadi daftar data yang akan ditunjukkan dalam page ini.
    ```bash
      List<ProductEntry> listProduct = [];
      for (var d in data) {
        if (d != null) {
          listProduct.add(ProductEntry.fromJson(d));
        }
      }
      return listProduct;
    ```

    kemudian aku membuat card baru dimana gambar, nama, harga, rating dan lokasi dari produk akan ditunjukkan di page tersebut, untuk deskripsi nantinya akan ditunjukkan secara full ketika kartu produk ditekan.

3. **buat tombol bisa di klik**
    untuk dapat mengakses page tersebut, maka kita perlu membuat conditional jika tombol `product list` ditekan oleh pengguna. 
    ```bash
        onTap: () {
          // Route menu ke halaman mood
          Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductEntryPage()),
          );
    ```
    ```bash
        else if (item.name == "Lihat Mood") {
          Navigator.push(context,
              MaterialPageRoute(
                  builder: (context) => const ProductEntryPage()
              ),
          );
      }
    ```
    kedua kode tersebut memastikan ketika tombol di left drawer maupun tombol di menu ditekan, maka akan mengalihkan ke product list.

### Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item.

1. **membuat page berisi detail dari produk**

    pertama tama, aku membuat page baru bernama `productdetail.dart` Page ini nantinya akan berguna sebagai page untuk menunjukkan detail produk yang di klik .

2. **modifikasi list produk**
  
    pada list produk sebelumnya, produk hanya ditampilkan saja, namun kali ini saya membuatnya menjadi semacam card yang dapat mendeteksi sekiranya card tersebut di klik sehingga nantinya akan membawa ke product detail page. 

    ```bash 
      return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailPage(
              product: product, // Kirim objek 'Fields' ke halaman detail
    ```

    dengan kode ini, sekiranya kartunya di klik, maka akan diarahkan ke `ProductDetailPage`

## Custom Model untuk pengambilan dan pengiriman data JSON

### Mengapa Kita Perlu Membuat Model untuk JSON?

1. **Meningkatkan **Type Safety** dan **Autocompletion****

    - Saat bekerja dengan **JSON** di Dart, tanpa model, data yang diambil dari server berupa `Map<String, dynamic>`. Ini berarti kita tidak mengetahui tipe data yang pasti hingga runtime.
    - Dengan menggunakan model, kita bisa mendapatkan **type safety** yang membantu mengurangi kesalahan akses data. Misalnya, dengan model, kita bisa menulis `user.name` daripada `data['name']`, yang lebih rentan terhadap kesalahan penulisan (**typo**).
    - Model juga memungkinkan fitur **autocompletion** di IDE, sehingga pengembangan lebih cepat dan aman.

2. **Membuat Kode Lebih **Terstruktur** dan **Mudah Dipelihara****
    - Dengan membuat model, tanggung jawab untuk mem-parsing data **JSON** dipindahkan ke dalam model itu sendiri. Ini membuat kode lebih **bersih** dan **terstruktur**.
    - Dalam proyek yang lebih besar, memisahkan logika parsing dari logika bisnis akan membuat kode lebih mudah untuk **diubah** dan **diperbaiki** jika format data JSON dari server berubah.

3. **Mempermudah **Serialisasi** dan **Deserialisasi****
    - Model yang memiliki metode `fromJson` dan `toJson` memungkinkan kita dengan mudah melakukan **konversi dari JSON ke objek Dart**, dan sebaliknya.
    - Hal ini sangat membantu ketika kita perlu mengirim data kembali ke server dalam format **JSON**.

4. **Mencegah **Error** di **Runtime****
    - Tanpa model, kesalahan akses data (misalnya, **typo** pada kunci JSON) hanya akan terdeteksi saat aplikasi berjalan (**runtime**). Ini bisa menyebabkan **crash** yang tidak terduga.
    - Dengan model, kesalahan tersebut dapat dideteksi lebih awal, yaitu saat **compile-time**, sehingga aplikasi lebih **stabil**.

---

### Apakah Akan Terjadi Error Jika Tidak Membuat Model?

Ya, potensi terjadinya **error** akan lebih tinggi jika kita tidak menggunakan model, terutama pada aplikasi yang kompleks.

1. **Kesalahan Tipe Data**
    - Tanpa model, saat kita mencoba mengakses data dari `Map<String, dynamic>`, kesalahan tipe bisa terjadi jika server mengirimkan data yang tidak sesuai dengan yang diharapkan.
  
    **Contoh**:
    ```dart
    var data = jsonDecode(jsonString);
    int price = data['price']; // Jika 'price' ternyata berisi null atau string, akan terjadi error.
    ```

2. **Kurangnya Validasi Data**
    - Tanpa model, kita harus secara manual memeriksa apakah setiap kunci yang diakses benar-benar ada di JSON. Jika tidak, aplikasi bisa **crash** karena mencoba mengakses atribut yang tidak ada.

3. **Sulit Dipelihara dan Diperluas**
    - Jika kita tidak menggunakan model, kita harus mengakses data JSON langsung melalui `Map`, yang membuat kode lebih rentan terhadap **kesalahan**.
    - Jika struktur **JSON** berubah, kita harus memperbaiki semua bagian kode yang mengakses data tersebut, yang bisa menjadi pekerjaan yang melelahkan dan rentan kesalahan.

---

### Kesimpulan

Dengan menggunakan model, kita memastikan bahwa data **JSON** yang kita terima dan kirim sesuai dengan format yang diharapkan, sehingga aplikasi lebih **aman**, **stabil**, dan **mudah dipelihara**.

## Fungsi library `http` pada project

### Fungsi Library `http`

Pada tugas ini, library `http` digunakan untuk **menghubungkan aplikasi Flutter** dengan server yang menyediakan data dalam format **JSON**, serta untuk **mengirim data** ke server.

1. **Melakukan Permintaan GET**
   - Pada tugas ini, fungsi `http.get()` digunakan untuk **mengambil data JSON** dari server.
   - Data yang diterima dari server kemudian **didekode** menggunakan `jsonDecode()` agar dapat diubah menjadi objek Dart yang dapat diolah lebih lanjut.
   
   **Contoh Implementasi:**
   ```dart
   Future<List<ProductEntry>> fetchProduct(CookieRequest request) async {
     final response = await request.get('http://127.0.0.1:8000/json/');
     var data = response;
     List<ProductEntry> listProduct = [];
     for (var d in data) {
       if (d != null) {
         listProduct.add(ProductEntry.fromJson(d));
       }
     }
     return listProduct;
   }
   ```
   - Pada contoh di atas, data produk diambil dari server melalui URL `http://127.0.0.1:8000/json/`.
   - Data yang diperoleh kemudian dikonversi menjadi objek `ProductEntry` menggunakan metode `fromJson()`.

2. **Mengirim Data dengan Metode POST (jika diperlukan)**
   - Fungsi `http.post()` dapat digunakan untuk **mengirim data** dari aplikasi ke server. Hal ini berguna ketika kita ingin menyimpan data baru ke dalam basis data di server, seperti menambahkan produk baru atau memperbarui informasi pengguna.
   - Pada tugas ini, fungsi POST dapat digunakan pada fitur **menambah produk** melalui formulir yang disediakan.

   **Contoh:**
   ```dart
   Future<void> addProduct(Product product) async {
     final response = await http.post(
       Uri.parse('http://127.0.0.1:8000/add-product/'),
       headers: {'Content-Type': 'application/json'},
       body: jsonEncode(product.toJson()),
     );
     if (response.statusCode == 201) {
       print("Product added successfully");
     } else {
       print("Failed to add product");
     }
   }
   ```
   - Pada contoh di atas, data produk dikirim ke server menggunakan `http.post()`, dan data dikirim dalam format **JSON** menggunakan `jsonEncode()`.

### Mengapa Library `http` Diperlukan?
1. **Menghubungkan Aplikasi dengan API atau Backend**
   - Aplikasi mobile yang dinamis memerlukan data dari server untuk diambil atau dikirim. Library `http` memfasilitasi hal ini, memungkinkan Flutter berkomunikasi dengan server menggunakan protokol HTTP.

2. **Mendukung Operasi CRUD (Create, Read, Update, Delete)**
   - Dengan `http`, aplikasi dapat melakukan **GET, POST, PUT, DELETE**, sehingga kita bisa melakukan berbagai operasi pada data di server.

3. **Membantu Dalam Pengambilan dan Pengiriman Data JSON**
   - Sebagian besar API modern menggunakan **JSON** sebagai format pertukaran data. Library `http` mempermudah pengambilan dan pengiriman data dalam format JSON, serta konversinya ke objek Dart.


## `CookieRequest` pada Flutter

### Fungsi `CookieRequest`

Pada tugas ini, `CookieRequest` digunakan untuk:
1. **Menyimpan cookies** yang diterima dari server (misalnya saat login).
2. **Mengirim cookies** tersebut kembali ke server pada setiap permintaan HTTP berikutnya.
3. **Mengelola status autentikasi** pengguna, sehingga memungkinkan pengguna tetap **login** selama sesi aplikasi berjalan tanpa perlu memasukkan kredensial berulang kali.

### Cara Kerja `CookieRequest`
`CookieRequest` melakukan semua operasi HTTP (seperti `GET` atau `POST`) dengan **menyertakan cookies** dalam header setiap permintaan. Ini berguna untuk **mempertahankan sesi** yang konsisten antara klien (aplikasi Flutter) dan server, terutama ketika server membutuhkan autentikasi.

### Contoh Implementasi `CookieRequest`
Misalnya, untuk melakukan login:
```dart
final request = context.read<CookieRequest>();
final response = await request.post(
  'http://127.0.0.1:8000/auth/login/',
  {
    'username': username,
    'password': password,
  },
);

if (response['status'] == true) {
  print("Login berhasil");
} else {
  print("Login gagal");
}
```

Pada contoh di atas:
1. Pengguna memasukkan username dan password.
2. `CookieRequest` mengirim permintaan `POST` ke server untuk login.
3. Jika login berhasil, server akan mengirim **cookies** yang kemudian disimpan oleh `CookieRequest`.
4. Cookies tersebut digunakan pada **setiap permintaan** berikutnya untuk memastikan pengguna tetap login.

### Mengapa `CookieRequest` Perlu Dibagikan ke Semua Komponen di Aplikasi?
Di dalam aplikasi Flutter, kita sering membutuhkan data dari server yang memerlukan **autentikasi**. Agar pengalaman pengguna mulus, kita ingin pengguna **tetap login** selama mereka menggunakan aplikasi, tanpa harus memasukkan kredensial berulang kali.

### Alasan `CookieRequest` Dibagikan:
1. **Mempertahankan Sesi Pengguna:**
   - `CookieRequest` menyimpan cookies yang diterima saat login. Dengan **membagikan instance `CookieRequest`** ke seluruh aplikasi, semua komponen dapat **menggunakan cookies yang sama** untuk permintaan HTTP berikutnya.
   - Ini memastikan bahwa pengguna tetap terautentikasi di seluruh aplikasi tanpa harus login ulang.

2. **Menghindari Duplikasi Objek:**
   - Jika setiap komponen aplikasi membuat instance `CookieRequest` sendiri, sesi pengguna bisa menjadi tidak konsisten. Dengan **menggunakan satu instance `CookieRequest`** yang dibagikan, kita dapat memastikan bahwa semua permintaan HTTP dilakukan dengan **cookies yang sama**, sehingga mempertahankan sesi yang stabil.

3. **Menyederhanakan Manajemen Autentikasi:**
   - Dengan menggunakan `Provider` untuk membagikan `CookieRequest`, kita dapat **mengaksesnya dengan mudah di berbagai halaman dan widget** di aplikasi tanpa harus menginisialisasi ulang atau mengonfigurasi ulang setiap kali.
   - Hal ini memudahkan untuk melakukan operasi seperti **memeriksa apakah pengguna sudah login**, **mengambil data yang membutuhkan autentikasi**, atau **logout**.

## pengiriman data pada Flutter 

1. **Tahap Input Data oleh Pengguna**

    Pertama-tama, pengguna akan memasukkan data melalui form input di aplikasi Flutter. Data ini dapat berupa informasi seperti **nama produk**, **harga**, **deskripsi**, **rating**, dan **gambar produk**.

    ```dart
    TextField(
      controller: nameController,
      decoration: InputDecoration(labelText: 'Product Name'),
    ),
    TextField(
      controller: priceController,
      decoration: InputDecoration(labelText: 'Price'),
      keyboardType: TextInputType.number,
    ),
    TextField(
      controller: descriptionController,
      decoration: InputDecoration(labelText: 'Description'),
    ),
    ElevatedButton(
      onPressed: () {
        final productData = {
          'name': nameController.text,
          'price': int.parse(priceController.text),
          'description': descriptionController.text,
        };
        submitData(productData);
      },
      child: Text('Submit'),
    );
    ```

    **Penjelasan:**
    - Pengguna memasukkan data pada **TextField**.
    - Setelah pengguna menekan tombol **Submit**, data akan dikumpulkan dan disimpan dalam sebuah **Map** bernama `productData`.
    - Fungsi `submitData(productData)` kemudian dipanggil untuk **mengirim data** ke server.

2. **Tahap Pengiriman Data ke Server**

    Setelah data diinput oleh pengguna, langkah berikutnya adalah mengirimkan data tersebut ke server menggunakan **HTTP request**. Pada contoh ini, kita menggunakan **`CookieRequest`** yang mengelola sesi dan autentikasi pengguna.

    ```dart
    Future<void> submitData(Map<String, dynamic> productData) async {
      final request = context.read<CookieRequest>();
      final response = await request.post(
        'http://127.0.0.1:8000/api/products/',
        productData,
      );

      if (response['status'] == true) {
        print("Data berhasil dikirim");
      } else {
        print("Terjadi kesalahan");
      }
    }
    ```

    **Penjelasan:**
    - **`CookieRequest`** digunakan untuk mengirim data dengan metode `POST` ke server.
    - Jika data berhasil dikirim, server akan memberikan respons berupa `{ "status": true }`.


3. **Tahap Penyimpanan Data di Server**

    Setelah data diterima oleh server, data tersebut diproses dan disimpan di **database**. Backend, seperti Django, akan menerima data JSON, melakukan parsing, validasi, dan menyimpan data ke dalam database.

    ```python
    @api_view(['POST'])
    def add_product(request):
        if request.method == 'POST':
            data = json.loads(request.body)
            product = Product(
                name=data['name'],
                price=data['price'],
                description=data['description'],
                user=request.user,
            )
            product.save()
            return JsonResponse({'status': True, 'message': 'Product added successfully'})
    ```
    **Penjelasan:**
    - Data JSON yang dikirim dari Flutter diakses melalui `request.body`.
    - Server membuat entitas produk baru dan menyimpannya ke database.

4. **Tahap Pengambilan Data dari Server ke Flutter**

    Setelah data berhasil disimpan, langkah berikutnya adalah **mengambil data dari server** dan menampilkannya di aplikasi Flutter. Ini dilakukan dengan **HTTP GET request**.

    ```dart
    Future<List<Product>> fetchProducts() async {
      final request = context.read<CookieRequest>();
      final response = await request.get('http://127.0.0.1:8000/api/products/');
      
      List<Product> products = [];
      for (var productJson in response) {
        products.add(Product.fromJson(productJson));
      }
      return products;
    }
    ```

    **Penjelasan:**
    - **`CookieRequest`** digunakan untuk melakukan **GET request** ke server.
    - Data yang diterima dari server berupa JSON, yang kemudian diubah menjadi objek `Product` menggunakan metode `fromJson`.

5. **Tahap Menampilkan Data di Flutter**

    Setelah data berhasil diambil dari server, data tersebut akan ditampilkan di aplikasi Flutter menggunakan widget seperti **ListView** atau **Card**.

    ```dart
    FutureBuilder(
      future: fetchProducts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else {
          final products = snapshot.data ?? [];
          return ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.name),
                subtitle: Text('Price: Rp ${product.price}'),
              );
            },
          );
        }
      },
    );
    ```

    **Penjelasan:**
    - `FutureBuilder` digunakan untuk menangani **pengambilan data** secara asinkron.
    - Data yang diambil ditampilkan dalam bentuk **ListView**.

##  alur login, register, dan logout pada project

1. **Tahap Registrasi (Register)**

    - Pengguna memasukkan **username**, **email**, dan **password** pada form registrasi di Flutter.
    - Flutter mengirim data yang diinput pengguna ke server Django melalui **HTTP POST request**.
    - Server Django menerima data, memvalidasi, dan menyimpan informasi pengguna ke dalam **database**.
    - Jika registrasi berhasil, pengguna akan mendapatkan notifikasi di aplikasi Flutter.

2. **Tahap Login**
    - Setelah mendaftar, pengguna dapat login dengan memasukkan **username** dan **password**.
    - Flutter mengirim data login ke server Django.
    - Django memeriksa apakah kombinasi username dan password benar. Jika valid, Django akan mengirimkan **cookies** sesi ke Flutter.
    - Flutter menyimpan cookies tersebut menggunakan **`CookieRequest`**, yang digunakan untuk menjaga **sesi tetap aktif**.
    - Setelah login berhasil, pengguna diarahkan ke halaman menu utama.

3. **Menampilkan Menu Setelah Login**
    - Setelah login berhasil, Flutter akan memeriksa apakah pengguna sudah terautentikasi dengan **cookies** yang disimpan.
    - Jika pengguna terautentikasi, mereka dapat mengakses halaman yang memerlukan **hak akses**.
    - Jika tidak ada cookies yang valid, pengguna akan diarahkan kembali ke halaman login.

4. **Tahap Logout**
    - Pengguna dapat keluar dari aplikasi dengan menekan tombol **Logout**.
    - Flutter mengirim permintaan logout ke server Django.
    - Django menghapus cookies sesi sehingga sesi pengguna diakhiri.
    - Setelah logout, pengguna diarahkan kembali ke halaman login.


</details>