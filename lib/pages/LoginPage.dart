import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pdm_pm/routes/routes.dart';
import 'package:pdm_pm/widgets/app/AppButton.dart';
import 'package:pdm_pm/widgets/AppTextInput.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 0, 31, 63),
      resizeToAvoidBottomInset: true, // 🔥 IMPORTANTE

      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),

              Image.asset("assets/images/falcon.png", scale: 3),

              Text(
                "Sistema de Ocorrências",
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
              Container(
                width: 366,
                height: 50,
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 10,
                ),

                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 38, 64, 92),
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ), // Cantos arredondados
                ),

                padding: const EdgeInsets.symmetric(horizontal: 20),

                child: Center(
                  child: Text(
                    "Acesso exclusivo para agentes autorizados do PMMA",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white.withValues(alpha: 0.9),
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              Container(
                width: 346,
                // Para preencher a largura
                height: 380,
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 16,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(
                    20.0,
                  ), // Cantos arredondados
                ),

                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shield,
                            color: Color.fromARGB(255, 38, 64, 92),
                            size: 28,
                          ),

                          const SizedBox(width: 10),
                          Text(
                            'Login do Agente',
                            style: GoogleFonts.poppins(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 38, 64, 92),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 10),

                      Container(
                        height: 4,
                        width: 60,
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 38, 64, 92),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),

                      const SizedBox(height: 24),

                      AppTextInput(
                        hintText: "Email",
                        prefixIcon: const Icon(Icons.mail_outline),
                      ),

                      const SizedBox(height: 24),

                      AppTextInput(
                        hintText: "Senha",
                        obscureText: true, // ativa o botão de mostrar/ocultar
                        prefixIcon: const Icon(Icons.lock_outline),
                      ),

                      Align(
                        alignment: Alignment.centerRight,

                        child: TextButton(
                          onPressed: () {},
                          child: Text(
                            'Esqueceu a senha?',
                            style: GoogleFonts.poppins(
                              color: Color.fromARGB(255, 38, 64, 92),
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoutes.home);
                        },
                        // icon: const Icon(Icons.shield, size: 26),
                        iconAlignment: IconAlignment.end,
                        label: Text(
                          'Entrar',
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 0, 51, 153),
                          foregroundColor: Colors.white,
                          minimumSize: const Size.fromHeight(50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 12, top: 8),
                        child: Center(
                          child: Text(
                            'Versão 1.0.3',
                            style: GoogleFonts.poppins(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 0, top: 15),
                child: Center(
                  child: Text(
                    'Desenvolvido para a Polícia Militar do Maranhão',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
