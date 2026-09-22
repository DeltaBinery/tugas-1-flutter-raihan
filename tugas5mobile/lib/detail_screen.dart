import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  final Map<String, String> dataKatalog;

  const DetailScreen({super.key, required this.dataKatalog});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int quantity = 1;
  bool isAddedToCart = false;

  void _incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void _decrementQuantity() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Detail Katalog')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.dataKatalog['nama']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Harga: ${widget.dataKatalog['harga']}',
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: const Color(0xFFFFE4E1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Text(
                widget.dataKatalog['desc']!,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const SizedBox(height: 24),

            // --- IMPLEMENTASI EVENT & STATE BARU ---
            const Text(
              'Jumlah Pesanan:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.remove_circle_outline),
                  onPressed: _decrementQuantity, // Event mengurangi
                ),
                Text(
                  '$quantity',
                  style: const TextStyle(fontSize: 18),
                ), // Tampilan state
                IconButton(
                  icon: const Icon(Icons.add_circle_outline),
                  onPressed: _incrementQuantity, // Event menambah
                ),
              ],
            ),
            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    isAddedToCart = true; // Event merubah status keranjang
                  });
                },
                icon: Icon(isAddedToCart ? Icons.check : Icons.shopping_cart),
                label: Text(
                  isAddedToCart
                      ? 'Berhasil ditambahkan ($quantity item)'
                      : 'Tambah ke Keranjang',
                  style: const TextStyle(fontSize: 16),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isAddedToCart ? Colors.green : Colors.blue,
                  foregroundColor: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
