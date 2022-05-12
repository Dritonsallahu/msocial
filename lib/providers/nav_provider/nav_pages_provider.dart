import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NavPagesProvider extends ChangeNotifier{

  final PageController _pageController = PageController(initialPage: 0,keepPage: true);
   int _firstSelectedItem = 0;

   // Changes the navigation bar button in the bottom of the main page
  changeSelectedItem(int index){
    _firstSelectedItem = index;
    notifyListeners();
  }


   // Changes the page view of the main page
  changePageItem(int index){
    _pageController.jumpToPage(index);
    _firstSelectedItem = index;
    notifyListeners();
  }

  getSelectedItem(){
    return _firstSelectedItem;
  }

  getPageController(){
    return _pageController;
  }


}