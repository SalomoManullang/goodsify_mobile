import 'package:flutter/material.dart';
import 'package:goodsify/models/product_entry.dart';

class ProductDetailPage extends StatelessWidget {
  final Fields product;

  const ProductDetailPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          product.name,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Gambar produk di bagian atas
            ClipRRect(
              borderRadius: BorderRadius.circular(15.0),
              child: Container(
                color: Colors.grey[200],
                child: ( product.imageUrl.isNotEmpty)
                    ? Image.network(
                        product.imageUrl,
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.contain, // Menjaga proporsi gambar
                        alignment: Alignment.center,
                      )
                    : const SizedBox(
                        height: 250,
                        child: Center(child: Text("No Image Available")),
                      ),
              ),
            ),
            const SizedBox(height: 20),

            // Nama Produk
            Text(
              product.name,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 20),

            // Informasi Produk
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Product Information",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    const Divider(),
                    
                    // Harga
                        const Text("Price:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        Text(
                          "Rp ${product.price}",
                          style: const TextStyle(fontSize: 18),
                        ),
                      
                    
                    const SizedBox(height: 10),

                    // Deskripsi
                    const Text("Description:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    // Lokasi
                    const Text("Location:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text(
                      product.city,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 20),

                    // Rating
                    Row(
                      children: [
                        const Text("Rating:",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w600)),
                        const SizedBox(width: 10),
                        Row(
                          children: List.generate(
                            product.rating,
                            (index) => const Icon(
                              Icons.star,
                              color: Colors.yellow,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // Stok
                    const Text("Stock:",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600)),
                    Text(
                      "${product.stok} items available",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Tombol Kembali
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back),
              label: const Text("Back to Products"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
