import 'package:e_commerce/utils/device/device_utility.dart';
import 'package:e_commerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../utils/constants/colors.dart';
class TTabBar extends StatelessWidget implements PreferredSizeWidget{
  const TTabBar({super.key,
    required this.tabs});

  final List<Widget> tabs;
  @override
  Widget build(BuildContext context) {
    final darkMode =THelperFunctions.isDarkMode(context);
    return  Material(
      child: TabBar(
          isScrollable: true,
          indicatorColor: TColors.primary,
          labelColor: THelperFunctions.isDarkMode(context) ? TColors.white :TColors.primary,
          tabs: tabs),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TDeviceUtils.getAppBarHeight());
}
