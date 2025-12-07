import 'package:flutter/material.dart';

class Custombottomsheet extends StatelessWidget {
  const Custombottomsheet({super.key});

  @override
  Widget build(BuildContext context) {
    final bottom = MediaQuery.of(context).viewInsets.bottom;

    return Padding(
      padding: EdgeInsets.only(bottom: bottom),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // Barra de puxar
              Center(
                child: Container(
                  width: 40,
                  height: 5,
                  margin: const EdgeInsets.only(bottom: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),

              // Título
              const Center(
                child: Text(
                  "Criando BO-PM",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              const SizedBox(height: 5),

              // Subtítulo
              const Center(
                child: Text(
                  "Preencha as informações para criar um novo BO-PM",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ),

              const Divider(height: 30),

              // Campo UPM (texto fixo)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "UPM: 2º BPM",
                  style: TextStyle(fontSize: 16),
                ),
              ),

              const SizedBox(height: 15),

              // Campo Local
              _erroFieldDropdown(),

              const SizedBox(height: 15),

              // Campo BO SIGMA
              _erroField("Nº BO SIGMA"),

              const SizedBox(height: 15),

              // Campo Despacho
              _simpleField("Nº DESPACHO"),

              const SizedBox(height: 25),

              // Botões
              Row(
                children: [
                  Expanded(
                    child: _actionButton(
                      text: "Cancelar",
                      color: Colors.red,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _actionButton(
                      text: "Criar",
                      color: Colors.blue,
                      onPressed: () {
                        // ação criar
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  // -------- COMPONENTES REUTILIZÁVEIS -------- //

  Widget _erroField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: const Icon(Icons.error_outline, color: Colors.red),
        filled: true,
        fillColor: const Color(0xFFFFECEB),
        labelStyle: const TextStyle(color: Colors.red),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red),
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.red, width: 2),
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _simpleField(String label) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.grey[200],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }

  Widget _erroFieldDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: const Color(0xFFFFECEB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.red),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: null,
          hint: const Text("Local: Selecione",
              style: TextStyle(color: Colors.red)),
          icon: const Icon(Icons.arrow_drop_down),
          items: const [
            DropdownMenuItem(
              value: "A",
              child: Text("A"),
            ),
            DropdownMenuItem(
              value: "B",
              child: Text("B"),
            ),
          ],
          onChanged: (v) {},
        ),
      ),
    );
  }

  Widget _actionButton({
    required String text,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: Text(text, style: const TextStyle(fontSize: 16)),
      ),
    );
  }
}
