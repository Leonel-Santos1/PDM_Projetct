import 'package:flutter/material.dart';
import 'package:pdm_pm/routes/routes.dart';
import 'package:pdm_pm/widgets/appbar/AppBarCard.dart';
import 'package:pdm_pm/widgets/text/AppText.dart';
import '../../../widgets/app/app_color.dart';

class OcorrenceData extends StatefulWidget {
  const OcorrenceData({super.key});

  @override
  State<StatefulWidget> createState() => _OcorrenceDataPageOne();

}

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  backgroundColor: blueColor,
                ),
                child: AppText.text(
                  text: 'Prosseguir',
                  textFontSize: 16,
                )
            )
          ],
        ),
      ),
    );
  }
}