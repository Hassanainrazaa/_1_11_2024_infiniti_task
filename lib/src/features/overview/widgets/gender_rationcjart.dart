import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GenderRatioChart extends StatelessWidget {
  GenderRatioChart({super.key});

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Container(
      //width: 300,
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
            "Gender",
            style: TextStyle(
              fontSize: MySize.size16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MySize.size16),
          Stack(
            alignment: Alignment.center,
            children: [
              SfCircularChart(
                annotations: <CircularChartAnnotation>[
                  CircularChartAnnotation(
                    widget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '👩',
                          style: TextStyle(fontSize: MySize.size48),
                        ),
                      ],
                    ),
                  ),
                ],
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  color: Colors.white, // Tooltip background color
                  textStyle: TextStyle(
                    color: Colors.black, // Tooltip text color
                    fontSize: MySize.size14,
                    fontWeight: FontWeight.bold,
                  ),
                  borderColor: Colors.grey,
                  borderWidth: 1,
                  shadowColor: Colors.black26,
                  elevation: 5, // Elevation for shadow effect
                ),
                series: <CircularSeries>[
                  DoughnutSeries<ChartData, String>(
                    dataSource: data,
                    xValueMapper: (ChartData data, _) => data.category,
                    yValueMapper: (ChartData data, _) => data.value,
                    pointColorMapper: (ChartData data, _) => data.color,
                    innerRadius:
                        '80%', // Increase innerRadius to make the bars thinner
                    radius:
                        '90%', // Decrease radius to reduce the overall size of the chart
                    enableTooltip: true, // Enable tooltip
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: MySize.size16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: MySize.size12,
                    height: MySize.size12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF826AF9),
                    ),
                  ),
                  SizedBox(width: MySize.size8),
                  Text(
                    "Male: 352k",
                    style: TextStyle(fontSize: MySize.size14),
                  ),
                ],
              ),
              Row(
                children: [
                  Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFFFFCF53),
                    ),
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    "Female: 834k",
                    style: TextStyle(fontSize: 14),
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
    ChartData('Male', 42, const Color(0xFF826AF9)),
    ChartData('Female', 58, const Color(0xFFFFCF53)),
  ];
}

class ChartData {
  final String category;
  final double value;
  final Color color;

  ChartData(this.category, this.value, this.color);
}
