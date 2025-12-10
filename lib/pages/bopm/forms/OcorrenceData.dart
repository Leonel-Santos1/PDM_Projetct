import 'package:flutter/material.dart';
import 'package:pdm_pm/routes/routes.dart';
import 'package:pdm_pm/widgets/appbar/AppBarCard.dart';
import 'package:pdm_pm/widgets/text/AppText.dart';
import '../../../widgets/app/app_color.dart';
import '../widget/FactCard.dart';

class OcorrenceData extends StatefulWidget {
  const OcorrenceData({super.key});

  @override
  State<StatefulWidget> createState() => _OcorrenceDataPageOne();
}

List<FactCard> fatosList = [
  FactCard(),
];

class _OcorrenceDataPageOne extends State<OcorrenceData> {
  final Color blueColor = Color(0xFF08529E);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBarCard(
        title: 'Dados da Ocorrência',
        route: AppRoutes.bopm,
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsetsGeometry.symmetric(vertical: 8, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: (){},
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColor.red,
                        fixedSize: Size(130, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(20)
                        )
                    ),
                    child: AppText.text(
                      text: 'Cancelar',
                      textFontSize: 16,
                    )
                )
            ),
           Expanded(
               child:  ElevatedButton(
                   onPressed: (){},
                   style: ElevatedButton.styleFrom(
                       backgroundColor: blueColor,
                       fixedSize: Size(130, 60),
                       shape: RoundedRectangleBorder(
                           borderRadius: BorderRadiusGeometry.circular(20)
                       )
                   ),
                   child: AppText.text(
                     text: 'Prosseguir',
                     textFontSize: 16,
                   )
               )
           )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ],
        ),
      ),
    );
  }
}