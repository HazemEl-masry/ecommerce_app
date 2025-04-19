import 'package:flutter/foundation.dart';
import '../models/product.dart';

class ProductsProvider with ChangeNotifier {
  bool _isLoading = false;
  final List<Product> _products = [
    Product(
      id: '1',
      name: 'Smartphone',
      description: 'Latest model with advanced features',
      price: 699.99,
      imageUrl: 'https://images.unsplash.com/photo-1511707171634-5f897ff02aa9?w=400&h=400&fit=crop',
      category: 'Electronics',
    ),
    Product(
      id: '2',
      name: 'Laptop',
      description: 'High-performance laptop for professionals',
      price: 1299.99,
      imageUrl: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=400&h=400&fit=crop',
      category: 'Electronics',
    ),
    Product(
      id: '3',
      name: 'Headphones',
      description: 'Wireless noise-canceling headphones',
      price: 199.99,
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400&h=400&fit=crop',
      category: 'Electronics',
    ),
    Product(
      id: '4',
      name: 'Smartwatch',
      description: 'Fitness tracking and notifications',
      price: 249.99,
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=400&h=400&fit=crop',
      category: 'Electronics',
    ),
    Product(
      id: '5',
      name: 'Camera',
      description: 'Professional DSLR camera',
      price: 899.99,
      imageUrl: 'https://images.unsplash.com/photo-1516035069371-29a1b244cc32?w=400&h=400&fit=crop',
      category: 'Electronics',
    ),
    Product(
      id: '6',
      name: 'Tablet',
      description: 'Portable tablet for work and entertainment',
      price: 449.99,
      imageUrl: 'https://images.unsplash.com/photo-1585790050230-5dd28404ccb9?w=400&h=400&fit=crop',
      category: 'Electronics',
    ),
  ];

  bool get isLoading => _isLoading;
  List<Product> get products => [..._products];

  Future<void> initDatabase() async {
    _isLoading = true;
    notifyListeners();

    // Simulate loading delay
    await Future.delayed(const Duration(seconds: 1));

    _isLoading = false;
    notifyListeners();
  }

  Product? findById(String id) {
    try {
      return _products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  List<Product> searchProducts(String query) {
    final lowercaseQuery = query.toLowerCase();
    return _products.where((product) {
      return product.name.toLowerCase().contains(lowercaseQuery) ||
          product.description.toLowerCase().contains(lowercaseQuery);
    }).toList();
  }
}
