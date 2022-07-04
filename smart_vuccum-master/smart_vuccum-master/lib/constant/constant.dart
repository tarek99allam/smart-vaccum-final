import 'package:flutter/material.dart';

class Constant {
  static ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    shadowColor: Colors.transparent,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12.0),
    ),
  );
  static ButtonStyle getbuttonStyleRounded(Color color) {
    return ButtonStyle(
      backgroundColor: MaterialStateProperty.all(color),
      shadowColor: MaterialStateProperty.all(Colors.transparent),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
    );
  }

  static Future<void> navigateTo({
    required var routeName,
    required BuildContext context,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => routeName,
      ),
    );
  }

  static CircularProgressIndicator indicator({Color color = Colors.white}) =>
      CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(color));

  static const TextStyle appBarTextStyle = TextStyle(
      fontSize: 28, fontFamily: 'Montserrat', fontWeight: FontWeight.bold);

  static const TextStyle headLineTextStyle = TextStyle(
      fontSize: 28, fontFamily: 'Montserrat', fontWeight: FontWeight.bold);
  static const TextStyle semieBoldTextStyle = TextStyle(
      fontSize: 24, fontFamily: 'Montserrat', fontWeight: FontWeight.w600);
  static const TextStyle mediumTextStyle = TextStyle(
      fontSize: 20, fontFamily: 'Montserrat', fontWeight: FontWeight.w500);
  static const TextStyle normalTextStyle = TextStyle(
      fontSize: 14, fontFamily: 'Montserrat', fontWeight: FontWeight.w500);
  static const kPadding = EdgeInsets.symmetric(horizontal: 16, vertical: 4);
  static const kPadding2 = EdgeInsets.symmetric(horizontal: 8, vertical: 4);

  static const kPaddingH32 = EdgeInsets.symmetric(horizontal: 32);
  static const kPaddingGridView = EdgeInsets.all(8);
  static const kPaddingListTile =
      EdgeInsets.symmetric(horizontal: 8, vertical: 4);
  static const kPaddingListTile2 =
      EdgeInsets.symmetric(horizontal: 16, vertical: 4);
  static const kMargin = EdgeInsets.symmetric(vertical: 2);
  static const kMargin4 = EdgeInsets.symmetric(vertical: 4);
  static const kMargin8 = EdgeInsets.symmetric(vertical: 8);
  static const kMargin12 = EdgeInsets.symmetric(vertical: 12);
  static const kMargin16 = EdgeInsets.symmetric(vertical: 16);
}

class Styles {
  static ThemeData themeData(bool isDarkTheme, BuildContext context) {
    Map<int, Color> color = {
      50: const Color(0xff041424),
      100: const Color(0xff081624),
      200: const Color(0xff0B1824),
      300: const Color(0xff0F1924),
      400: const Color(0xff121B24),
      500: const Color(0xff161D24),
      600: const Color(0xff1A1F24),
      700: const Color(0xff1D2124),
      800: const Color(0xff212224),
      900: const Color(0xff242424)
    };
    return ThemeData(
      primarySwatch: MaterialColor(041424, color),
      primaryColor: !isDarkTheme ? const Color(0xff041424) : Colors.grey,
      backgroundColor:
          !isDarkTheme ? const Color(0xff041424) : Colors.grey[800],
      indicatorColor: isDarkTheme ? Colors.grey[800] : const Color(0xff0E1D36),
      hintColor: isDarkTheme ? Colors.grey : const Color(0xff041424),
      highlightColor: isDarkTheme ? Colors.grey : const Color(0xff041424),
      hoverColor: isDarkTheme ? Colors.grey : const Color(0xff041424),
      focusColor: isDarkTheme ? Colors.grey : const Color(0xff041424),
      disabledColor: Colors.grey,
      cardColor: isDarkTheme ? const Color(0xFF151515) : Colors.white,
      canvasColor: isDarkTheme ? Colors.black : Colors.grey[50],
      brightness: isDarkTheme ? Brightness.dark : Brightness.light,
      buttonTheme: Theme.of(context).buttonTheme.copyWith(
          colorScheme: isDarkTheme
              ? const ColorScheme.dark()
              : const ColorScheme.light()),
      appBarTheme: AppBarTheme(
          elevation: 0.0,
          backgroundColor:
              isDarkTheme ? Colors.grey[800] : const Color(0xff041424)),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
        primary: isDarkTheme ? Colors.grey[800] : const Color(0xff041424),
      )),
      iconTheme: IconThemeData(
        color: isDarkTheme ? Colors.grey : Colors.white,
      ),
      textSelectionTheme: TextSelectionThemeData(
          selectionColor: isDarkTheme ? Colors.white : Colors.black),
    );
  }
}
