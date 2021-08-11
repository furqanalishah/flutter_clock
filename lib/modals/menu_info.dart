import 'package:flutter/foundation.dart';
import 'package:flutter_clock/enums.dart';

class MenuInfo extends ChangeNotifier {
  MenuType menuType;
  String? title, imageSource;

  MenuInfo(this.menuType, {this.title, this.imageSource});

  updateMenu(MenuInfo menuInfo) {
    this.title = menuInfo.title;
    this.menuType = menuInfo.menuType;
    this.imageSource = menuInfo.imageSource;
    notifyListeners();
  }
}
