import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'search.dart';
import 'profile.dart';
import 'home.dart';
import 'cart_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (ctx) => CartProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueAccent),
          useMaterial3: true,
        ),
        home: const NavigationPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  int _selectedIndex = 0;

  final List<IconData> _unselectedIcon = [
    CupertinoIcons.home,
    CupertinoIcons.search,
    CupertinoIcons.cart,
    CupertinoIcons.profile_circled
  ];

  final List<IconData> _selectedIcon = [
    CupertinoIcons.house_fill,
    CupertinoIcons.search_circle_fill,
    CupertinoIcons.cart_fill,
    Icons.account_circle
  ];

  final List<Widget> _pages = [
    const HomePage(),
    const ExplorePage(),
    const CartPage(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      body: Center(
        child: Container(
          child: _pages[_selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: kBottomNavigationBarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              _buildIconButton(0),
              _buildIconButton(1),
              _buildIconButton(2, badge: cartProvider.itemCount > 0 ? cartProvider.itemCount.toString() : null),
              _buildIconButton(3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconButton(int index, {String? badge}) {
    return Badge(
      isLabelVisible: badge != null,
      label: badge != null ? Text(badge) : null,
      child: IconButton(
        icon: Icon(
          _selectedIndex == index ? _selectedIcon[index] : _unselectedIcon[index],
        ),
        onPressed: () {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}