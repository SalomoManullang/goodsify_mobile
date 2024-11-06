import 'package:flutter/material.dart';
import 'package:goodsify/widgets/left_drawer.dart';
import 'package:goodsify/widgets/product_card.dart';


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
      drawer: const LeftDrawer(),
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

