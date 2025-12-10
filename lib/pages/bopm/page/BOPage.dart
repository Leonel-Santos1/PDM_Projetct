import 'package:flutter/material.dart';
import 'package:pdm_pm/routes/routes.dart';
import 'package:pdm_pm/widgets/appbar/AppBarCardBO.dart';
import 'package:pdm_pm/widgets/appbar/AppBarFormBO.dart';
import 'package:pdm_pm/widgets/app/app_color.dart';
import 'package:pdm_pm/widgets/text/AppText.dart';

class BOPage extends StatefulWidget {
  const BOPage({super.key});

  @override
  State<StatefulWidget> createState() => _BOPageState();
}

class _BOPageState extends State<BOPage> {

  late List<AppBarForm> widgetList = [
    AppBarForm(title: 'Dados do envolvido', description: 'Ausencia de dados',),
    AppBarForm(title: 'Efetivo Empenhado', description: 'Ausencia de dados',),
    AppBarForm(title: 'Dados da ocorrência',
      description: 'Ausencia de dados',
      onTap: (context){
        Navigator.pushReplacementNamed(context, AppRoutes.ocorrence_data);
      },
    )
  ];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       backgroundColor: Colors.white,

       appBar: Appbarpm(

         text: 'aaaaaa',
         pmText: 'Sigma: ',
       ),
       body: Padding(
         padding: EdgeInsetsGeometry.symmetric(vertical: 10, horizontal: 20),
         child: Column(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             Expanded(
                 child:ListView.builder(
                     reverse: true,
                     itemCount: widgetList.length,
                     itemBuilder: (context, index) {
                       return widgetList[index];
                     }
                 )
             ),
             SizedBox(height: 15,),
             Row(
               mainAxisAlignment: MainAxisAlignment.end,
               children: [
                 FloatingActionButton.extended(
                   shape: RoundedRectangleBorder(
                       borderRadius: BorderRadiusGeometry.circular(20)
                   ),
                   onPressed: (){
                      setState(() {
                        widgetList.insert(0,
                            AppBarForm(
                              title: 'Dados do envolvido',
                              description: 'Ausencia de dados',
                            )
                        );
                      });
                   },
                   backgroundColor: Color(0xFF08529E),
                   label: AppText.text(
                     text: 'Criar',
                     textColor: AppColor.white,
                     textFontSize: 17
                   ),
                   icon: Icon(Icons.add, color: AppColor.white,),
                 ),
               ],
             ),
             SizedBox(height: 20,)
           ],
         ),
       ),
   );
  }
}
