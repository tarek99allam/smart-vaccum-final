import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vuccum/constant/constant.dart';
import 'package:smart_vuccum/provider/theme_provider.dart';
import 'package:smart_vuccum/screens/bluetooth/SelectBondedDevicePage.dart';

import 'info_screen.dart';

class WelcomScreen extends StatelessWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Smart Vauum"),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const HeaderWidget(),
            const SizedBox(height: 40),
            Image.asset(
              "img/icon.png",
              height: 150,
            ),
            const SizedBox(height: 10),
            const Text("Welcome", style: Constant.headLineTextStyle),
            const SizedBox(height: 10),
            Container(
                padding: Constant.kPaddingListTile2,
                width: 300,
                height: 60,
                child: ElevatedButton(
                  child: const Text(
                    "attach to sweeper",
                    style: Constant.mediumTextStyle,
                  ),
                  onPressed: () {
                    Constant.navigateTo(
                        context: context,
                        routeName: const SelectBondedDevicePage());
                  },
                ))
          ],
        ));
  }
}

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context);
    return Padding(
      padding: Constant.kPaddingH32,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              themeChange.changeDarkTheme = !themeChange.darkTheme;
            },
            child: Container(
              width: 70,
              height: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Container(
                      width: 2,
                      height: 100,
                      color:
                          themeChange.darkTheme ? Colors.grey : Colors.white),
                  Transform.rotate(
                      angle: 0,
                      child: Icon(
                        context.read<DarkThemeProvider>().darkTheme
                            ? Icons.light_outlined
                            : Icons.light_rounded,
                        size: 35,
                      )),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Constant.navigateTo(
                  routeName: const InfoScreen(), context: context);
            },
            child: Container(
              width: 70,
              height: 75,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Theme.of(context).backgroundColor,
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50)),
              ),
              child: Column(
                children: [
                  Container(
                      width: 2,
                      height: 20,
                      color:
                          themeChange.darkTheme ? Colors.grey : Colors.white),
                  Transform.rotate(
                      angle: 0,
                      child: Icon(
                        context.read<DarkThemeProvider>().darkTheme
                            ? Icons.info_outline
                            : Icons.info,
                        size: 35,
                      )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
