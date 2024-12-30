import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:_1_11_2024_infiniti/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DrawerItem extends StatelessWidget {
  final String svgAssetPath;
  final String selectedSvgAssetPath;
  final String label;
  final VoidCallback onTap;
  final bool isSelected;
  final int? notificationCount;
  final bool showArrow;

  const DrawerItem({
    super.key,
    required this.svgAssetPath,
    required this.selectedSvgAssetPath,
    required this.label,
    required this.onTap,
    this.isSelected = false,
    this.notificationCount,
    this.showArrow = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MySize.size56, // Drawer item height
      decoration: isSelected
          ? BoxDecoration(
              color: const Color.fromARGB(
                  255, 208, 231, 249), // Blue background for the selected item
              borderRadius: BorderRadius.circular(MySize.size16),
            )
          : null, // No background for unselected items
      child: ListTile(
        leading: SvgPicture.asset(
          isSelected ? selectedSvgAssetPath : svgAssetPath,
          height: MySize.size22,
          width: MySize.size22,
        ),
        title: Text(
          label,
          style: AppTypography.headline(
            fontSize: MySize.size15,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.blue : Colors.black87,
          ),
        ),
        trailing: notificationCount != null
            ? Container(
                padding: EdgeInsets.all(MySize.size6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.red,
                ),
                child: Text(
                  notificationCount.toString(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MySize.size10,
                  ),
                ),
              )
            : showArrow
                ? Icon(
                    Icons.arrow_forward_ios,
                    size: MySize.size16,
                    color: Colors.grey,
                  )
                : null, // No arrow if `showArrow` is false
        onTap: onTap,
      ),
    );
  }
}
