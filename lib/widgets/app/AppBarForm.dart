import 'package:flutter/material.dart';

import '../app_color.dart';

class AppBarForm extends StatefulWidget{
  final String title;
  final String? description;

  const AppBarForm({super.key, required this.title, this.description});

  @override
  State<AppBarForm> createState() => AppBarFormState();
}

class AppBarFormState extends State<AppBarForm> {
  @override
  Widget build(BuildContext context) {
    return Container(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 22),
          decoration: BoxDecoration(
            color: Color(0xFFFEEDED),
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
                      Text(
                        widget.title,
                        maxLines: 1,
                        softWrap: true,
                        style: TextStyle(
                            fontFamily: 'Plus Jakarta Sans',
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF62323),
                            fontSize: 19
                        ),
                      ),
                      if(widget.description != null)
                        Text(
                          '- ${widget.description}',
                          maxLines: 1,
                          softWrap: true,
                          style: TextStyle(
                              fontFamily: 'Plus Jakarta Sans',
                              color: Color(0xFFF62323),
                              fontSize: 12
                          ),
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
        );
  }
}