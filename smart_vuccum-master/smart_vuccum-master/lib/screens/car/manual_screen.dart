import 'dart:developer' as log;
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vuccum/constant/constant.dart';
import 'package:smart_vuccum/provider/bluetooth_provider.dart';

import '../../constant/triangel_shape.dart';

class ManualScreen extends StatelessWidget {
  const ManualScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blue = context.read<BluetoothProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Manual"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Engin(char: "start", title: "Start"),
              Engin(char: "stop", title: "Stop")
            ],
          ),
          const SizedBox(height: 40),
          const Arrow(angel: 0, char: "up"),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Arrow(angel: -pi / 2, char: "left"),
                Arrow(angel: pi / 2, char: "right")
              ]),
          const Arrow(angel: pi, char: "down"),
          const SizedBox(height: 20),
          Expanded(
              child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).backgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50)),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(height: 5),
                      Text("Status",
                          style: Constant.semieBoldTextStyle
                              .copyWith(color: Colors.white)),
                      const SizedBox(height: 5),
                      Expanded(
                          child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: const BoxDecoration(),
                        child: ListView.builder(
                            itemCount: blue.status.length,
                            itemBuilder: ((context, index) {
                              return Text(
                                  "-> " + blue.status.reversed.toList()[index],
                                  style: Constant.mediumTextStyle
                                      .copyWith(color: Colors.white));
                            })),
                      )),
                    ],
                  )))
        ],
      ),
    );
  }
}

class Arrow extends StatelessWidget {
  const Arrow({Key? key, required this.angel, required this.char})
      : super(key: key);
  final double angel;
  final String char;
  @override
  Widget build(BuildContext context) {
    final blue = context.read<BluetoothProvider>();
    return Stack(alignment: Alignment.center, children: [
      GestureDetector(
          onTapDown: (val) {
            log.log(char);
            blue.sendMessage(char);
          },
          child: Container(
            color: Colors.transparent,
            height: 75,
            width: 75,
          )),
      Transform.rotate(
          angle: angel,
          child: CustomPaint(
            painter: MyButton(const Offset(0, 0)),
            child: const SizedBox(),
          ))
    ]);
  }
}

class Engin extends StatelessWidget {
  const Engin({Key? key, required this.title, required this.char})
      : super(key: key);
  final String title;
  final String char;
  @override
  Widget build(BuildContext context) {
    final blue = context.read<BluetoothProvider>();
    return SizedBox(
        height: 70,
        width: 70,
        child: ElevatedButton(
          child: Text(title, style: Constant.normalTextStyle),
          style: ElevatedButton.styleFrom(
              primary: title == "Stop" ? Colors.red : Colors.green,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(35.0),
              )),
          onPressed: () {
            log.log(char);
            blue.sendMessage(char);
          },
        ));
  }
}
