import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class FollowersChart extends StatelessWidget {
  FollowersChart({super.key});

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Container(
      height: MySize.size498,
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
          Text(
            "Followers",
            style: TextStyle(
              fontSize: MySize.size16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MySize.size8),
          Row(
            children: [
              Text(
                "254,68K",
                style: TextStyle(
                  fontSize: MySize.size28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: MySize.size8, vertical: MySize.size4),
                decoration: BoxDecoration(
                  color: Colors.green.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(MySize.size8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.arrow_upward,
                      color: Colors.green,
                      size: MySize.size14,
                    ),
                    Text(
                      "6.18%",
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
          SizedBox(height: MySize.size8),
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              primaryYAxis: const NumericAxis(isVisible: false),
              borderWidth: 0,
              plotAreaBorderWidth: 0,
              series: <CartesianSeries>[
                ColumnSeries<ChartData, String>(
                  dataSource: data,
                  xValueMapper: (ChartData data, _) => data.day,
                  yValueMapper: (ChartData data, _) => data.value,
                  pointColorMapper: (ChartData data, _) => data.color,
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  width: 0.3,
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "834",
                    style: TextStyle(
                      fontSize: MySize.size16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  Text(
                    "Followers",
                    style: TextStyle(
                      fontSize: MySize.size12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              Container(
                width: MySize.size1,
                height: MySize.size24,
                color: Colors.grey.withOpacity(0.5),
              ),
              Column(
                children: [
                  Text(
                    "152",
                    style: TextStyle(
                      fontSize: MySize.size16,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  Text(
                    "Unfollowed",
                    style: TextStyle(
                      fontSize: MySize.size12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  final List<ChartData> data = [
    ChartData('M', 50, const Color(0xFF826AF9), 8),
    ChartData('T', 80, const Color(0xFF826AF9), 8),
    ChartData('W', 70, const Color(0xFF826AF9), 8),
    ChartData('T', 100, const Color(0xFFFF9640), 16), // Highlighted bar
    ChartData('F', 60, const Color(0xFF826AF9), 8),
    ChartData('S', 30, const Color(0xFF826AF9), 8),
    ChartData('S', 60, const Color(0xFF826AF9), 8),
  ];
}

class ChartData {
  final String day;
  final double value;
  final Color color;
  final double width;

  ChartData(this.day, this.value, this.color, this.width);
}
