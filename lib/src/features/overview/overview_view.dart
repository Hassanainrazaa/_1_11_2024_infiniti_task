import 'package:_1_11_2024_infiniti/src/common_widgets/custom_appbar.dart';
import 'package:_1_11_2024_infiniti/src/common_widgets/divider_widget.dart';
import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:_1_11_2024_infiniti/src/features/overview/widgets/activity_graph_widget.dart';
import 'package:_1_11_2024_infiniti/src/features/overview/widgets/custom_dropdown.dart';
import 'package:_1_11_2024_infiniti/src/features/overview/widgets/follower_chart.dart';
import 'package:_1_11_2024_infiniti/src/features/overview/widgets/gender_rationcjart.dart';
import 'package:_1_11_2024_infiniti/src/features/overview/widgets/multi_series_statisistcs_Chart.dart';

import 'package:_1_11_2024_infiniti/src/features/overview/widgets/social_media_listview.dart';
import 'package:_1_11_2024_infiniti/theme/app_assets.dart';
import 'package:_1_11_2024_infiniti/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class OverviewView extends StatefulWidget {
  const OverviewView({super.key});

  @override
  State<OverviewView> createState() => _OverviewViewState();
}

class _OverviewViewState extends State<OverviewView> {
  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
        appBar: const CustomAppBar(title: ""),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: MySize.size15, right: MySize.size15),
            child: Column(
              children: [
                const LineContainer(),
                SizedBox(height: MySize.size17),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Overview',
                      style: AppTypography.headline(
                        fontSize: MySize.size28,
                        color: Colors.black,
                      ),
                    ),
                    SvgPicture.asset(
                      AppAssets.overviewPageIcon,
                    ),
                  ],
                ),
                SizedBox(height: MySize.size22),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(
                        AppAssets.downloadIcon,
                        width: MySize.size40,
                        height: MySize.size40,
                      ),
                      const CustomDropdown(
                        items: ["This Day", "This Week", "This Month"],
                      ),
                    ]),
                SizedBox(
                  height: MySize.size25,
                ),
                SocialStatsListView(),
                SizedBox(height: MySize.size15),
                FollowersChart(),
                SizedBox(height: MySize.size15),
                GenderRatioChart(),
                SizedBox(height: MySize.size15),
                ActivityChart(),
                SizedBox(height: MySize.size15),
                SizedBox(
                  height: 552, // Adjust height as needed
                  child: MultiSeriesBarChart(),
                ),
              ],
            ),
          ),
        ));
  }
}
