// ignore_for_file: file_names

import 'package:_1_11_2024_infiniti/src/constants/dimension.dart';
import 'package:_1_11_2024_infiniti/src/features/overview/widgets/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MultiSeriesBarChart extends StatelessWidget {
  MultiSeriesBarChart({super.key});

  @override
  Widget build(BuildContext context) {
    MySize().init(context);
    return Scaffold(
      body: Container(
        height: MySize.size552,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
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
            const Text(
              "Statistics",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 21),
            Container(
              alignment: Alignment.center,
              child: const CustomDropdown(
                items: ["This Day", "This Week", "This Month"],
              ),
            ),
            const SizedBox(height: 24),
            const SizedBox(height: 8),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Share",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "19,042",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.arrow_upward, color: Colors.green, size: 16),
                        Text(
                          "4.85%",
                          style: TextStyle(color: Colors.green),
                        ),
                      ],
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Likes",
                      style: TextStyle(color: Colors.grey),
                    ),
                    Text(
                      "34,320",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SfCartesianChart(
                primaryXAxis: const CategoryAxis(
                  majorGridLines: MajorGridLines(width: 0),
                  axisLine: AxisLine(width: 1, color: Colors.grey),
                ),
                primaryYAxis: NumericAxis(
                  majorGridLines: MajorGridLines(color: Colors.grey.shade200),
                  axisLine: const AxisLine(width: 0),
                ),
                tooltipBehavior: TooltipBehavior(
                  enable: true,
                  builder: (dynamic data, dynamic point, dynamic series,
                      int pointIndex, int seriesIndex) {
                    final ChartData chartData = data as ChartData;
                    return Container(
                      width: MySize.size134,
                      height: MySize.size145,
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            chartData.date,
                            style: const TextStyle(
                                fontSize: 12, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Color(0xff826AF9),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Blue: ",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                "${chartData.value1}",
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Colors.yellow,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Yellow: ",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                "${chartData.value2}",
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  color: Colors.orange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                "Orange: ",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                              Text(
                                "${chartData.value3}",
                                style: const TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                series: <CartesianSeries>[
                  ColumnSeries<ChartData, String>(
                    dataSource: data,
                    xValueMapper: (data, _) => data.day,
                    yValueMapper: (data, _) => data.value1,
                    name: "Blue",
                    color: const Color(0xff826AF9),
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    spacing: 0.2,
                    width: 1,
                  ),
                  ColumnSeries<ChartData, String>(
                    dataSource: data,
                    xValueMapper: (data, _) => data.day,
                    yValueMapper: (data, _) => data.value2,
                    name: "Yellow",
                    color: Colors.yellow,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    spacing: 0.2,
                    width: 1,
                  ),
                  ColumnSeries<ChartData, String>(
                    dataSource: data,
                    xValueMapper: (data, _) => data.day,
                    yValueMapper: (data, _) => data.value3,
                    name: "Orange",
                    color: Colors.orange,
                    borderRadius: const BorderRadius.all(Radius.circular(16)),
                    spacing: 0.2,
                    width: 1,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final List<ChartData> data = [
    ChartData('Mon', 15.650, 2.550, 2.400, '23 Aug, 2021'),
    ChartData('Tue', 20.300, 5.150, 3.200, '24 Aug, 2021'),
    ChartData('Wed', 10.000, 8.000, 2.000, '25 Aug, 2021'),
    ChartData('Thu', 25.100, 10.500, 4.700, '26 Aug, 2021'),
    // ChartData('Fri', 18.000, 12.000, 6.000, '27 Aug, 2021'),
  ];
}

class ChartData {
  final String day;
  final double value1;
  final double value2;
  final double value3;
  final String date;

  ChartData(this.day, this.value1, this.value2, this.value3, this.date);
}
