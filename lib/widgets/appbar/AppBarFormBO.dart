import 'package:flutter/material.dart';
import 'package:pdm_pm/widgets/text/AppText.dart';

import '../app/app_color.dart';

class AppBarForm extends StatefulWidget{
  final String title;
  final String? description;
  final VoidCallback? onTap;

  const AppBarForm({super.key, required this.title, this.description, this.onTap});

  @override
  State<AppBarForm> createState() => _AppBarFormState();
}

class _AppBarFormState extends State<AppBarForm> {
  @override
  Widget build(BuildContext context) {
    Color red = Color(0xFFF62323);
    Color whitePink = Color(0xFFFEEDED);

    return InkWell(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
        decoration: BoxDecoration(
            color: whitePink,
            borderRadius: BorderRadius.circular(20)
        ),
        margin: EdgeInsets.symmetric(vertical: 6),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText.text(
                      text: widget.title,
                      oneLine: true,
                      textColor: red,
                      textFontSize: 19,
                    ),
                    if(widget.description != null)
                      AppText.text(
                        text:  '- ${widget.description}',
                        oneLine: true,
                        textColor: red,
                        textFontSize: 12,
                      ),
                  ],
                )
            ),
            SizedBox(width: 13,),
            Icon(
              Icons.warning_amber,
              color: Color(0xFFF62323),
              size: 31,
            )
          ],
        ),
      ),
    );
  }
}