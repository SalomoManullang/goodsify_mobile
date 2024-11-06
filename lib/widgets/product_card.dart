import 'package:flutter/material.dart';
import 'package:goodsify/screens/productentry_form.dart';

class ShopItem {
  final String name;
  final IconData icon;
  final Color color; // Tambahkan properti warna

  ShopItem(this.name, this.icon, this.color);
}

class ShopCard extends StatelessWidget {
  final ShopItem item;

  const ShopCard(this.item, {super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return Material(
      color: item.color, // Gunakan warna dari ShopItem
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: () {
          if (item.name == "Add Product") {
            // Navigasi ke form ProductEntryForm ketika "Add Product" dipencet
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ProductEntryFormPage()),
            );
          } else {
            // Menampilkan SnackBar untuk item lainnya
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                  content: Text("Kamu telah menekan tombol ${item.name}!")));
          }
        },
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  item.icon,
                  color: Colors.white,
                  size: 24.0, // Ukuran ikon
                ),
                const Padding(padding: EdgeInsets.all(3)),
                Text(
                  item.name,
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 14), // Ukuran teks
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content; 

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0, // Tingkat bayangan yang sedikit lebih tinggi
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0), // Membuat sudut melengkung lebih halus
      ),
      color: Colors.white, // Warna background untuk InfoCard
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0), // Margin luar untuk jarak antar kartu
      child: Container(
        width: MediaQuery.of(context).size.width / 3.5, // Lebar kartu disesuaikan dengan layar
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0), // Padding dalam kartu
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Mengatur konten ke sisi kiri
          children: [
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0, // Ukuran font yang sedikit lebih besar untuk judul
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              content,
              style: const TextStyle(
                fontSize: 14.0, // Ukuran font yang lebih kecil untuk konten
              ),
            ),
          ],
        ),
      ),
    );
  }
}