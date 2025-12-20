import 'package:flutter/material.dart';

class TrendingScreen extends StatefulWidget {
  const TrendingScreen({super.key});

  @override
  State<TrendingScreen> createState() => _TrendingScreenState();
}

class _TrendingScreenState extends State<TrendingScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // BODY
      body: SafeArea(
        child: Column(
          children: [
            //  TOP BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  const Icon(Icons.menu, size: 28), // Left
                  const Spacer(),
                  Image.asset('assets/images/logo-1.png', height: 32), // Center
                  const Spacer(),
                  const CircleAvatar(
                    radius: 16,
                    backgroundImage:
                        AssetImage('assets/images/profile.png'), // Right
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // SEARCH BAR
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search any Product...',
                  prefixIcon: const Icon(Icons.search),
                  suffixIcon: const Icon(Icons.mic),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            //  TRENDING GRID
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.builder(
                  itemCount: 12, // total 12 images
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // two per row
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.65,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              'assets/images/p${index + 1}.png', // change image paths
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'Product ${index + 1}',
                              maxLines: 2,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            child: Row(
                              children: const [
                                Text(
                                  '₹999',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  '₹1499',
                                  style: TextStyle(
                                      decoration: TextDecoration.lineThrough,
                                      color: Colors.grey),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),

      //  BOTTOM NAVIGATION
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.pink,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        onTap: (i) => setState(() => _currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border), label: 'Wishlist'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}
