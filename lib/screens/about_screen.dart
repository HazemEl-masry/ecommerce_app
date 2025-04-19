import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          CircleAvatar(
            radius: 50,
            child: Icon(Icons.shopping_cart, size: 50),
          ),
          SizedBox(height: 16),
          Text(
            'Shop App',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text(
            'Version 1.0.0',
            style: TextStyle(fontSize: 16, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 24),
          Text(
            'Features:',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('Browse Products'),
            subtitle: Text('Explore our wide range of products'),
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            subtitle: Text('Find products quickly'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            subtitle: Text('Customize your app experience'),
          ),
          ListTile(
            leading: Icon(Icons.security),
            title: Text('Secure Authentication'),
            subtitle: Text('Your data is protected'),
          ),
          SizedBox(height: 24),
          Text(
            '© 2025 Shop App. All rights reserved.',
            style: TextStyle(fontSize: 12, color: Colors.grey),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
