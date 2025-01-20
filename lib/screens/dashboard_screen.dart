import 'package:dashboard/screens/widgets/bar_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_charts/charts.dart';
class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFf5f5f5),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset('assets/images/sort.png',height: height * .05),
                    Text('Dashboard', style: TextStyle(fontSize: height * .03,),),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(height * .01),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      child: Center(child: Image.asset('assets/images/notification.png',height: height * .05,),),
                    ),
                    SizedBox(width: width * .02,),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: CircleAvatar(),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: height * .02,),
            Container(
              width: double.maxFinite,
              height: height * .9,
              decoration: BoxDecoration(
                  color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30))
              ),
              child: Column(
                children: [
                  _accounting(),
                  Divider(),
                  _avgIncome(),
                  BarChart(),
                  _debitCard()
                  // _barChart()
                  // Container(
                  //   height: 300,
                  //   child: BarChartWidget(
                  //     barGroups: [
                  //       BarChartGroupData(x: 0, barRods: [
                  //         BarChartRodData(toY: 8, color: Colors.blue, width: 16)
                  //       ]),
                  //       BarChartGroupData(x: 1, barRods: [
                  //         BarChartRodData(toY: 10, color: Colors.red, width: 16)
                  //       ]),
                  //       BarChartGroupData(x: 2, barRods: [
                  //         BarChartRodData(toY: 14, color: Colors.green, width: 16)
                  //       ]),
                  //       BarChartGroupData(x: 3, barRods: [
                  //         BarChartRodData(toY: 15, color: Colors.orange, width: 16)
                  //       ]),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _accounting extends StatelessWidget {
  const _accounting({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Accounting', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
              Text('Aug 1, 2024 - Aug31, 2024')
            ],
          ),
          Row(
            children: [
              Text('This Month'),
              IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down_outlined))
            ],
          ),
        ],
      ),
    );
  }
}

class _avgIncome extends StatelessWidget {
  const _avgIncome({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('AVG. Monthly Income',style: TextStyle(fontWeight: FontWeight.w700),),
          Text('\$5,849.36', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36),),
          Row(children: [
            Icon(CupertinoIcons.arrow_up_right, color: Colors.green,),
            Text('3.89% ', style: TextStyle(color: Colors.green),),
            Text('vs \$5,432.74 prev. 90 days')
          ],)
        ],
      ),
    );
  }
}



class _debitCard extends StatelessWidget {
  const _debitCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xff2f3046),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Text(
                'Total Balance',
                style: TextStyle(color: Colors.white),
              ),
              Icon(Icons.more_horiz_outlined, color: Colors.white)
            ]),
            const Text('\$ 59,765', style: TextStyle(color: Colors.white, fontSize: 30)),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('2644 7545 3867 1965',
                    style: TextStyle(color: Colors.white)),
                Image.asset(
                  'assets/images/mastercard_logo.png', // Path to your Mastercard logo
                  height: 24,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}


// class _barChart extends StatelessWidget {
//   const _barChart({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: Container(
//         height: 300,
//         width: double.maxFinite,
//         child: SfCartesianChart(
//           plotAreaBackgroundColor: Colors.transparent,
//           margin: EdgeInsets.symmetric(vertical: 20),
//           borderColor: Colors.transparent,
//           borderWidth: 0,
//           plotAreaBorderWidth: 0,
//           enableSideBySideSeriesPlacement: false,
//           primaryXAxis: NumericAxis(
//             isVisible: false,
//           ),
//           primaryYAxis: NumericAxis(
//             isVisible: false,
//             minimum: 0,
//             maximum: 2,
//             interval: 0.5,
//           ),
//           series: <CartesianSeries>[
//             ColumnSeries<ChartColumnData, String>(
//                 borderRadius: BorderRadius.circular(20),
//                 dataSource: chartData,
//                 width: .5,
//                 xValueMapper: (ChartColumnData data, _) => data.x,
//                  yValueMapper: (ChartColumnData data, _) => data.y)
//           ],
//         ),
//       ),
//     );
//   }
// }


// class ChartColumnData {
//   final String x;
//   final double? y;
//   final double? y1;
//   ChartColumnData (this.x, this.y, this.y1);
// }
//
// final List<ChartColumnData> chartData = [
//   ChartColumnData('Nov', 2 , .3),
//   ChartColumnData('Dec', 2, .5),
//   ChartColumnData('Jan', 2, .7),
//   ChartColumnData('Feb', 2, 1.5),
//   ChartColumnData('Mar', 2, 1.2),
//   ChartColumnData('Apr', 2, .7)
// ];

//
// class BarChartWidget extends StatelessWidget {
//   final List<BarChartGroupData> barGroups;
//
//   BarChartWidget({required this.barGroups});
//
//   @override
//   Widget build(BuildContext context) {
//     return BarChart(
//       BarChartData(
//         alignment: BarChartAlignment.spaceAround,
//         maxY: 20,
//         barTouchData: BarTouchData(
//           touchTooltipData: BarTouchTooltipData(
//             // tooltipDecoration: BoxDecoration(
//             //   color: Colors.blueAccent,
//             //   borderRadius: BorderRadius.circular(8),
//             //   border: Border.all(color: Colors.white),
//             // ),
//             tooltipPadding: const EdgeInsets.all(8),
//             tooltipMargin: 8,
//           ),
//           touchCallback: (event, response) {},
//           handleBuiltInTouches: true,
//         ),
//         titlesData: FlTitlesData(
//           leftTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               interval: 5,
//               reservedSize: 30,
//             ),
//           ),
//           bottomTitles: AxisTitles(
//             sideTitles: SideTitles(
//               showTitles: true,
//               getTitlesWidget: (value, meta) {
//                 switch (value.toInt()) {
//                   case 0:
//                     return Text('Jan');
//                   case 1:
//                     return Text('Feb');
//                   case 2:
//                     return Text('Mar');
//                   case 3:
//                     return Text('Apr');
//                   default:
//                     return Text('');
//                 }
//               },
//             ),
//           ),
//         ),
//         gridData: FlGridData(show: true),
//         borderData: FlBorderData(show: false),
//         barGroups: barGroups,
//       ),
//     );
//   }
// }
