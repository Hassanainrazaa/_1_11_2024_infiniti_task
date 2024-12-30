import 'package:_1_11_2024_infiniti/src/common_widgets/drawer_items_widget.dart';
import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:_1_11_2024_infiniti/src/features/calender/widgets/event_tile.dart';
import 'package:_1_11_2024_infiniti/src/features/overview/overview_view.dart';
import 'package:_1_11_2024_infiniti/src/features/underwork/underwork.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:_1_11_2024_infiniti/provider/drawer_provider.dart';
import 'package:_1_11_2024_infiniti/src/features/mail/mail_view.dart';
import 'package:_1_11_2024_infiniti/src/features/calender/view/calender.dart';
import 'package:_1_11_2024_infiniti/theme/app_assets.dart';
import 'package:_1_11_2024_infiniti/theme/typography.dart';

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    MySize().init(context); // Initialize MySize
    final drawerProvider = context.watch<DrawerProvider>();
    final screenWidth = MediaQuery.of(context).size.width;

    // Get the current page content based on the selected drawer item
    Widget getCurrentPage() {
      switch (drawerProvider.selectedItem) {
        case "Chat":
          return const ChatHome();
        case "Calendar":
          return const CustomCalendarScreen();

        case "Overview":
          return const OverviewView();
        default:
          return const Center(child: UnderWorkScreen());
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          // Drawer content
          SingleChildScrollView(
            child: SizedBox(
              width: MySize.size270, // Drawer width adjusted dynamically
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MySize.size27),
                  Container(
                    padding: EdgeInsets.symmetric(
                      vertical: MySize.size27,
                      horizontal: MySize.size21,
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          AppAssets.logo1Icon,
                          height: MySize.size38,
                          width: MySize.size120,
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      DrawerItem(
                        svgAssetPath: AppAssets.overviewIcon,
                        label: "Overview",
                        isSelected: drawerProvider.selectedItem == "Overview",
                        onTap: () {
                          drawerProvider.selectItem("Overview");
                          drawerProvider.closeDrawer(); // Close drawer
                        },
                        selectedSvgAssetPath: AppAssets.overviewIcon,
                      ),
                      DrawerItem(
                        selectedSvgAssetPath: AppAssets.ecommerceIcon,
                        svgAssetPath: AppAssets.ecommerceIcon,
                        showArrow: true,
                        label: "E-Commerce",
                        isSelected: drawerProvider.selectedItem == "E-Commerce",
                        onTap: () {
                          drawerProvider.selectItem("E-Commerce");
                          drawerProvider.closeDrawer(); // Close drawer
                        },
                      ),
                      DrawerItem(
                        selectedSvgAssetPath: AppAssets.calenderIcon,
                        svgAssetPath: AppAssets.calenderIcon,
                        label: "Calendar",
                        isSelected: drawerProvider.selectedItem == "Calendar",
                        onTap: () {
                          drawerProvider.selectItem("Calendar");
                          drawerProvider.closeDrawer(); // Close drawer
                        },
                      ),
                      DrawerItem(
                        selectedSvgAssetPath: AppAssets.mailIcon,
                        svgAssetPath: AppAssets.mailIcon,
                        label: "Mail",
                        isSelected: drawerProvider.selectedItem == "Mail",
                        notificationCount: 8,
                        onTap: () {
                          drawerProvider.selectItem("Mail");
                          drawerProvider.closeDrawer(); // Close drawer
                        },
                      ),
                      DrawerItem(
                        selectedSvgAssetPath: AppAssets.chatIcon,
                        svgAssetPath: AppAssets.chatIcon,
                        label: "Chat",
                        isSelected: drawerProvider.selectedItem == "Chat",
                        onTap: () {
                          drawerProvider.selectItem("Chat");
                          drawerProvider.closeDrawer(); // Close drawer
                        },
                      ),
                      DrawerItem(
                        selectedSvgAssetPath: AppAssets.taskIcon,
                        svgAssetPath: AppAssets.taskIcon,
                        label: "Tasks",
                        isSelected: drawerProvider.selectedItem == "Tasks",
                        onTap: () {
                          drawerProvider.selectItem("Tasks");
                          drawerProvider.closeDrawer(); // Close drawer
                        },
                      ),
                      DrawerItem(
                        selectedSvgAssetPath: AppAssets.projectIcon,
                        svgAssetPath: AppAssets.projectIcon,
                        label: "Projects",
                        isSelected: drawerProvider.selectedItem == "Projects",
                        onTap: () {
                          drawerProvider.selectItem("Projects");
                          drawerProvider.closeDrawer(); // Close drawer
                        },
                      ),
                      DrawerItem(
                        selectedSvgAssetPath: AppAssets.fileManagerIcon,
                        svgAssetPath: AppAssets.fileManagerIcon,
                        label: "FileManagers",
                        isSelected:
                            drawerProvider.selectedItem == "FileManagers",
                        onTap: () {
                          drawerProvider.selectItem("FileManagers");
                          drawerProvider.closeDrawer(); // Close drawer
                        },
                      ),
                      DrawerItem(
                        selectedSvgAssetPath: AppAssets.notesIcon,
                        svgAssetPath: AppAssets.notesIcon,
                        label: "Notes",
                        isSelected: drawerProvider.selectedItem == "Notes",
                        onTap: () {
                          drawerProvider.selectItem("Notes");
                          drawerProvider.closeDrawer(); // Close drawer
                        },
                      ),
                      DrawerItem(
                        selectedSvgAssetPath: AppAssets.contactIcon,
                        svgAssetPath: AppAssets.contactIcon,
                        label: "Contacts",
                        isSelected: drawerProvider.selectedItem == "Contacts",
                        onTap: () {
                          drawerProvider.selectItem("Contacts");
                          drawerProvider.closeDrawer(); // Close drawer
                        },
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            left: MySize.size35, top: MySize.size35),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "CALENDERS",
                              style: AppTypography.headline(
                                  fontSize: MySize.size15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff637085)),
                            ),
                            SizedBox(width: MySize.size15),
                            IconButton(
                                icon: const Icon(
                                  Icons.add,
                                  color: Color(0xff637085),
                                ),
                                onPressed: () {})
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: MySize.size40),
                        child: Column(
                          children: [
                            CircularColorLabel(
                              color: Colors.red,
                              title: 'Important',
                              textStyle: AppTypography.headline(
                                  fontSize: MySize.size15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff637085)),
                            ),
                            SizedBox(
                              height: MySize.size20,
                            ),
                            CircularColorLabel(
                              color: Colors.yellow,
                              title: 'Meeting',
                              textStyle: AppTypography.headline(
                                  fontSize: MySize.size15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff637085)),
                            ),
                            SizedBox(
                              height: MySize.size20,
                            ),
                            CircularColorLabel(
                              color: Colors.green,
                              title: 'Event',
                              textStyle: AppTypography.headline(
                                  fontSize: MySize.size15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff637085)),
                            ),
                            SizedBox(
                              height: MySize.size20,
                            ),
                            CircularColorLabel(
                              color: Colors.blue,
                              title: 'Work',
                              textStyle: AppTypography.headline(
                                  fontSize: MySize.size15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff637085)),
                            ),
                            SizedBox(
                              height: MySize.size20,
                            ),
                            CircularColorLabel(
                              color: Colors.grey,
                              title: 'Other',
                              textStyle: AppTypography.headline(
                                  fontSize: MySize.size15,
                                  fontWeight: FontWeight.w600,
                                  color: const Color(0xff637085)),
                            ),
                            SizedBox(
                              height: MySize.size20,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          // Main content
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            transform: Matrix4.translationValues(
              drawerProvider.isDrawerOpen ? screenWidth * 0.7 : 0.0,
              0.0,
              0.0,
            ),
            child: GestureDetector(
              onTap: () {
                if (drawerProvider.isDrawerOpen) {
                  drawerProvider.closeDrawer();
                }
              },
              child: Container(
                color: Colors.white,
                child: getCurrentPage(), // Dynamically load the selected page
              ),
            ),
          ),
        ],
      ),
    );
  }
}
