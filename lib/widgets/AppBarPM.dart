import 'package:flutter/material.dart';
import 'package:pdm_pm/routes/routes.dart';

class Appbarpm extends StatelessWidget implements PreferredSizeWidget{
  const Appbarpm({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white70,
      leading: IconButton(
          onPressed: (){
            Navigator.pushReplacementNamed(context, AppRoutes.home);
          },
          icon: Icon(Icons.arrow_back)
      ),
      title: GestureDetector(
        onTap: (){},
        child: Container(
          width: 250,
          padding: EdgeInsets.symmetric(vertical: 2, horizontal: 20),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(25);

}