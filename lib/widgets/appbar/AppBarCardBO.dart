import 'package:flutter/material.dart';
import 'package:pdm_pm/routes/routes.dart';
import 'package:pdm_pm/widgets/appbar/AppBarFormBO.dart';
import 'package:pdm_pm/widgets/app/app_color.dart';

class Appbarpm extends StatelessWidget implements PreferredSizeWidget{
  final String pmText;
  final String text;

  const Appbarpm({super.key, required this.text, required this.pmText});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF08529E),
      leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          },
          color: AppColor.black,
          icon: Icon(Icons.arrow_back),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 10),
      ),
      leadingWidth: 60,
      title: GestureDetector(
        onTap: (){},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
          decoration: BoxDecoration(
            color: Color(0xFFFA8989),
            borderRadius: BorderRadius.circular(32)
          ),
          child: Row(
            children: [
              Text(
                pmText,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
                style: TextStyle(
                  fontFamily: 'Plus Jakarta Sans',
                  color: AppColor.black,
                  fontSize: 15
                ),
              ),
              SizedBox(width: 2,),
              Text(
                text,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
                style: TextStyle(
                    fontFamily: 'Plus Jakarta Sans',
                    color: AppColor.black,
                    fontSize: 15
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: (){},
          color: AppColor.black,
          icon: Icon(Icons.menu),
        )
      ],
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(45);

}