import 'package:flutter/material.dart';

class CardButton extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;

  // Cores e estilo
  final Color backgroundColor;
  final Color textColor;
  final double borderRadius;
  final double elevation;

  // Tamanhos principais
  final double? width;        // Novo: largura personalizada (padrão: ocupa tudo)
  final double height;

  // Tamanhos dos textos e ícone
  final double titleFontSize;
  final double subtitleFontSize;
  final double iconSize;

  // Padding interno
  final EdgeInsetsGeometry padding;

  // Ação
  final VoidCallback? onPressed;

  const CardButton({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.backgroundColor = const Color(0xFF0A57A3),
    this.textColor = Colors.white,
    this.borderRadius = 16,
    this.elevation = 2,
    this.width,                       // opcional
    this.height = 96,                 // padrão original
    this.titleFontSize = 26,          // padrão original
    this.subtitleFontSize = 14,       // padrão original
    this.iconSize = 36,               // padrão original
    this.padding = const EdgeInsets.symmetric(horizontal: 20),
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity, // se não passar width → ocupa toda a largura
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          padding: padding,
          elevation: elevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Coluna com título e subtítulo
            Expanded( // ← importante para não estourar a tela em textos longos
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      color: textColor,
                      fontSize: titleFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      color: textColor.withOpacity(0.8),
                      fontSize: subtitleFontSize,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),

            // Ícone
            Icon(
              icon,
              size: iconSize,
              color: textColor,
            ),
          ],
        ),
      ),
    );
  }
}