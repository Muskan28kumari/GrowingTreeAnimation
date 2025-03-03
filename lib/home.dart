import 'package:flutter/material.dart';
import 'package:rive/rive.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  StateMachineController? controller;
  SMIInput<double>? inputValue;
  double valueSlider = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF4d4c61),
      body: Stack(
        children: [
          RiveAnimation.asset(
            "assets/tree_demo.riv",
            fit: BoxFit.fitWidth,
            onInit: (artboard) {
              controller = StateMachineController.fromArtboard(
                artboard,
                "State Machine 1",
              );

              if (controller != null) {
                artboard.addController(controller!);
                inputValue = controller?.findInput("input");
                inputValue?.change(1);
              }
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 60,
                ),
                child: Slider(
                  activeColor: Colors.green,
                  inactiveColor: Colors.green.withOpacity(0.5),
                  value: valueSlider,
                  onChanged: (v) {
                    setState(() {
                      valueSlider = v;
                    });
                    inputValue?.change(v);
                  },
                  min: 0,
                  max: 100,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
