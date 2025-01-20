import 'package:flutter/material.dart';

class BarChart extends StatefulWidget {
  const BarChart({Key? key}) : super(key: key);

  @override
  _BarChartState createState() => _BarChartState();
}

class _BarChartState extends State<BarChart> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  final List<double> _data = [0.3, 0.5, 0.7, 1.0, 0.8];
  final List<String> _months = ["Nov", "Dec", "Jan", "Feb", "Mar"];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _data.length,
                (index) => Column(
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Container(
                          height: 200 * _data[index] * _animation.value,
                          width: 30,
                          decoration: BoxDecoration(
                            color: index == 3 ? Colors.blue : Colors.lightBlue[100],
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        if (index == 3)
                          Positioned(
                            top: -30,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.teal[900],
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "\$5,320.82",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                      ],
                    );
                  },
                ),
                const SizedBox(height: 8),
                Text(
                  _months[index],
                  style: const TextStyle(fontSize: 14),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}