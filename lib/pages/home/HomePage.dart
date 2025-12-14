import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdm_pm/routes/routes.dart';
import 'package:pdm_pm/widgets/appbar/AppBarCardBO.dart';
import 'package:pdm_pm/widgets/button/AppButton.dart';
import 'package:pdm_pm/widgets/CustomBottomSheet.dart';
import 'package:pdm_pm/widgets/app/app_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      appBar: Appbarpm(
        pmText: "Policia Militar",
        text: "",
        rightIcon: Icons.person,
        colorText: Colors.white,
        showTagEnabled: false,
        fontSize: 20,

      ),

      // AppBar(
      //   backgroundColor: Color.fromARGB(255, 0, 31, 63),
      //   iconTheme: IconThemeData(color: Colors.white),
      //   title: Text(
      //     "Policia Militar",
      //     style: GoogleFonts.poppins(
      //       color: Colors.white,
      //       fontSize: 20,
      //       fontWeight: FontWeight.w600,
      //       shadows: [
      //         Shadow(
      //           offset: const Offset(0, 1),
      //           blurRadius: 3.0,
      //           color: Colors.black.withOpacity(0.3),
      //         ),
      //       ],
      //     ),
      //   ),
      //
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 1),
      //       child: IconButton(icon: Icon(Icons.person), onPressed: () {}),
      //     ),
      //   ],
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 40),
                Image.asset("assets/images/policia.png", width: 200),
                const SizedBox(height: 90),
                CardButton(
                  title: "BO - PM",
                  backgroundColor: Color.fromARGB(255, 8, 82, 158),
                  subtitle: "Boletim de ocorrências da polícia militar",
                  icon: Icons.description_outlined,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      builder: (_) => ReusableFormBottomSheet(
                        title: "Criando BO-PM",
                        subtitle:
                        "Preencha as informações para criar um novo BO-PM",
                        fixedInfoLabel: "UPM: 2º BPM",
                        fields: [
                          FormFieldConfig.dropdown(
                            key: "local",
                            label: "Local",
                            hint: "Local: Selecione",
                            options: [
                              "Caxias",
                              "Aldeias Altas",
                              "São João do Sóter",
                            ],
                            required: true,
                          ),
                          FormFieldConfig.text(
                            key: "bo",
                            label: "Nº BO SIGMA",
                            required: true,
                          ),
                          FormFieldConfig.text(
                            key: "despacho",
                            label: "Nº DESPACHO",
                            required: false,
                          ), // opcional
                        ],
                        onSubmit: (data) {
                          // 1. Fecha o bottom sheet
                          Navigator.pop(context);

                          // 2. Vai para a tela Home (exatamente como você já faz em outras partes)
                          Navigator.pushNamed(context, AppRoutes.bopm);

                          // OPCIONAL: se quiser usar os dados depois (ex: salvar no banco, mostrar toast etc)
                          print(
                            "BO criado: ${data['bo']}, Local: ${data['local']}, Despacho: ${data['despacho']}",
                          );
                          // Exemplo: ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("BO criado com sucesso!")));
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                CardButton(
                  title: "TCO",
                  backgroundColor: Color.fromARGB(255, 8, 82, 158),
                  subtitle: "Termo circustanciado de ocorrências",
                  icon: Icons.description_outlined,
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.white,
                      builder: (_) => ReusableFormBottomSheet(
                        title: "Criando TCO",
                        subtitle:
                        "Preencha as informações para criar um novo TCO",
                        fixedInfoLabel: "UPM: 2º BPM",
                        fields: [
                          FormFieldConfig.dropdown(
                            key: "local",
                            label: "Local",
                            hint: "Local: Selecione",
                            options: [
                              "Caxias",
                              "Aldeias Altas",
                              "São João do Sóter",
                            ],
                            required: true,
                          ),
                          FormFieldConfig.text(
                            key: "ciops",
                            label: "Nº CIOPS/COPM",
                            required: false,
                          ), // opcional
                        ],
                        onSubmit: (data) {
                          print("Dados: $data");
                          Navigator.pushNamed(context, AppRoutes.bopm);
                          // data["local"] → String?
                          // data["bo"] → String
                          // data["despacho"] → String (pode estar vazio)
                        },
                      ),
                    );
                  },
                ),

                const SizedBox(height: 20),

                CardButton(
                  title: "Biblioteca",
                  backgroundColor: Color.fromARGB(255, 8, 82, 158),
                  subtitle: "Documentos, manuais e busca de infração",
                  icon: Icons.menu_book_outlined,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoutes.bib);
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}