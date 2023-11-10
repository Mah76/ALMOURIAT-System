import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../Const.dart';
import '../../../customWidget/customAppBar.dart';

class GraphPage extends StatefulWidget {
  @override
  _GraphPageState createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  late List<HorseData> _chartData;
  @override
  void initState() {
    _chartData = getChartData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: CustomAppBar(
        title: 'Horse activity',
        isLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: SizedBox(
              height: 550.h,
              width: 550.w,
              child: Column(
                children: [
                  const Text(
                    'Horse BPM and Speed',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: iconColor),
                  ),
                  Gap(10),
                  Expanded(
                    child: SizedBox(
                      height: 500.h,
                      width: 500.w,
                      child: SfCartesianChart(
                        primaryXAxis: NumericAxis(
                          title: AxisTitle(
                              text: 'Time',
                              textStyle: const TextStyle(color: iconColor)),
                        ),
                        primaryYAxis: NumericAxis(
                          title: AxisTitle(
                              text: 'BPM',
                              textStyle: const TextStyle(color: Colors.blue)),
                        ),
                        axes: <ChartAxis>[
                          NumericAxis(
                            opposedPosition: true,
                            name: 'speedAxis',
                            title: AxisTitle(
                                text: 'Speed',
                                textStyle: const TextStyle(color: iconColor)),
                          ),
                        ],
                        series: <ChartSeries>[
                          LineSeries<HorseData, double>(
                            dataSource: _chartData,
                            xValueMapper: (HorseData horse, _) => horse.time,
                            yValueMapper: (HorseData horse, _) => horse.BPM,
                            yAxisName: 'bpmAxis',
                          ),
                          LineSeries<HorseData, double>(
                            dataSource: _chartData,
                            xValueMapper: (HorseData horse, _) => horse.time,
                            yValueMapper: (HorseData horse, _) => horse.Speed,
                            yAxisName: 'speedAxis',
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    height: 70.h,
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
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "BPM",
                          style: TextStyle(color: iconColor),
                        ),
                        Text(
                          "Min : 61",
                          style: TextStyle(color: iconColor),
                        ),
                        Text(
                          "Max : 140",
                          style: TextStyle(color: iconColor),
                        ),
                        Text(
                          "Avg : 80",
                          style: TextStyle(color: iconColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 70.h,
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
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Speed  km/h",
                          style: TextStyle(color: iconColor),
                        ),
                        Text(
                          "Min : 1, ",
                          style: TextStyle(color: iconColor),
                        ),
                        Text(
                          "Max : 13",
                          style: TextStyle(color: iconColor),
                        ),
                        Text(
                          "Avg : 5",
                          style: TextStyle(color: iconColor),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 70.h,
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
                          blurRadius: 1,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: const [
                        Text(
                          "Duration : 30 min",
                          style: TextStyle(color: iconColor),
                        ),
                        // Text(
                        //   "Distance: 60 KM",
                        //   style: TextStyle(color: iconColor),
                        // ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

//   List<HorseData> getChartData() {
//     List<HorseData> chartData = [];
//     final random = Random();

//     for (int i = 0; i <= 60; i++) {
//       double bpm = 30 + random.nextDouble() * 110;
//       double speed = random.nextDouble() * 40;
//       chartData.add(HorseData(bpm, speed, i.toDouble()));
//     }

//     return chartData;
//   }
// }

  List<HorseData> getChartData() {
    return <HorseData>[
  
    
      //Data for testing
      HorseData(90.20991254, 2.771209892, 20.66896552),
      HorseData(85.80174927, 3.664952885, 20.86896552),
      HorseData(81.75731376, 3.778692802, 21),
      HorseData(74.77772193, 4.115868467, 21.20689655),
      HorseData(71.4679803, 3.894454762, 21.40689655),
      HorseData(67.04895949, 4.009205701, 21.62068966),
      HorseData(70.32974766, 4.010722233, 21.92068966),
      HorseData(67.75469991, 4.686590096, 22),
      HorseData(66.28169297, 4.913058909, 22.16206897),
      HorseData(63.70302604, 4.243762685, 22.23793103),
      HorseData(63.3356791, 3.462243077, 22.43793103),
      HorseData(61.12073992, 2.571027638, 22.55172414),
      HorseData(59.63868503, 2.978295666, 22.75448276),
      HorseData(64.04322911, 3, 23.03448276),
      HorseData(68.81873932, 3.2057755, 23.33448276),
      HorseData(73.59424952, 3.55466904, 23.57241379),
      HorseData(79.10264401, 3.880632342, 23.74137931),
      HorseData(86.08042626, 4.365475643, 23.99034483),
      HorseData(93.42736503, 4.607101154, 24),
      HorseData(101.5053785, 4.974475086, 24.20689655),
      HorseData(96.36071177, 5.112156262, 24.51724138),
      HorseData(104.4387252, 5.543365549, 24.71724138),
      HorseData(108.477732, 5.938119564, 24.91724138),
      HorseData(113.9879361, 6, 25),
      HorseData(117.6595959, 6.111459873, 25.29310345),
      HorseData(122.8042626, 6.402775064, 25.51724138),
      HorseData(130.8877048, 6.982157498, 25.71724138),
      HorseData(138.2292148, 7.0346713247, 25.91724138),
      HorseData(142.6319493, 7.22479403, 26.2),
      HorseData(143.363024, 7.450251822, 26.51724138),
      HorseData(143.363024, 7.652273865, 26.71724138),
      HorseData(141.5226702, 7.830354649, 26.91724138),
      HorseData(140.4188197, 8.538633698, 27),
      HorseData(144.4487785, 9, 27.29310345),
      HorseData(145.5453906, 9.180573843, 27.51724138),
      HorseData(142.9667236, 9.880573843, 27.71724138),
      HorseData(142.5975671, 10, 27.91724138),
      HorseData(142.5975671, 10.78487219, 28),
      HorseData(138.193023, 9.994958406, 28.29310345),
      HorseData(130.8406555, 8.207472419, 28.51724138),
      HorseData(127.1617573, 5.415031076, 28.71724138),
      HorseData(121.2842063, 5.415031076, 28.91724138),
      HorseData(116.5105057, 3.708426809, 29),
      HorseData(111.0003016, 5.415031076, 29.29310345),
      HorseData(102.1227506, 3.415031076, 29.51724138),
      HorseData(97.02845079, 4, 29.71724138),
      HorseData(95.02845079, 2.830354649, 29.91724138),
      HorseData(92.98220569, 2.230354649, 30),

    ];
  }
}

class HorseData {
  HorseData(this.BPM, this.Speed, this.time);

  final double BPM;
  final double Speed;
  final double time;
}
