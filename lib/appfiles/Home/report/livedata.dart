import 'dart:async';
import 'dart:math';
import 'dart:math' as math;

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../Const.dart';
import '../../../customWidget/customAppBar.dart';

class TestData extends StatefulWidget {
  const TestData({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TestDataState createState() => _TestDataState();
}

class _TestDataState extends State<TestData> {
  late DatabaseReference _dbrefe;
  late List<LiveData> chartData;
  late ChartSeriesController _chartSeriesController;
  late List<GDPData> chartDataa;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    chartData = getChartData();
    Timer.periodic(const Duration(seconds: 1), updateDataSource);
    Timer timer;
    timer = Timer.periodic(
        const Duration(seconds: 1), (Timer t) => getDynmicData());
    chartDataa = getChartDat();
    _tooltipBehavior = TooltipBehavior(enable: true);
    _dbrefe = FirebaseDatabase.instance.ref();

    super.initState();
  }

  List<GDPData> getChartDat() {
    final List<GDPData> chartData = [
      GDPData('Speed', 100),
      GDPData('BPM', 120),
    ];
    return chartData;
  }

  List<LiveData> chartDataaa = [];

  /// Creates an instance of random to generate the random number.
  final math.Random random = math.Random();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Horse Activity',
        isLeading: false,
      ),
      body: SafeArea(
        child: SizedBox(
          height: height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 200.h,
                  margin: const EdgeInsets.only(top: 20, right: 10),
                  decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset(1, 1),
                        blurRadius: 10.0,
                        spreadRadius: 3,
                      ),
                    ],
                  ),
                  child: SfCartesianChart(
                    series: <LineSeries<LiveData, int>>[
                      LineSeries<LiveData, int>(
                        onRendererCreated: (ChartSeriesController controller) {
                          _chartSeriesController = controller;
                        },
                        dataSource: chartData,
                        xValueMapper: (LiveData data, _) => data.time,
                        yValueMapper: (LiveData data, _) => data.speed,
                        yAxisName: 'Speed',
                      ),
                      LineSeries<LiveData, int>(
                        dataSource: chartData,
                        xValueMapper: (LiveData data, _) => data.time,
                        yValueMapper: (LiveData data, _) => data.bpm,
                        yAxisName: 'BPM',
                      ),
                    ],
                    primaryXAxis: NumericAxis(
                        majorGridLines: const MajorGridLines(width: 0),
                        edgeLabelPlacement: EdgeLabelPlacement.shift,
                        interval: 3,
                        title: AxisTitle(text: 'Time')),
                    primaryYAxis: NumericAxis(
                      axisLine: const AxisLine(width: 0),
                      majorTickLines: const MajorTickLines(size: 0),
                      title: AxisTitle(text: 'Speed'),
                    ),
                    axes: <ChartAxis>[
                      NumericAxis(
                        name: 'BPM',
                        opposedPosition: true,
                        axisLine: const AxisLine(width: 0),
                        majorTickLines: const MajorTickLines(size: 0),
                        title: AxisTitle(text: 'BPM'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  int time = 19;
  void updateDataSource(Timer timer) {
    chartData.add(
      LiveData(
        time++,
        math.Random().nextInt(60) + 30,
        math.Random().nextInt(60) + 80,
      ),
    );
    chartData.removeAt(0);
    _chartSeriesController.updateDataSource(
      addedDataIndex: chartData.length - 1,
      removedDataIndex: 0,
    );
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}

List<LiveData> getChartData() {
  //Data for testing
  return <LiveData>[
    LiveData(38, 4, 0),
    LiveData(37, 4, 0),
    LiveData(37, 5, 0),
    LiveData(38, 6, 0),
    LiveData(39, 6, 0),
    LiveData(41, 8, 0),
    LiveData(45, 10, 10),
    LiveData(50, 10, 10),
    LiveData(52, 11, 10),
    LiveData(40, 11, 10),
    LiveData(42, 11, 10),
    LiveData(44, 12, 10),
    LiveData(50, 15, 20),
    LiveData(54, 16, 20),
    LiveData(60, 18, 20),
    LiveData(65, 19, 20),
    LiveData(70, 20, 20),
    LiveData(72, 20, 20),
    LiveData(80, 24, 30),
    LiveData(85, 26, 30),
    LiveData(78, 23, 30),
    LiveData(73, 22, 30),
    LiveData(68, 21, 30),
    LiveData(64, 20, 30),
    LiveData(60, 20, 40),
    LiveData(63, 24, 40),
    LiveData(65, 24, 40),
    LiveData(66, 25, 40),
    LiveData(67, 25, 40),
    LiveData(69, 26, 40),
    LiveData(70, 28, 50),
    LiveData(75, 29, 50),
    LiveData(80, 30, 50),
    LiveData(85, 30, 50),
    LiveData(88, 30, 50),
    LiveData(90, 34, 50),
    LiveData(93, 34, 60),
    LiveData(98, 36, 60),
    LiveData(105, 36, 60),
    LiveData(100, 35, 60),
    LiveData(97, 32, 60),
    LiveData(95, 30, 60),
  ];
}

class LiveData {
  LiveData(this.time, this.speed, this.bpm);
  final int time;
  final int speed;
  final int bpm;
}

class Data {
  Data(this.x, this.y);
  final double x;
  final double y;
}

List<Data> dynmicData = <Data>[];
int j = 0;

void getDynmicData() {
  j++;
  double value = 100;
  Random random = Random();
  if (random.nextDouble() > 0.5) {
    value += random.nextDouble();
  } else {
    value -= random.nextDouble();
  }
  if (j > 50) {
    dynmicData.removeAt(0);
  }

  dynmicData.add(Data(j.toDouble(), value));
}

