import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smart_vuccum/provider/bluetooth_provider.dart';
import 'package:smart_vuccum/provider/theme_provider.dart';

import 'package:smart_vuccum/screens/welcome/welcome_screen.dart';

import 'constant/constant.dart';

// For using PlatformException

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late DarkThemeProvider themeChangeProvider;

  @override
  void initState() {
    super.initState();
    themeChangeProvider = DarkThemeProvider();

    super.initState();
    getCurrentAppTheme();
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.changeDarkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<DarkThemeProvider>(
            create: (_) => DarkThemeProvider()),
        ChangeNotifierProvider<BluetoothProvider>(
            create: (_) => BluetoothProvider()),
      ],
      child: Consumer<DarkThemeProvider>(
        builder: (BuildContext context, value, Widget? child) {
          return Listener(
              onPointerDown: (_) {
                FocusScopeNode currentFocus = FocusScope.of(context);
                if (!currentFocus.hasPrimaryFocus) {
                  currentFocus.focusedChild?.unfocus();
                }
              },
              child: MaterialApp(
                debugShowCheckedModeBanner: false,
                theme: Styles.themeData(value.darkTheme, context),
                home: const WelcomScreen(),
              ));
        },
      ),
    );
  }
}
