import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'cart_screen.dart';
import 'settings_screen.dart';
import 'about_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _selectedIndex = 0;
  
  final List<Widget> _screens = const [
    HomeScreen(),
    CartScreen(),
    SettingsScreen(),
    AboutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _screens,
      ),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.selected)) {
              return TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).colorScheme.primary,
              );
            }
            return const TextStyle(fontSize: 14);
          }),
        ),
        child: NavigationBar(
          selectedIndex: _selectedIndex,
          onDestinationSelected: (index) {
            setState(() => _selectedIndex = index);
          },
          backgroundColor: isDarkMode ? Colors.grey[900] : Colors.white,
          elevation: 0,
          animationDuration: const Duration(milliseconds: 800),
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
              icon: Icon(
                Icons.home_outlined,
                color: _selectedIndex == 0
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              selectedIcon: Icon(
                Icons.home,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Home',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.shopping_cart_outlined,
                color: _selectedIndex == 1
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              selectedIcon: Icon(
                Icons.shopping_cart,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Cart',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.settings_outlined,
                color: _selectedIndex == 2
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              selectedIcon: Icon(
                Icons.settings,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'Settings',
            ),
            NavigationDestination(
              icon: Icon(
                Icons.info_outline,
                color: _selectedIndex == 3
                    ? Theme.of(context).colorScheme.primary
                    : null,
              ),
              selectedIcon: Icon(
                Icons.info,
                color: Theme.of(context).colorScheme.primary,
              ),
              label: 'About',
            ),
          ],
        ),
      ),
    );
  }
}
