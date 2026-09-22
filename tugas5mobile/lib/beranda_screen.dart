import 'package:flutter/material.dart';

import 'detail_screen.dart';

class BerandaScreen extends StatelessWidget {
  const BerandaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> katalog = [
      {
        'nama': 'Katalog 1',
        'harga': 'Rp 50.000',
        'desc': 'Deskripsi singkat produk 1.',
      },
      {
        'nama': 'Katalog 2',
        'harga': 'Rp 75.000',
        'desc': 'Deskripsi singkat produk 2.',
      },
      {
        'nama': 'Katalog 3',
        'harga': 'Rp 100.000',
        'desc': 'Deskripsi singkat produk 3.',
      },
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Beranda Katalog')),
      body: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: const Icon(Icons.shopping_bag),
              title: Text(katalog[index]['nama']!),
              subtitle: const Text('Ketuk untuk melihat detail'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DetailScreen(dataKatalog: katalog[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
