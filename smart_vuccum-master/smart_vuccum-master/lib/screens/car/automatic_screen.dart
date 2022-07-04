import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vuccum/constant/constant.dart';
import 'package:smart_vuccum/provider/bluetooth_provider.dart';

import 'manual_screen.dart';

class AutomaticScreen extends StatefulWidget {
  const AutomaticScreen({Key? key}) : super(key: key);

  @override
  State<AutomaticScreen> createState() => _AutomaticScreenState();
}

class _AutomaticScreenState extends State<AutomaticScreen> {
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final blue = context.read<BluetoothProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Automatic"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Engin(char: "start", title: "Start"),
            Engin(char: "stop", title: "Stop")
          ],
        ),
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: Constant.mediumTextStyle,
            decoration: const InputDecoration(
                label: Text(
              "Area",
              style: Constant.mediumTextStyle,
            )),
          ),
        ),
        const SizedBox(height: 20),
        GestureDetector(
          onTap: () async {
            FocusScope.of(context).unfocus();
            final status = await blue.sendMessage(controller.text);
            if (status) {
              controller.clear();
            }
          },
          child: Container(
            padding: Constant.kPaddingListTile2,
            width: 300,
            height: 60,
            child: ElevatedButton(
              child: const Text(
                "Send Area",
                style: Constant.mediumTextStyle,
              ),
              onPressed: () {},
            ),
          ),
        ),
        const SizedBox(height: 50),
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
      ]),
    );
  }
}
