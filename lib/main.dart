import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0; 
  int _selectedNavIndex = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFF1A252F), 
        child: SafeArea(
          child: SingleChildScrollView( 
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF2D3A4A),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Iconsax.menu,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Your location',
                              style: TextStyle(color: Colors.grey, fontSize: 14),
                            ),
                            SizedBox(height: 2),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Iconsax.location,
                                  color: Colors.red,
                                  size: 20,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  'Abuja, Nigeria',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Color(0xFF2D3A4A),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Iconsax.shopping_bag,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
                // Search Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Browse Categories...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Iconsax.search_normal,
                        color: Colors.grey,
                      ),
                      filled: true,
                      fillColor: Color(0xFF2D3A4A),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                // Category Buttons with Circular Logos
                SizedBox(
                  height: 80,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          _buildCategoryButton(0, 'Nike', 'assets/images/nike_logo.png'),
                          _buildCategoryButton(1, 'Puma', 'assets/images/puma_logo.png'),
                          _buildCategoryButton(2, 'Under\n Armour', 'assets/images/under_armour_logo.png'),
                          _buildCategoryButton(3, 'Adidas', 'assets/images/adidas_logo.png'),
                          _buildCategoryButton(4, 'Converse', 'assets/images/converse_logo.png'),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text(
                        'Popular Picks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      Text(
                        'See All',
                        style: TextStyle(color: Color(0xFF4A90E2), fontSize: 16),
                      ),
                    ],
                  ),
                ),
                // Product Cards Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductCard(
                        imagePath: 'assets/images/nike_one.png',
                        name: 'Nike Jordan',
                        price: '\$450.99',
                      ),
                      ProductCard(
                        imagePath: 'assets/images/nike_one.png',
                        name: 'Nike Jordan',
                        price: '\$450.99',
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    children: [
                      Text('New Arrivals', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text('See All', style: TextStyle(color: Color(0xFF4A90E2), fontSize: 16)),
                    ],
                  ),
                ),
                // New Longer Containers below New Arrivals in a Column
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch, // Ensures full width
                    children: [
                      NewArrivalCard(
                        imagePath: 'assets/images/nike_one.png',
                        text1: 'Best Pick',
                        text2: 'Nike Air Jordan',
                        text3: '\$450.99',
                      ),
                      SizedBox(height: 10), // Spacing between cards
                      NewArrivalCard(
                        imagePath: 'assets/images/nike_one.png',
                         text1: 'Best Pick',
                        text2: 'Nike Air Jordan',
                        text3: '\$450.99',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      // Custom BottomAppBar with notched shape
      bottomNavigationBar: BottomAppBar(
        color: Color(0xFF2D3A4A),
        shape: CircularNotchedRectangle(),
        notchMargin: 8.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Iconsax.home, size: 24, color: _selectedNavIndex == 0 ? Color(0xFF4A90E2) : Colors.white),
              onPressed: () => setState(() => _selectedNavIndex = 0),
            ),
            IconButton(
              icon: Icon(Iconsax.heart, size: 24, color: _selectedNavIndex == 1 ? Color(0xFF4A90E2) : Colors.white),
              onPressed: () => setState(() => _selectedNavIndex = 1),
            ),
            SizedBox(width: 40),
            IconButton(
              icon: Icon(Iconsax.message, size: 24, color: _selectedNavIndex == 3 ? Color(0xFF4A90E2) : Colors.white),
              onPressed: () => setState(() => _selectedNavIndex = 3),
            ),
            IconButton(
              icon: Icon(Iconsax.profile_2user, size: 24, color: _selectedNavIndex == 4 ? Color(0xFF4A90E2) : Colors.white),
              onPressed: () => setState(() => _selectedNavIndex = 4),
            ),
          ],
        ),
      ),
      // Custom floating action button
      floatingActionButton: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: Color(0xFF4A90E2),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Iconsax.shopping_bag,
          color: Colors.white,
          size: 28,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildCategoryButton(int index, String label, String imagePath) {
    final isSelected = _selectedIndex == index;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedIndex = index;
          });
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: isSelected ? 155 : 60,
          height: isSelected ? 60 : 60,
          decoration: BoxDecoration(
            borderRadius: isSelected
                ? BorderRadius.circular(30)
                : BorderRadius.circular(30),
            color: isSelected ? Color(0xFF4A90E2) : Color(0xFF2D3A4A),
          ),
          child: Center(
            child: isSelected
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        imagePath,
                        height: 40,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(width: 8),
                      Text(
                        label,
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  )
                : Image.asset(
                    imagePath,
                    height: 24,
                    fit: BoxFit.contain,
                  ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String name;
  final String price;

  ProductCard({required this.imagePath, required this.name, required this.price});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 190,
      decoration: BoxDecoration(
        color: Color(0xFF2D3A4A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              imagePath,
              height: 120,
              width: double.infinity,
              fit: BoxFit.contain,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 2.0),
                Text(
                  price,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  padding: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    color: Color(0xFF4A90E2),
                    borderRadius: BorderRadius.circular(6.0),
                  ),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewArrivalCard extends StatelessWidget {
  final String imagePath;
  final String text1;
  final String text2;
  final String text3;

  NewArrivalCard({required this.imagePath, required this.text1, required this.text2, required this.text3});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300, // Longer width
      decoration: BoxDecoration(
        color: Color(0xFF2D3A4A),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Column of three texts
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text1,
                    style: TextStyle(
                      color:  Color(0xFF4A90E2),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    text2,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    text3,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            // Image on the right
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                imagePath,
                height: 100,
                width: 100,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}