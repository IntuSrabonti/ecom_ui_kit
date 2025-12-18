import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 🔹 Top Bar
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.menu, size: 28),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Menu clicked')),
                        );
                      },
                    ),
                    const Spacer(),
                    Image.asset('assets/images/logo-1.png', height: 32),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Profile clicked')),
                        );
                      },
                      child: const CircleAvatar(
                        radius: 16,
                        backgroundImage:
                            AssetImage('assets/images/profile.png'),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Search Bar
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search any Product...',
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Search icon tapped')),
                        );
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.mic),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Mic clicked')),
                        );
                      },
                    ),
                    filled: true,
                    fillColor: Colors.grey.shade100,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  onSubmitted: (value) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Searching for: $value')),
                    );
                  },
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 ALL Featured + Sort & Filter
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Text(
                      'ALL Featured',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    _chipButton(context, Icons.swap_vert, 'Sort'),
                    const SizedBox(width: 10),
                    _chipButton(context, Icons.filter_alt_outlined, 'Filter'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Category horizontal list
              SizedBox(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _categoryItem(context, 'Beauty', 'assets/images/cat1.png'),
                    _categoryItem(context, 'Fashion', 'assets/images/cat2.png'),
                    _categoryItem(context, 'Kids', 'assets/images/cat3.png'),
                    _categoryItem(context, 'Mens', 'assets/images/cat4.png'),
                    _categoryItem(context, 'Womens', 'assets/images/cat5.png'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Banner / Offers
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Banner clicked')),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/banner.png',
                      width: double.infinity,
                      height: 160,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Deal of the Day
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Deal of the Day clicked')),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: const [
                        Icon(Icons.timer, color: Colors.white),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            'Deal of the Day\n22h 55m remaining',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text(
                          'View all →',
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Trending Products
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  'Trending Products',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _trendingItem(context, 'Product 1', 'assets/images/1.png'),
                    _trendingItem(context, 'Product 2', 'assets/images/2.png'),
                    _trendingItem(context, 'Product 3', 'assets/images/3.png'),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              // 🔹 Sponsored Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Text(
                  'Sponsored',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                height: 140,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _sponsoredItem(context, 'Sponsor 1', 'assets/images/1.png'),
                    _sponsoredItem(context, 'Sponsor 2', 'assets/images/2.png'),
                  ],
                ),
              ),

              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  // 🔹 Chip style button for Sort/Filter
  Widget _chipButton(BuildContext context, IconData icon, String text) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$text clicked')),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(icon, size: 16),
            const SizedBox(width: 6),
            Text(text),
          ],
        ),
      ),
    );
  }

  // 🔹 Category item
  Widget _categoryItem(BuildContext context, String title, String image) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title clicked')),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 14),
        child: Column(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
            ),
            const SizedBox(height: 6),
            Text(title, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  // 🔹 Trending item
  Widget _trendingItem(BuildContext context, String title, String image) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title clicked')),
        );
      },
      child: Container(
        width: 140,
        margin: const EdgeInsets.only(right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset(
                image,
                width: 140,
                height: 140,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 6),
            Text(title, style: const TextStyle(fontSize: 14)),
          ],
        ),
      ),
    );
  }

  // 🔹 Sponsored item
  Widget _sponsoredItem(BuildContext context, String title, String image) {
    return GestureDetector(
      onTap: () {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('$title clicked')),
        );
      },
      child: Container(
        width: 200,
        margin: const EdgeInsets.only(right: 12),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            image,
            width: 200,
            height: 140,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
