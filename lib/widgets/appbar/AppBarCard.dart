import 'package:flutter/material.dart';
import 'package:pdm_pm/widgets/text/AppText.dart';

import '../../routes/routes.dart';
import '../app/app_color.dart';

class AppBarCard extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? route;
  final Color? textColor;

  const AppBarCard({super.key, required this.title, this.route, this.textColor});

  @override
  Widget build(BuildContext context) {
    const Color blueColor = Color(0xFF08529E);

    return AppBar(
      automaticallyImplyLeading: false,
        backgroundColor: blueColor,
        titleSpacing: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 55,
          children: [
            IconButton(
              onPressed: (){
                if(route != null) {
                  Navigator.pushReplacementNamed(context, route!);
                }
              },
              color: AppColor.black,
              icon: Icon(Icons.arrow_back),
              padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
            ),
            AppText.text(
              text: title,
              textFontSize: 19,
              textColor: textColor ?? AppColor.white,
              oneLine: true,
            ),
          ],
        )
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(45);



}