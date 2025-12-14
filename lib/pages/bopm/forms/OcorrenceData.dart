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
  final Color darkBlueColor = Color.fromARGB(255, 0, 31, 63);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBarCard(
        title: 'Dados da Ocorrência',
        route: AppRoutes.bopm,
        appBarColor: darkBlueColor,
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
            Column(
              children: fatosList.map((widget) => Padding(
                padding: EdgeInsets.only(bottom: 8),
                child: widget,
              )).toList(),
            ),

            SizedBox(height: 12),
            AppText.text(
              text: "Data e Hora",
              textFontSize: 16
            ),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(labelText: 'Horário')),
            SizedBox(height: 16),

            TextField(decoration: InputDecoration(labelText: 'Data')),
            SizedBox(height: 16),

            AppText.text(
              text:'Armas e Objetos Apreendidos/Encontrados',
              textFontSize: 16,
            ),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(labelText: 'Armas e Objetos')),
            SizedBox(height: 16),

            AppText.text(
              text: 'Histórico',
              textFontSize: 16
            ),
            SizedBox(height: 8),
            TextField(decoration: InputDecoration(labelText: 'Histórico')),
            SizedBox(height: 100),
          ],
        ),
      ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              fatosList.add(FactCard());
            });
          },
          backgroundColor: Colors.blue,
          child: const Icon(Icons.add),
        ),
    );
  }
}