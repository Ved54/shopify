import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'cart_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final String image;
  final String company;
  final String rating;
  final String reviews;
  final String title;
  final String price;
  final String cutoff;

  const ProductDetailsPage({
    Key? key,
    required this.image,
    required this.company,
    required this.rating,
    required this.reviews,
    required this.title,
    required this.price,
    required this.cutoff,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);
    final bool isInCart = cartProvider.isInCart(title);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: image,
              child: Image.asset(image, fit: BoxFit.fill),
            ),
            const SizedBox(height: 16),
            Text(title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Text(company, style: const TextStyle(color: Colors.grey)),
                const SizedBox(width: 8),
                Text("⭐️$rating ($reviews)", style: const TextStyle(color: Colors.grey)),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Text("₹$price", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(width: 8),
                Text("₹$cutoff", style: const TextStyle(color: Colors.grey, decoration: TextDecoration.lineThrough)),
              ],
            ),
            const SizedBox(height: 16),
            const Text(
              "A comfortable and stylish T-shirt made from soft, breathable fabric, perfect for everyday wear. Designed with a classic fit, it pairs effortlessly with any outfit, offering both versatility and ease.",
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isInCart
                    ? null
                    : () {
                  cartProvider.addItem(
                    image: image,
                    company: company,
                    title: title,
                    price: price,
                    cutoff: cutoff,
                  );
                  ScaffoldMessenger.of(context).hideCurrentSnackBar();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('$title added to cart!'),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                ),
                child: Text(
                  isInCart ? 'ALREADY IN CART' : 'ADD TO CART',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
