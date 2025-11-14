import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

// Model Class untuk Produk
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String imageUrl;
  final double rating;
  final int stock;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageUrl,
    required this.rating,
    required this.stock,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'imageUrl': imageUrl,
      'rating': rating,
      'stock': stock,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      price: map['price'],
      imageUrl: map['imageUrl'],
      rating: map['rating'],
      stock: map['stock'],
    );
  }
}

// Widget untuk Kartu Produk
class ProductCard extends StatelessWidget {
  final Product product;
  final VoidCallback onTap;

  const ProductCard({Key? key, required this.product, required this.onTap})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gambar Produk
              Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 8),

              // Nama Produk
              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 4),

              // Harga
              Text(
                'Rp ${product.price.toStringAsFixed(0)}',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),

              const SizedBox(height: 4),

              // Rating dan Stock
              Row(
                children: [
                  // Rating
                  Icon(Icons.star, color: Colors.amber, size: 16),
                  Text(' ${product.rating}', style: TextStyle(fontSize: 12)),

                  Spacer(),

                  // Stock
                  Text(
                    'Stok: ${product.stock}',
                    style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Halaman Home
class HomePage extends StatelessWidget {
  final List<Product> products;

  const HomePage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Commerce App'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.shopping_cart, size: 80, color: Colors.blue),
            const SizedBox(height: 20),
            const Text(
              'Selamat Datang di\nToko Online Kami',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              'Temukan ${products.length} produk terbaik untuk Anda',
              style: const TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductListPage(products: products),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 16,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Lihat Produk', style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman Daftar Produk
class ProductListPage extends StatelessWidget {
  final List<Product> products;

  const ProductListPage({Key? key, required this.products}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daftar Produk'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: products.isEmpty
          ? const Center(child: Text('Tidak ada produk tersedia'))
          : GridView.builder(
              padding: const EdgeInsets.all(8),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: products.length,
              itemBuilder: (context, index) {
                final product = products[index];
                return ProductCard(
                  product: product,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailPage(product: product),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}

// Halaman Detail Produk
class ProductDetailPage extends StatelessWidget {
  final Product product;

  const ProductDetailPage({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Gambar Produk
            Container(
              height: 300,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(product.imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Nama Produk
            Text(
              product.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 8),

            // Harga
            Text(
              'Rp ${product.price.toStringAsFixed(0)}',
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),

            const SizedBox(height: 16),

            // Rating dan Stock
            Row(
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.amber, size: 20),
                    const SizedBox(width: 4),
                    Text('${product.rating}', style: TextStyle(fontSize: 16)),
                  ],
                ),

                const SizedBox(width: 16),

                Text(
                  'Stok: ${product.stock}',
                  style: TextStyle(
                    fontSize: 16,
                    color: product.stock > 0 ? Colors.green : Colors.red,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            // Deskripsi
            const Text(
              'Deskripsi Produk:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              product.description,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            ),

            const SizedBox(height: 24),

            // Tombol Beli
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: product.stock > 0
                    ? () {
                        _showSuccessDialog(context);
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Beli Sekarang',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Berhasil'),
        content: const Text('Produk berhasil ditambahkan ke keranjang!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}

// Main App
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // Data produk contoh
  List<Product> getSampleProducts() {
    return [
      Product(
        id: '1',
        name: 'Smartphone XYZ',
        description:
            'Smartphone canggih dengan kamera 108MP, RAM 8GB, dan baterai 5000mAh. Cocok untuk gaming dan fotografi profesional. Dilengkapi dengan layar AMOLED 6.7 inci dan fast charging 65W.',
        price: 3500000,
        imageUrl:
            'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400',
        rating: 4.5,
        stock: 15,
      ),
      Product(
        id: '2',
        name: 'Laptop Gaming',
        description:
            'Laptop gaming dengan processor Intel i7 generasi terbaru, GPU RTX 3060 6GB, RAM 16GB DDR5, dan layar 15.6 inci 144Hz. Performa maksimal untuk semua game terbaru dan produktivitas.',
        price: 15000000,
        imageUrl:
            'https://images.unsplash.com/photo-1603302576837-37561b2e2302?w=400',
        rating: 4.8,
        stock: 8,
      ),
      Product(
        id: '3',
        name: 'Headphone Wireless',
        description:
            'Headphone wireless premium dengan active noise cancellation, baterai 30 jam, konektivitas Bluetooth 5.0, dan kualitas suara Hi-Res. Nyaman digunakan sepanjang hari.',
        price: 1200000,
        imageUrl:
            'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
        rating: 4.3,
        stock: 25,
      ),
      Product(
        id: '4',
        name: 'Smart Watch Pro',
        description:
            'Smartwatch dengan monitor detak jantung, GPS built-in, tahan air 50m, dan baterai 7 hari. Cocok untuk olahraga dan aktivitas sehari-hari dengan notifikasi smartphone.',
        price: 850000,
        imageUrl:
            'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400',
        rating: 4.6,
        stock: 0,
      ),
      Product(
        id: '5',
        name: 'Kamera DSLR Pro',
        description:
            'Kamera DSLR profesional dengan sensor full-frame 24.2MP, video 4K 60fps, sistem autofocus 45 titik, dan ISO 100-51200. Ideal untuk fotografer profesional dan videographer.',
        price: 8500000,
        imageUrl:
            'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400',
        rating: 4.7,
        stock: 5,
      ),
      Product(
        id: '6',
        name: 'Tablet Android Premium',
        description:
            'Tablet Android dengan layar 10.1 inci 2K, RAM 6GB, storage 128GB, dan baterai 8000mAh. Sempurna untuk bekerja, belajar online, dan hiburan dengan performa smooth.',
        price: 2800000,
        imageUrl:
            'https://images.unsplash.com/photo-1561154464-82e9adf32764?w=400',
        rating: 4.2,
        stock: 12,
      ),
      Product(
        id: '7',
        name: 'Speaker Bluetooth',
        description:
            'Speaker Bluetooth portable dengan sound 360°, bass yang powerful, dan baterai 12 jam. Tahan air IPX7, perfect untuk party outdoor dan kegiatan traveling.',
        price: 650000,
        imageUrl:
            'https://images.unsplash.com/photo-1608043152269-423dbba4e7e1?w=400',
        rating: 4.4,
        stock: 18,
      ),
      Product(
        id: '8',
        name: 'Keyboard Mechanical',
        description:
            'Keyboard mechanical gaming dengan switch Red, RGB lighting, anti-ghosting, dan build quality premium. Responsif untuk gaming dan mengetis yang nyaman.',
        price: 950000,
        imageUrl:
            'https://images.unsplash.com/photo-1541140532154-b024d705b90a?w=400',
        rating: 4.5,
        stock: 10,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce App',
      theme: ThemeData(primarySwatch: Colors.blue, useMaterial3: true),
      home: HomePage(products: getSampleProducts()),
      debugShowCheckedModeBanner: false,
    );
  }
}
