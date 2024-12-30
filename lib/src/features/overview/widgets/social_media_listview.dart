import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:_1_11_2024_infiniti/src/features/overview/widgets/socail_media_list.dart';
import 'package:_1_11_2024_infiniti/theme/app_assets.dart';
import 'package:flutter/material.dart';

class SocialStatsListView extends StatelessWidget {
  final List<Map<String, dynamic>> stats = [
    {
      "profileName": "mitchell.cooper",
      "platform": "Facebook",
      "followers": "353,49K",
      "growthRate": 1.43,
      "imagePath": AppAssets.faceboookIcon,
    },
    {
      "profileName": "alex.johnson",
      "platform": "Instagram",
      "followers": "758,12K",
      "growthRate": 2.89,
      "imagePath": AppAssets.instagramIcon,
    },
  ];

   SocialStatsListView({super.key});

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return SizedBox(
      height: MySize.size175, // Height of the list view
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: stats.length,
        itemBuilder: (context, index) {
          final item = stats[index];
          return SocialStatsCard(
            profileName: item["profileName"],
            platform: item["platform"],
            followers: item["followers"],
            growthRate: item["growthRate"],
            imagePath: item["imagePath"],
          );
        },
      ),
    );
  }
}
