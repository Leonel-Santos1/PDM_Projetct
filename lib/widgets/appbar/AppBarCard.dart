import 'package:flutter/material.dart';
import 'package:pdm_pm/widgets/text/AppText.dart';

import '../../routes/routes.dart';
import '../app/app_color.dart';

class AppBarCard extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? route;
  final Color? textColor;
  final Color? appBarColor;

  const AppBarCard({super.key, required this.title, this.route, this.textColor, this.appBarColor});

  @override
  Widget build(BuildContext context) {

    return AppBar(
      automaticallyImplyLeading: false,
        backgroundColor: appBarColor,
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
              color: AppColor.white,
              icon: Icon(Icons.arrow_back_ios_new),
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