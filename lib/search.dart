import 'package:flutter/material.dart';
import 'product.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  final List<Map<String, String>> _products = [
    {
      "image": "assets/zudio.jpeg",
      "company": "ZUDIO",
      "rating": "4.0",
      "reviews": "441",
      "title": "Crewneck T-Shirt",
      "price": "399.90",
      "cutoff": "499.90",
      "category": "Men"
    },
    {
      "image": "assets/levis.jpg.webp",
      "company": "LEVIS",
      "rating": "4.8",
      "reviews": "139",
      "title": "Mens Housemark Tee",
      "price": "1199.00",
      "cutoff": "1499.00",
      "category": "Men"
    },
    {
      "image": "assets/vans.jpg",
      "company": "VANS",
      "rating": "4.2",
      "reviews": "108",
      "title": "Vans Classic T-Shirt",
      "price": "899.49",
      "cutoff": "999.49",
      "category": "Men"
    },
    {
      "image": "assets/gucci.jpg",
      "company": "GUCCI",
      "rating": "4.9",
      "reviews": "98",
      "title": "Blue Panelled Cotton Jersey",
      "price": "5399.90",
      "cutoff": "6499.90",
      "category": "Men"
    },
    {
      "image": "assets/zara.jpg",
      "company": "ZARA",
      "rating": "4.5",
      "reviews": "218",
      "title": "Basic Heavy Weight T-Shirt",
      "price": "1099.00",
      "cutoff": "1499.00",
      "category": "Men"
    },

    {
      "image": "assets/women1.jpg.webp",
      "company": "H&M",
      "rating": "4.3",
      "reviews": "215",
      "title": "Women's Casual Blouse",
      "price": "899.00",
      "cutoff": "1299.00",
      "category": "Women"
    },
    {
      "image": "assets/women2.jpeg",
      "company": "FOREVER 21",
      "rating": "4.1",
      "reviews": "142",
      "title": "Women's Summer Dress",
      "price": "1499.00",
      "cutoff": "1999.00",
      "category": "Women"
    },
    {
      "image": "assets/kids.jpg",
      "company": "CARTER'S",
      "rating": "4.7",
      "reviews": "89",
      "title": "Kids Graphic T-Shirt",
      "price": "599.00",
      "cutoff": "799.00",
      "category": "Kids"
    },
  ];

  // List<Map<String, String>> get _filteredProducts {
  //   if (_searchQuery.isEmpty) {
  //     return _products;
  //   }
  //   return _products
  //       .where((product) =>
  //   product["title"]!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
  //       product["company"]!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
  //       product["category"]!.toLowerCase().contains(_searchQuery.toLowerCase()))
  //       .toList();
  // }
  List<Map<String, String>> get _filteredProducts {
    if (_searchQuery.isEmpty || _searchQuery == 'All') {
      return _products; // Return all products if query is empty or "All" is selected
    }

    // Filter strictly by category when a specific category is selected
    return _products.where((product) {
      return product["category"]!.toLowerCase() == _searchQuery.toLowerCase();
    }).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Products'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search for products, brands, categories...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                    setState(() {
                      _searchQuery = '';
                    });
                  },
                )
                    : null,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                filled: true,
                fillColor: Colors.grey[100],
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          // Filter chips
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                _buildFilterChip('All'),
                _buildFilterChip('Men'),
                _buildFilterChip('Women'),
                _buildFilterChip('Kids'),
                _buildFilterChip('Baby'),
                _buildFilterChip('Teens'),
                _buildFilterChip('Sports'),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: _filteredProducts.isEmpty
                ? const Center(
              child: Text('No products found', style: TextStyle(fontSize: 16)),
            )
                : GridView.builder(
              padding: const EdgeInsets.all(16.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.65,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
              ),
              itemCount: _filteredProducts.length,
              itemBuilder: (ctx, index) {
                final product = _filteredProducts[index];
                return _buildProductCard(product);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget _buildFilterChip(String label) {
  //   return Padding(
  //     padding: const EdgeInsets.only(right: 8.0),
  //     child: FilterChip(
  //       label: Text(label),
  //       selected: false,
  //       onSelected: (selected) {
  //         if (label == 'All') {
  //           setState(() {
  //             _searchQuery = '';
  //             _searchController.clear();
  //           });
  //         } else {
  //           setState(() {
  //             _searchQuery = label;
  //             _searchController.text = label;
  //           });
  //         }
  //       },
  //     ),
  //   );
  // }

  Widget _buildFilterChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: FilterChip(
        label: Text(label),
        selected: _searchQuery.toLowerCase() == label.toLowerCase(),
        onSelected: (selected) {
          setState(() {
            if (label == 'All') {
              _searchQuery = ''; // Reset to show all products
              _searchController.clear();
            } else {
              _searchQuery = label; // Set to specific category
              _searchController.text = label;
            }
          });
        },
      ),
    );
  }

  Widget _buildProductCard(Map<String, String> product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProductDetailsPage(
              image: product["image"]!,
              company: product["company"]!,
              rating: product["rating"]!,
              reviews: product["reviews"]!,
              title: product["title"]!,
              price: product["price"]!,
              cutoff: product["cutoff"]!,
            ),
          ),
        );
      },
      child: Card(
        clipBehavior: Clip.hardEdge,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Expanded(
              child: Hero(
                tag: product["image"]!,
                child: Image.asset(
                  product["image"]!,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Product Details
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        product["company"]!,
                        style: const TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      const Spacer(),
                      Text(
                        "⭐️${product["rating"]}",
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    product["title"]!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        "₹${product["price"]}",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        "₹${product["cutoff"]}",
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
          ],
        ),
      ),
    );
  }
}