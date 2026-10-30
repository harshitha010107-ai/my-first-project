import 'package:flutter/material.dart';

void main() {
  runApp(const CafeSujesApp());
}

class CafeSujesApp extends StatelessWidget {
  const CafeSujesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Cafe Sujes',
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFFFF8F0),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF8B5E3C),
        ),
      ),
      home: const CafeHomePage(),
    );
  }
}

class CafeHomePage extends StatefulWidget {
  const CafeHomePage({super.key});

  @override
  State<CafeHomePage> createState() => _CafeHomePageState();
}

class _CafeHomePageState extends State<CafeHomePage> {
  String selectedCategory = 'All';

  final List<String> categories = [
    'All',
    'Coffee',
    'Tea',
    'Desserts',
    'Snacks',
  ];

  final List<Map<String, dynamic>> menuItems = [
    {
      'name': 'Caramel Latte',
      'category': 'Coffee',
      'description': 'Smooth espresso with creamy caramel.',
      'price': 180,
      'emoji': '☕',
    },
    {
      'name': 'Cappuccino',
      'category': 'Coffee',
      'description': 'Rich coffee with silky milk foam.',
      'price': 150,
      'emoji': '🥤',
    },
    {
      'name': 'Strawberry Cake',
      'category': 'Desserts',
      'description': 'Soft cake with strawberry cream.',
      'price': 220,
      'emoji': '🍰',
    },
    {
      'name': 'Chocolate Brownie',
      'category': 'Desserts',
      'description': 'Warm, fudgy chocolate goodness.',
      'price': 160,
      'emoji': '🍫',
    },
    {
      'name': 'Masala Chai',
      'category': 'Tea',
      'description': 'Indian tea brewed with aromatic spices.',
      'price': 80,
      'emoji': '🍵',
    },
    {
      'name': 'Cheese Sandwich',
      'category': 'Snacks',
      'description': 'Toasted bread with melted cheese.',
      'price': 130,
      'emoji': '🥪',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = selectedCategory == 'All'
        ? menuItems
        : menuItems
            .where((item) => item['category'] == selectedCategory)
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF8F0),
        title: const Row(
          children: [
            Icon(Icons.local_cafe, color: Color(0xFF8B5E3C)),
            SizedBox(width: 8),
            Text(
              'café sujes',
              style: TextStyle(
                color: Color(0xFF5B3825),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Your cart is coming soon!'),
                ),
              );
            },
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: Color(0xFF5B3825),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: const Color(0xFFEAD8C5),
                borderRadius: BorderRadius.circular(24),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'YOUR DAILY DOSE OF HAPPINESS',
                    style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 1.2,
                      color: Color(0xFF79553B),
                    ),
                  ),
                  SizedBox(height: 14),
                  Text(
                    'A little coffee,\na lot of love.',
                    style: TextStyle(
                      fontSize: 30,
                      height: 1.3,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF5B3825),
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Freshly brewed moments, made just for you.',
                    style: TextStyle(
                      fontSize: 13,
                      color: Color(0xFF79553B),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              'Find your favourite',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5B3825),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 42,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (_, index) =>
                    const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected = selectedCategory == category;

                  return ChoiceChip(
                    label: Text(category),
                    selected: isSelected,
                    onSelected: (_) {
                      setState(() {
                        selectedCategory = category;
                      });
                    },
                    selectedColor: const Color(0xFF8B5E3C),
                    backgroundColor: Colors.white,
                    labelStyle: TextStyle(
                      color: isSelected
                          ? Colors.white
                          : const Color(0xFF79553B),
                    ),
                    side: BorderSide.none,
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Made with love, served with warmth',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Color(0xFF5B3825),
              ),
            ),
            const SizedBox(height: 16),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredItems.length,
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.68,
              ),
              itemBuilder: (context, index) {
                final item = filteredItems[index];

                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFFF0E5D9),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: const Color(0xFFF5EADF),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Center(
                            child: Text(
                              item['emoji'] as String,
                              style: const TextStyle(fontSize: 48),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        item['name'] as String,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF5B3825),
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        item['description'] as String,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontSize: 11,
                          height: 1.3,
                          color: Colors.brown,
                        ),
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '₹${item['price']}',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8B5E3C),
                            ),
                          ),
                          SizedBox(
                            width: 36,
                            height: 36,
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              onPressed: () {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      '${item['name']} will be available to order soon!',
                                    ),
                                    duration:
                                        const Duration(seconds: 1),
                                  ),
                                );
                              },
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                              style: IconButton.styleFrom(
                                backgroundColor:
                                    const Color(0xFF8B5E3C),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: const Color(0xFF8B5E3C),
        unselectedItemColor: Colors.brown,
        backgroundColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favourites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
