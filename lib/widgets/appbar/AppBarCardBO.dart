// lib/widgets/appbar/Appbarpm.dart

import 'package:flutter/material.dart';
import 'package:pdm_pm/routes/routes.dart';
import 'package:pdm_pm/widgets/app/app_color.dart';

class Appbarpm extends StatelessWidget implements PreferredSizeWidget {
  final String pmText;
  final String text;

  // Aparência do texto
  final Color colorText;
  final double fontSize;           // Novo: tamanho da fonte (padrão 15)
  final FontWeight fontWeight;     // Opcional: peso da fonte

  // Controles da AppBar
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  final bool showRightIcon;
  final IconData rightIcon;
  final Color? rightIconColor;
  final VoidCallback? onRightIconPressed;

  final bool showTagEnabled;
  final Color? tagBackgroundColor;

  const Appbarpm({
    super.key,
    required this.pmText,
    required this.text,
    this.colorText = Colors.black,
    this.fontSize = 15.0,                 // padrão original
    this.fontWeight = FontWeight.w600,
    this.showBackButton = true,
    this.onBackPressed,
    this.showRightIcon = true,
    this.rightIcon = Icons.menu,
    this.rightIconColor,
    this.onRightIconPressed,
    this.showTagEnabled = true,
    this.tagBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // Texto central com tag expansível e fonte personalizável
    Widget titleWidget = Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
      decoration: showTagEnabled
          ? BoxDecoration(
        color: tagBackgroundColor ?? const Color(0xFFFA8989),
        borderRadius: BorderRadius.circular(32),
      )
          : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: Text(
              pmText,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                color: colorText,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
          const SizedBox(width: 6),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                fontFamily: 'Plus Jakarta Sans',
                color: colorText,
                fontSize: fontSize,
                fontWeight: fontWeight,
              ),
              overflow: TextOverflow.visible,
              softWrap: false,
            ),
          ),
        ],
      ),
    );

    return AppBar(
      backgroundColor: const Color.fromARGB(255, 0, 31, 63),
      elevation: 0,
      centerTitle: true, // sempre centralizado!

      // Botão voltar
      leading: showBackButton
          ? IconButton(
        onPressed: onBackPressed ??
                () => Navigator.pushReplacementNamed(context, AppRoutes.home),
        icon: const Icon(Icons.arrow_back_ios_new),
        color: AppColor.white,
      )
          : null,
      leadingWidth: showBackButton ? 56 : 16,

      // Título sempre no centro
      title: titleWidget,

      // Ícone da direita
      actions: showRightIcon
          ? [
        IconButton(
          icon: Icon(rightIcon),
          color: rightIconColor ?? AppColor.white,
          onPressed: onRightIconPressed ?? () {},
        ),
        const SizedBox(width: 12),
      ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}