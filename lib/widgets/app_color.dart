import 'package:flutter/material.dart';

class AppColor {
  AppColor._privateConstructor();

  static final AppColor _instance = AppColor._privateConstructor();

  factory AppColor() {
    return _instance;
  }

  // CORES BASE
  static const white = Color(0xFFFFFFFF);
  static const black = Color(0xFF000000);
  static const grey = Color(0xFF78909C);
  static const transparent = Colors.transparent;
  static const red = Color(0xFFE53935);
  static const blue = Color(0xFF1976D2);

  // CORES PRIMÁRIAS
  static const primary = Color(0xFF1976D2);
  static const secondary = Color(0xFFF57C00);
  static const accent = Color(0xFF3F51B5);

  // CORES SEMÂNTICAS
  static const success = Color(0xFF2E7D32);
  static const info = Color(0xFF0288D1);
  static const warning = Color(0xFFFFA000);
  static const error = Color(0xFFD32F2F);
  static const neutral = Color(0xFF5D4037);
  static const highlight = Color(0xFFFFC107);

  // ESTADOS
  static const finished = Color(0xFF1976D2);
  static const pending = Color(0xFFF57C00);
  static const locked = Color(0xFF78909C);

  // TEMA CLARO
  static const lightBackground = Color(0xFFFAFAFA);
  static const lightCard = Color(0xFFFFFFFF);
  static const lightCardBorder = Color(0xFFE0E0E0);
  static const lightText = Color(0xFF212121);
  static const lightTextSecondary = Color(0xFF757575);
  static const lightIcon = Color(0xFF424242);
  static const lightChip = Color(0xFFF5F5F5);
  static const lightDialogBackground = Color(0xFFFFFFFF);

  // TEMA ESCURO
  static const darkBackground = Color(0xFF121212);
  static const darkCard = Color(0xFF1E1E1E);
  static const darkCardBorder = Color(0xFF333333);
  static const darkText = Color(0xFFEEEEEE);
  static const darkTextSecondary = Color(0xFFAAAAAA);
  static const darkIcon = Color(0xFFE0E0E0);
  static const darkChip = Color(0xFF2C2C2C);
  static const darkDialogBackground = Color(0xFF1E1E1E);

  static const cardBopm = Color(0xFF08529E);
  static const cardTco = Color(0xFF08529E);
  static const cardLibrary = Color(0xFF08529E);

  static const finishedLightMode = Color(0xFF313586);
  static const pedingLightMode = Color(0xFFE9523F);
  static const lockLightMode = Color(0xFFA5A5A5);
  static const finishedDarkMode = Color(0xFF005DB2);
  static const pedingDarkMode = Color(0xFFE9523F);
  static const lockDarkMode = Color(0xFF616161);

  // LIGHT MODE

  static const greyLightMode = Color(0xFFB6B4B4);
  static const backgroundLightMode = Color(0xFFFFFFFF);
  static const whiteLightMode = Color(0xFFFEFEFE);
  static const blackLightMode = Color(0xFF474747);

  static const blueLightMode = Color(0xFF005DB2);

  static const dialogBackgroundColorLightMode = Color(0xFFEBEBEB);

  static const alertSuccessLightMode = Color(0xFF005DB2);
  static const alertErrorLightMode = Color(0xFFE9523F);

  static const cardLightMode = Color(0xFFF2F2F2);
  static const borderCardLightMode = Color(0xFF303136);
  static const appBarLightMode = Color(0xFF005DB2);
  static const iconLightMode = Color(0xFF474747);

  static const textTitleLightMode = Color(0xFF000000);
  static const textSubtitleLightMode = Color(0xFF969696);

  static const buttonPrimaryLightMode = Color(0xFF005DB2);
  static const buttonSecondaryLightMode = Color(0xFFE9523F);

  static const buttonTertiaryLightMode = Colors.transparent;

  static const focusButtonLightMode = Color(0xFF005DB2);

  static const floatingButtonLightMode = Color(0xFF005DB2);

  static const chipLightMode = Color(0xFFEBEBEB);
  static const dividerLightMode = Color(0xFF888888);

  // DARK MODE

  static const greyDarkMode = Color(0xFF616161);

  static const backgroundDarkMode = Color(0xFF17181A);
  static const whiteDarkMode = Color(0xFFFEFEFE);
  static const blackDarkMode = Color(0xFF2E2E2E);

  // static const blueDarkMode = Color(0xFF313586);

  static const dialogBackgroundColorDarkMode = Color(0xFF17181A);

  // ALERT
  static const alertSuccessDarkMode = Color(0xFF3D76F1);
  static const alertErrorDarkMode = Color(0xFFE9523F);

  static const cardDarkMode = Color(0xFF262729);
  static const borderCardDarkMode = Color(0xFF8D8D8D);

  static const appBarDarkMode = Color(0xFF005DB2);

  // static const appBarDarkMode = Color(0xFFDDE9FC);
  static const iconDarkMode = Color(0xFFFEFEFE);

  static const textTitleDarkMode = Color(0xFFFEFEFE);
  static const textSubtitleDarkMode = Color(0xFF8D8D8D);
  static const textDisplayDarkMode = Color(0xFFB6B4B4);

  static const buttonPrimaryDarkMode = Color(0xFF005DB2);
  static const buttonSecondaryDarkMode = Color(0xFFE9523F);
  static const buttonTertiaryDarkMode = Colors.transparent;

  static const focusButtonDarkMode = Color(0xFF005DB2);
  static const focusTextDarkMode = Color(0xFFD5D4D4);

  static const floatingButtonDarkMode = Color(0xFF005DB2);
  static const chipDarkMode = Color(0xFF303136);
  static const dividerDarkMode = Color(0xFF565656);
}

// class AppTheme {
//   static ThemeData get lightTheme {
//     return ThemeData(
//       primaryColor: AppColor.buttonPrimaryLightMode,
//       colorScheme: ColorScheme.light(
//         primary: AppColor.buttonPrimaryLightMode,
//       ),
//       canvasColor: AppColor.backgroundLightMode,
//       textTheme: TextTheme(
//           bodyLarge: TextStyle(color: AppColor.textTitleLightMode),
//           bodyMedium: TextStyle(color: AppColor.textSubtitleLightMode),
//           displayLarge: TextStyle(color: AppColor.textDisplayDarkMode)),
//       appBarTheme: AppBarTheme(
//         color: AppColor.appBarLightMode,
//         iconTheme: IconThemeData(
//           color: AppColor.iconLightMode,
//         ),
//       ),
//       iconTheme: IconThemeData(
//         color: AppColor.iconLightMode,
//       ),
//       dialogTheme: DialogThemeData(
//         backgroundColor: AppColor.dialogBackgroundColorLightMode,
//       ),
//       cardTheme: CardThemeData(
//         color: AppColor.cardLightMode,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: AppColor.borderCardLightMode,
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(16),
//         ),
//       ),
//       chipTheme: ChipThemeData(
//         backgroundColor: AppColor.chipLightMode,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: AppColor.chipLightMode,
//             width: 1,
//           ),
//           borderRadius: BorderRadius.circular(16),
//         ),
//         secondaryLabelStyle: TextStyle(
//           color: AppColor.whiteLightMode,
//         ),
//         brightness: Brightness.light,
//       ),
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: AppColor.floatingButtonLightMode,
//       ),
//       buttonTheme: ButtonThemeData(
//         colorScheme: ColorScheme.light(
//           primary: AppColor.buttonPrimaryLightMode,
//           secondary: AppColor.buttonSecondaryDarkMode,
//           tertiary: AppColor.transparent,
//           onPrimary: AppColor.whiteLightMode,
//           onTertiary: AppColor.blackLightMode,
//         ),
//       ),
//       focusColor: AppColor.focusButtonLightMode,
//       dividerTheme: DividerThemeData(
//         color: AppColor.dividerLightMode,
//         thickness: 1.5,
//       ),
//     );
//   }
//
//   static ThemeData get darkTheme {
//     return ThemeData(
//       primaryColor: AppColor.buttonPrimaryDarkMode,
//       colorScheme: ColorScheme.dark(
//         primary: AppColor.buttonPrimaryDarkMode,
//       ),
//       canvasColor: AppColor.backgroundDarkMode,
//       textTheme: TextTheme(
//         bodyLarge: TextStyle(color: AppColor.textTitleDarkMode),
//         bodyMedium: TextStyle(color: AppColor.textSubtitleDarkMode),
//       ),
//       appBarTheme: AppBarTheme(
//         color: AppColor.appBarDarkMode,
//         iconTheme: IconThemeData(
//           color: AppColor.iconDarkMode,
//         ),
//       ),
//       iconTheme: IconThemeData(
//         color: AppColor.iconDarkMode,
//       ),
//       dialogTheme: DialogThemeData(
//         backgroundColor: AppColor.dialogBackgroundColorDarkMode,
//       ),
//       floatingActionButtonTheme: FloatingActionButtonThemeData(
//         backgroundColor: AppColor.floatingButtonDarkMode,
//       ),
//       cardTheme: CardThemeData(
//         color: AppColor.cardDarkMode,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: AppColor.borderCardDarkMode,
//             width: 1,
//           ),
//         ),
//       ),
//       chipTheme: ChipThemeData(
//         backgroundColor: AppColor.chipDarkMode,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16),
//         ),
//         secondaryLabelStyle: TextStyle(
//           color: AppColor.whiteDarkMode,
//         ),
//         brightness: Brightness.dark,
//       ),
//       buttonTheme: ButtonThemeData(
//         colorScheme: ColorScheme.dark(
//           primary: AppColor.buttonPrimaryDarkMode,
//           secondary: AppColor.buttonSecondaryDarkMode,
//           tertiary: AppColor.transparent,
//           onPrimary: AppColor.whiteDarkMode,
//           onTertiary: AppColor.whiteDarkMode,
//         ),
//       ),
//       focusColor: AppColor.focusButtonDarkMode,
//       dividerTheme:
//           DividerThemeData(color: AppColor.dividerDarkMode, thickness: 2),
//     );
//   }
// }
