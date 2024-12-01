import 'package:flutter/material.dart';
// github repository link: https://github.com/emsNikac/clothing_app.git
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("223235"),
      ),
      body: const ClothingList(),
    );
  }
}

class ClothingList extends StatelessWidget {
  const ClothingList({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> clothes = [
      {
        'name': 'Маица',
        'image': 'assets/tshirt.png',
        'description': 'Удобна памучна маица.',
        'price': '500 ден.'
      },
      {
        'name': 'Фармерки',
        'image': 'assets/trousers.png',
        'description': 'Сини фармерки.',
        'price': '1500 ден.'
      },
      {
        'name': 'Јакна',
        'image': 'assets/jacket.png',
        'description': 'Зимска јакна.',
        'price': '3000 ден.'
      },
      {
        'name': 'Патики',
        'image': 'assets/shoes.png',
        'description': 'Лесни патики за вежбање.',
        'price': '2500 ден.'
      },
      {
        'name': 'Капа',
        'image': 'assets/hat.png',
        'description': 'Капа за сонце.',
        'price': '300 ден.'
      },
      {
        'name': 'Џемпер',
        'image': 'assets/jumper.png',
        'description': 'Удобен волнен зимски џемпер.',
        'price': '2000 ден.'
      },
      {
        'name': 'Шал',
        'image': 'assets/scarf.jpg',
        'description': 'Зимски шал',
        'price': '700 ден.'
      },
      {
        'name': 'Ракавици',
        'image': 'assets/gloves.jpg',
        'description': 'Удобни волнени ракавици.',
        'price': '1200 ден.'
      },
      {
        'name': 'Шорцеви',
        'image': 'assets/shorts.png',
        'description': 'Удобни памучни шорцеви.',
        'price': '1000 ден.'
      },
      {
        'name': 'Чорапи',
        'image': 'assets/socks.png',
        'description': 'Меки памучни чорапи, сет од 3 пара.',
        'price': '500 ден.'
      },
      {
        'name': 'Сандали',
        'image': 'assets/sandals.jpg',
        'description': 'Сандали за песок и влажни површини.',
        'price': '1500 ден.'
      },
      {
        'name': 'Ремен',
        'image': 'assets/belt.png',
        'description': 'Кожен женски ремен.',
        'price': '900 ден.'
      },
    ];

    return ListView.builder(
      itemCount: clothes.length,
      itemBuilder: (context, index) {
        final item = clothes[index];
        return Card(
          child: ListTile(
            leading: item['image'].startsWith('assets/')
                ? Image.asset(item['image'])
                : Image.network(item['image']),
            title: Text(item['name']),
            subtitle: Text(item['price']),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailPage(item: item),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class DetailPage extends StatelessWidget {
  final Map<String, dynamic> item;

  const DetailPage({required this.item, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item['name']),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            item['image'].startsWith('assets/')
                ? Image.asset(item['image'])
                : Image.network(item['image']),
            const SizedBox(height: 16),
            Text(
              item['name'],
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              item['description'],
              style: const TextStyle(fontSize: 16),
            ),
            const Spacer(),
            Text(
              'Цена: ${item['price']}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
