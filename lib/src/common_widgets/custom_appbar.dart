import 'package:_1_11_2024_infiniti/provider/drawer_provider.dart';
import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:_1_11_2024_infiniti/theme/app_assets.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomAppBar({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final drawerProvider = context.watch<DrawerProvider>();

    MySize().init(context); // Initialize MySize with the current context

    return AppBar(
      leading: IconButton(
        icon: SvgPicture.asset(
          AppAssets.menuIcon,
          width: MySize.size24,
          height: MySize.size24,
          // ignore: deprecated_member_use
          color: Colors.black,
        ),
        onPressed: () {
          drawerProvider.toggleDrawer();
        },
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.black),
      ),
      actions: [
        IconButton(
          icon: SvgPicture.asset(
            AppAssets.searchIcon,
            width: MySize.size24,
            height: MySize.size24,
          ),
          onPressed: () {
            // Handle search action
          },
        ),
        SizedBox(width: MySize.size16),
        IconButton(
          icon: SvgPicture.asset(
            AppAssets.settingIcon,
            width: MySize.size24,
            height: MySize.size24,
          ),
          onPressed: () {
            // Handle settings action
          },
        ),
        SizedBox(width: MySize.size16),
        IconButton(
          icon: SvgPicture.asset(
            AppAssets.notificationIcon,
            width: MySize.size24,
            height: MySize.size24,
          ),
          onPressed: () {
            // Handle notification action
          },
        ),
        SizedBox(width: MySize.size16),
        IconButton(
          icon: SvgPicture.asset(
            AppAssets.profileIcon,
            width: MySize.size40,
            height: MySize.size40,
          ),
          onPressed: () {
            // Handle profile action
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
