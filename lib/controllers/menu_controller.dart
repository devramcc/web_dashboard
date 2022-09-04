import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:web_dashboard/constants/style.dart';
import 'package:web_dashboard/routing/routes.dart';

class MenuController extends GetxController{
  static MenuController instance = Get.find();
  var activeItem = OverViewPageRoute.obs;
  var hoverItem = "".obs;

  changeActiveitemTo(String itemName){
    activeItem.value = itemName;
  }

  onHover(String itemName) {
    if(!isActive(itemName)) hoverItem.value = itemName;
  }

  isActive(String itemName) => activeItem.value == itemName;

  isHovering(String itemName) => hoverItem.value == itemName;

  Widget returnIconFor(String itemName) {
    switch (itemName) {
      case OverViewPageRoute:
        return _CustomIcon(Icons.trending_up, itemName);
      case DriversPageRoute:
        return _CustomIcon(Icons.drive_eta, itemName);
      case ClientsPageRoute:
        return _CustomIcon(Icons.people_alt_outlined, itemName);
      case AuthenticationPageRoute:
        return _CustomIcon(Icons.exit_to_app, itemName);
      default:
        return _CustomIcon(Icons.exit_to_app, itemName);
    };
  }

  Widget _CustomIcon(IconData icon, String itemName) {
    if(isActive(itemName)) return Icon(icon, size: 22, color: dark,);

    return Icon(icon, color: isHovering(itemName) ? dark : lightGrey,);
  }
}