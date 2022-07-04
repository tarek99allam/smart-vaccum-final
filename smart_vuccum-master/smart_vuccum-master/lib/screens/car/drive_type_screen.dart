import 'package:flutter/material.dart';
import 'package:smart_vuccum/screens/car/automatic_screen.dart';
import 'package:smart_vuccum/screens/car/manual_screen.dart';

import '../../constant/constant.dart';

class DriveTypeScreen extends StatefulWidget {
  const DriveTypeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<DriveTypeScreen> createState() => _DriveTypeScreenState();
}

class _DriveTypeScreenState extends State<DriveTypeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drive Type"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Select Drive Type", style: Constant.semieBoldTextStyle),
            const SizedBox(height: 10),
            Container(
              padding: Constant.kPaddingListTile2,
              width: 300,
              height: 60,
              child: ElevatedButton(
                child: const Text(
                  "Manual",
                  style: Constant.mediumTextStyle,
                ),
                onPressed: () async {
                  // final status = await context
                  //     .read<BluetoothProvider>()
                  //     .sendMessage("manual");
                  // if (status) {
                  Constant.navigateTo(
                      context: context, routeName: const ManualScreen());
                  // }
                },
              ),
            ),
            const SizedBox(height: 10),
            Container(
                padding: Constant.kPaddingListTile2,
                width: 300,
                height: 60,
                child: ElevatedButton(
                  child: const Text(
                    "Automatic",
                    style: Constant.mediumTextStyle,
                  ),
                  onPressed: () async {
                    // final status = await context
                    //     .read<BluetoothProvider>()
                    //     .sendMessage("automatic");
                    // if (status) {
                    Constant.navigateTo(
                        context: context, routeName: const AutomaticScreen());
                    // }
                  },
                ))
          ],
        ),
      ),
    );
  }
}
