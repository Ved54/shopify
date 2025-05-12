import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'product.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/logo.png", height: 30, width: 30),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Badge(
              label: Text('3'),
              child: Icon(size: 30, CupertinoIcons.bell),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            Image.asset(
              "assets/banner.jpeg",
              height: 150,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.fill,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Shop By Category",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("See all", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  _buildCategoryList("assets/men.jpg", "Men"),
                  const SizedBox(width: 25),
                  _buildCategoryList("assets/women.jpg.avif", "Women"),
                  const SizedBox(width: 25),
                  _buildCategoryList("assets/kids.jpg.avif", "Kids"),
                  const SizedBox(width: 25),
                  _buildCategoryList("assets/baby.jpeg", "Baby"),
                  const SizedBox(width: 25),
                  _buildCategoryList("assets/teen.jpeg", "Teens"),
                  const SizedBox(width: 25),
                  _buildCategoryList("assets/sport.jpeg", "Sports"),
                  const SizedBox(width: 25),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Curated For You",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("See all", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  _buildProductList(
                    context,
                    "assets/zudio.jpeg",
                    "ZUDIO",
                    "4.0",
                    "441",
                    "Black Crewneck T-Shirt",
                    "399.90",
                    "499.90",
                  ),
                  const SizedBox(width: 20),
                  _buildProductList(
                    context,
                    "assets/levis.jpg.webp",
                    "LEVIS",
                    "4.8",
                    "139",
                    "Mens Housemark Tee",
                    "1199.00",
                    "1499.00",
                  ),
                  const SizedBox(width: 20),
                  _buildProductList(
                    context,
                    "assets/vans.jpg",
                    "VANS",
                    "4.2",
                    "108",
                    "Vans Classic T-Shirt",
                    "899.49",
                    "999.49",
                  ),
                  const SizedBox(width: 20),
                  _buildProductList(
                    context,
                    "assets/gucci.jpg",
                    "GUCCI",
                    "4.9",
                    "98",
                    "Blue Panelled Cotton Jersey",
                    "5399.90",
                    "6499.90",
                  ),
                  const SizedBox(width: 20),
                  _buildProductList(
                    context,
                    "assets/zara.jpg",
                    "ZARA",
                    "4.5",
                    "218",
                    "Basic Heavy Weight T-Shirt",
                    "1099.00",
                    "1499.00",
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Rated",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text("See all", style: TextStyle(color: Colors.grey)),
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const SizedBox(width: 20),
                  _buildProductList(
                    context,
                    "assets/zudio.jpeg",
                    "ZUDIO",
                    "4.0",
                    "441",
                    "Black Crewneck T-Shirt",
                    "399.90",
                    "499.90",
                  ),
                  const SizedBox(width: 20),
                  _buildProductList(
                    context,
                    "assets/levis.jpg.webp",
                    "LEVIS",
                    "4.8",
                    "139",
                    "Mens Housemark Tee",
                    "1199.00",
                    "1499.00",
                  ),
                  const SizedBox(width: 20),
                  _buildProductList(
                    context,
                    "assets/vans.jpg",
                    "VANS",
                    "4.2",
                    "108",
                    "Vans Classic T-Shirt",
                    "899.49",
                    "999.49",
                  ),
                  const SizedBox(width: 20),
                  _buildProductList(
                    context,
                    "assets/gucci.jpg",
                    "GUCCI",
                    "4.9",
                    "98",
                    "Blue Panelled Cotton Jersey",
                    "5399.90",
                    "6499.90",
                  ),
                  const SizedBox(width: 20),
                  _buildProductList(
                    context,
                    "assets/zara.jpg",
                    "ZARA",
                    "4.5",
                    "218",
                    "Basic Heavy Weight T-Shirt",
                    "1099.00",
                    "1499.00",
                  ),
                  const SizedBox(width: 20),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildCategoryList(String image, String text) {
  return Column(
    children: [
      CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
      const SizedBox(height: 5.0),
      Text(text),
    ],
  );
}

Widget _buildProductList(
  BuildContext context,
  String image,
  String company,
  String rating,
  String reviews,
  String title,
  String price,
  String cutoff,
) {
  return GestureDetector(
    onTap: () {
      // Navigate to ProductPage
      Navigator.push(
        context,
        MaterialPageRoute(
          builder:
              (context) => ProductDetailsPage(
                image: image,
                company: company,
                rating: rating,
                reviews: reviews,
                title: title,
                price: price,
                cutoff: cutoff,
              ),
        ),
      );
    },
    child: SizedBox(
      height: 265,
      width: 160,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 195,
            width: 160,
            child: Image.asset(image, fit: BoxFit.fill),
          ),
          const SizedBox(height: 4.0),
          Row(
            children: [
              Text(
                company,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
              const SizedBox(width: 4),
              Text("⭐️$rating", style: const TextStyle(fontSize: 12)),
              const SizedBox(width: 2),
              Text(
                "($reviews)",
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              ),
            ],
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            maxLines: 1,
          ),
          Row(
            children: [
              Text("₹$price", style: const TextStyle(fontSize: 13)),
              const SizedBox(width: 4),
              Text(
                "₹$cutoff",
                style: const TextStyle(
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
