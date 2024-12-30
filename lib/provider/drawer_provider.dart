import 'package:flutter/material.dart';

class DrawerProvider with ChangeNotifier {
  bool _isDrawerOpen = false;

  bool get isDrawerOpen => _isDrawerOpen;

  String _selectedItem = "Overview"; // Default selected item
  String get selectedItem => _selectedItem;

  String _currentPage = "Overview"; // Default selected page
  String get currentPage => _currentPage;

  void setPage(String page) {
    _currentPage = page;
    notifyListeners();
  }

  void selectItem(String item) {
    _selectedItem = item;
    notifyListeners(); // Notify widgets to rebuild
  }

  void toggleDrawer() {
    _isDrawerOpen = !_isDrawerOpen;
    notifyListeners();
  }

  void closeDrawer() {
    _isDrawerOpen = false;
    notifyListeners();
  }

  void openDrawer() {
    _isDrawerOpen = true;
    notifyListeners();
  }
}
