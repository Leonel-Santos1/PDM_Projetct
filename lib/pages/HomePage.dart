import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdm_pm/routes/routes.dart';
import 'package:pdm_pm/widgets/AppButton.dart';
import 'package:pdm_pm/widgets/CustomBottomSheet.dart';
import 'package:pdm_pm/widgets/app_color.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true, // 🔥 IMPORTANTE
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 31, 63),
        iconTheme: IconThemeData(color: Colors.white),

        title: Text(
          "Policia Militar",
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w600,
            shadows: [
              Shadow(
                offset: const Offset(0, 1),
                blurRadius: 3.0,
                color: Colors.black.withOpacity(0.3),
              ),
            ],
          ),
        ),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 1),
            child: IconButton(icon: Icon(Icons.person), onPressed: () {}),
          ),
        ],
      ),
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
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      builder: (context) => const Custombottomsheet(),
                    );
                  },
                ),

                const SizedBox(height: 20),

                CardButton(
                  title: "TCO",
                  backgroundColor: Color.fromARGB(255, 8, 82, 158),
                  subtitle: "Termo circustanciado de ocorrências",
                  icon: Icons.description_outlined,
                  onPressed: () {},
                ),

                const SizedBox(height: 20),

                CardButton(
                  title: "Biblioteca",
                  backgroundColor: Color.fromARGB(255, 8, 82, 158),
                  subtitle: "Documentos, manuais e busca de infração",
                  icon: Icons.menu_book_outlined,
                  onPressed: () {},
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
