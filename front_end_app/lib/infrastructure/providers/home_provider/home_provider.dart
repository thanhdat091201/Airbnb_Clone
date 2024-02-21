import 'package:flutter/cupertino.dart';

class HomeProvider extends ChangeNotifier {
  int isIndex = 0;

  int homeSelectionSlider = 0;

  bool isBottomBarVisible = true;

  bool isSearchDestination = false;

  double isMapButtonVisible = 1.0;

  bool isBottomSheetOpen = true;

  int recentData = 0;

  setHomeSelectionSlider(int value) {
    homeSelectionSlider = value;
    notifyListeners();
  }

  setIsIndex(int value) {
    isIndex = value;
    notifyListeners();
  }

  changeBottombarVisiblity(bool value) {
    isBottomBarVisible = value;
    notifyListeners();
  }

  changeBottomSheetOpen(bool value) {
    isBottomSheetOpen = value;
    notifyListeners();
  }

  changeSearchDestination(value) {
    isSearchDestination = value;
    notifyListeners();
  }

  changeMapButtonVisible(value) {
    isMapButtonVisible = value;
    notifyListeners();
  }
}
