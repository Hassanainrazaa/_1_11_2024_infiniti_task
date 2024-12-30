import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:_1_11_2024_infiniti/theme/typography.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SocialStatsCard extends StatelessWidget {
  final String profileName;
  final String platform;
  final String followers;
  final double growthRate;
  final String imagePath;

  const SocialStatsCard({
    super.key,
    required this.profileName,
    required this.platform,
    required this.followers,
    required this.growthRate,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Container(
      width: MySize.size300, // Card width
      height: MySize.size175, // Card height
      margin: EdgeInsets.symmetric(horizontal: MySize.size8),
      padding: EdgeInsets.all(MySize.size16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MySize.size16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipOval(
                child: Padding(
                  padding: EdgeInsets.only(top: MySize.size10),
                  child: SvgPicture.asset(
                    imagePath,
                    height: MySize.size60, // Adjust as needed
                    width: MySize.size60, // Adjust as needed
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(width: MySize.size10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profileName,
                    style: AppTypography.headline(
                        fontSize: MySize.size14,
                        fontWeight: FontWeight.w700,
                        color: const Color(0xff637085)),
                  ),
                  Text(
                    platform,
                    style: TextStyle(
                      fontSize: MySize.size12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          Row(
            children: [
              Text(
                followers,
                style: TextStyle(
                  fontSize: MySize.size28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: MySize.size20,
              ),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MySize.size8, vertical: MySize.size4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                      size: MySize.size14,
                    ),
                    Text(
                      "${growthRate.toStringAsFixed(2)}%",
                      style: TextStyle(
                        fontSize: MySize.size12,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Text(
            "Followers",
            style: TextStyle(
              fontSize: MySize.size12,
              color: Colors.grey,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}

