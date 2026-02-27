import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      name: 'AirPods Pro 2',
      price: 249.00,
      category: 'ANC TWS',
      imageUrl: 'assets/images/316027_0_CD7b3Y3Hy.webp',
      description: 'Active Noise Cancellation and Adaptive Transparency.',
    ),
    Product(
      id: 'p2',
      name: 'Sony WF-1000XM5',
      price: 298.00,
      category: 'ANC TWS',
      imageUrl: 'assets/images/563a2fb8-5324-46cc-8221-187628867081.webp',
      description: 'The Best Truly Wireless Noise Canceling Earbuds.',
    ),
    Product(
      id: 'p3',
      name: 'Samsung Galaxy Buds 2 Pro',
      price: 229.00,
      category: 'ANC TWS',
      imageUrl: 'assets/images/TWS-JETE-FS1-9.jpg',
      description: 'Intelligent Active Noise Cancellation.',
    ),
    Product(
      id: 'p4',
      name: 'Jabra Elite 8 Active',
      price: 199.00,
      category: 'Sports',
      imageUrl: 'assets/images/images (1).jpeg',
      description: 'Tough earbuds for active lifestyle.',
    ),
    Product(
      id: 'p5',
      name: 'Beats Fit Pro',
      price: 199.99,
      category: 'Sports',
      imageUrl: 'assets/images/images (2).jpeg',
      description: 'Fully wireless noise cancelling earphones.',
    ),
    Product(
      id: 'p6',
      name: 'Sennheiser Momentum 3',
      price: 279.00,
      category: 'Audiophile',
      imageUrl: 'assets/images/images.jpeg',
      description: 'Discover the new standard for true wireless earbuds.',
    ),
  ];

  String _searchQuery = '';
  String _selectedCategory = 'All';

  List<Product> get items {
    return _items.where((product) {
      final matchesSearch = product.name.toLowerCase().contains(_searchQuery.toLowerCase());
      final matchesCategory = _selectedCategory == 'All' || product.category == _selectedCategory;
      return matchesSearch && matchesCategory;
    }).toList();
  }

  List<String> get categories {
    final Set<String> cats = {'All'};
    for (var p in _items) {
      cats.add(p.category);
    }
    return cats.toList();
  }

  String get searchQuery => _searchQuery;
  String get selectedCategory => _selectedCategory;

  void setSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }

  void setSelectedCategory(String category) {
    _selectedCategory = category;
    notifyListeners();
  }
}
