import 'package:flutter/material.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= TOP BAR =================
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    const Icon(Icons.menu, size: 28),
                    const Spacer(),
                    Image.asset('assets/images/logo-1.png', height: 32),
                    const Spacer(),
                    const CircleAvatar(
                      radius: 16,
                      backgroundImage: AssetImage('assets/images/profile.png'),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ================= SEARCH =================
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

              const SizedBox(height: 20),

              // ================= ALL FEATURED =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Text(
                      'ALL Featured',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    _chip(Icons.swap_vert, 'Sort'),
                    const SizedBox(width: 8),
                    _chip(Icons.filter_alt_outlined, 'Filter'),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // ================= CATEGORY / FEATURES =================
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  children: const [
                    _CategoryItem('Beauty', 'assets/images/cat1.png'),
                    _CategoryItem('Fashion', 'assets/images/cat2.png'),
                    _CategoryItem('Kids', 'assets/images/cat3.png'),
                    _CategoryItem('Mens', 'assets/images/cat4.png'),
                    _CategoryItem('Womens', 'assets/images/cat5.png'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // ================= TOP BANNER =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.asset(
                        'assets/images/1.png',
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const Positioned(
                      top: 12,
                      left: 12,
                      child: Text(
                        'Now in Product',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ),
                    const Positioned(
                      top: 38,
                      left: 12,
                      child: Text(
                        'All Colors',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    const Positioned(
                      bottom: 12,
                      left: 12,
                      child: Text(
                        'Shop Now',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // ================= DEAL OF THE DAY =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Deal of the Day\n22h 55m 20s remaining',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'View all →',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 160,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    const _ImageCard(image: 'assets/images/d1.png'),
                    const SizedBox(width: 12),
                    Stack(
                      children: [
                        const _ImageCard(image: 'assets/images/d2.png'),
                        Positioned(
                          right: 8,
                          top: 60,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child:
                                const Icon(Icons.arrow_forward_ios, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 22),

              // ================= SPECIAL OFFERS =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    'assets/images/oh.png',
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 14),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(14),
                  child: Image.asset(
                    'assets/images/s2.png',
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 22),

              // ================= TRENDING PRODUCTS =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Colors.pinkAccent,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Trending Products',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      Text(
                        'View all →',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                height: 250,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(left: 16),
                  children: [
                    const _TrendingCard('assets/images/p1.png',
                        'Women Printed Kurta', '₹1500', '₹2499'),
                    const SizedBox(width: 12),
                    const _TrendingCard('assets/images/p2.png', 'Stylish Watch',
                        '₹999', '₹1999'),
                    const SizedBox(width: 12),
                    Stack(
                      children: [
                        const _TrendingCard('assets/images/p3.png',
                            'Running Shoes', '₹1799', '₹2999'),
                        Positioned(
                          right: 10,
                          top: 60,
                          child: Container(
                            padding: const EdgeInsets.all(6),
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child:
                                const Icon(Icons.arrow_forward_ios, size: 16),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // ================= SPONSORED =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  'Sponsored',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Image.asset(
                    'assets/images/s1.png',
                    height: 140,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),

      // ================= BOTTOM NAV =================
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

  Widget _chip(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        children: [
          Icon(icon, size: 16),
          const SizedBox(width: 4),
          Text(text),
        ],
      ),
    );
  }
}

// ================= CATEGORY ITEM =================
class _CategoryItem extends StatelessWidget {
  final String title, image;
  const _CategoryItem(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 14),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(image)),
          const SizedBox(height: 6),
          Text(title, style: const TextStyle(fontSize: 12)),
        ],
      ),
    );
  }
}

// ================= TRENDING CARD =================
class _TrendingCard extends StatelessWidget {
  final String image, title, price, oldPrice;
  const _TrendingCard(this.image, this.title, this.price, this.oldPrice);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(image, height: 160, fit: BoxFit.cover),
          ),
          const SizedBox(height: 6),
          Text(title, maxLines: 2),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(price,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.pink)),
              const SizedBox(width: 6),
              Text(oldPrice,
                  style: const TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey)),
            ],
          ),
        ],
      ),
    );
  }
}

// ================= IMAGE CARD =================
class _ImageCard extends StatelessWidget {
  final String image;
  const _ImageCard({required this.image});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(image, height: 160, width: 120, fit: BoxFit.cover),
    );
  }
}
