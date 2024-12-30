
// ignore_for_file: library_private_types_in_public_api

import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ActivityChart extends StatelessWidget {
  ActivityChart({super.key});

  final List<_ActivityData> data = [
    _ActivityData('M', 10, '23 August, 2021'),
    _ActivityData('T', 15, '24 August, 2021'),
    _ActivityData('W', 25, '25 August, 2021'),
    _ActivityData('T', 20, '26 August, 2021'),
    _ActivityData('F', 30, '27 August, 2021'),
    _ActivityData('S', 10, '28 August, 2021'),
    _ActivityData('S', 15, '29 August, 2021'),
  ];

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Container(
      height: MySize.size500,
      padding: EdgeInsets.all(MySize.size16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(MySize.size6),
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
            "Activity",
            style: TextStyle(
              fontSize: MySize.size16,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: MySize.size8),
          Row(
            children: [
              Text(
                "462,98K",
                style: TextStyle(
                  fontSize: MySize.size28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(width: MySize.size8),
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
                      "3.48%",
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
          const SizedBox(height: 8),
          Expanded(
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(
                majorGridLines: MajorGridLines(width: 0),
                axisLine: AxisLine(width: 1, color: Colors.grey),
              ),
              primaryYAxis: NumericAxis(
                isVisible: true,
                labelStyle:
                    TextStyle(color: Colors.grey, fontSize: MySize.size10),
                axisLine: const AxisLine(width: 0),
                majorGridLines: MajorGridLines(color: Colors.grey.shade200),
              ),
              tooltipBehavior: TooltipBehavior(
                enable: true,
                builder: (dynamic data, dynamic point, dynamic series,
                    int pointIndex, int seriesIndex) {
                  final _ActivityData activityData = data as _ActivityData;
                  return Container(
                    padding: EdgeInsets.all(MySize.size8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(MySize.size8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 5,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '\$${activityData.value.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontSize: MySize.size14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: MySize.size4),
                        Text(
                          activityData.date,
                          style: TextStyle(
                            fontSize: MySize.size12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              series: <CartesianSeries<_ActivityData, String>>[
                SplineAreaSeries<_ActivityData, String>(
                  dataSource: data,
                  xValueMapper: (data, _) => data.day,
                  yValueMapper: (data, _) => data.value,
                  gradient: LinearGradient(
                    colors: [
                      Colors.orange.withOpacity(0.3),
                      Colors.transparent,
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                LineSeries<_ActivityData, String>(
                  dataSource: data,
                  xValueMapper: (data, _) => data.day,
                  yValueMapper: (data, _) => data.value,
                  markerSettings: const MarkerSettings(
                    isVisible: true,
                    shape: DataMarkerType.circle,
                    color: Colors.white,
                    borderColor: Colors.orange,
                    borderWidth: 2,
                  ),
                  width: MySize.size2,
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ActivityData {
  final String day;
  final double value;
  final String date;

  _ActivityData(this.day, this.value, this.date);
}
