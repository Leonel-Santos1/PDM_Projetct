import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pdm_pm/widgets/app/app_color.dart';
import 'package:pdm_pm/widgets/text/AppText.dart';

class FactCard extends StatelessWidget {
  const FactCard({super.key});

  @override
  Widget build(BuildContext context) {
    final Color blueColor = Color(0xFF08529E);

    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.grey.shade300),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppText.text(
                text: 'Fatos',
                oneLine: true,
                textFontSize: 16,
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.add_circle, color: blueColor),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.red),
                    onPressed: () {},
                  ),
                ],
              )
            ],
          ),
          TextField(
            decoration: InputDecoration(
              labelText: "Código",
              border: UnderlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}