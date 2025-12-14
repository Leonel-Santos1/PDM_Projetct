import 'package:flutter/material.dart';
import '../../../widgets/appbar/AppBarCardBO.dart';
import '../../../widgets/button/AppButton.dart';

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  final TextEditingController _searchController = TextEditingController();
  List<String> _filteredInfracoes = [];

  // Lista completa de infrações do TCO (pode adicionar quantas quiser)
  final List<String> _infracoes = [
    "Lesão corporal leve",
    "Lesão corporal culposa",
    "Perigo para a vida ou saúde de outrem",
    "Exposição ou abandono de recém-nascido",
    "Omissão de socorro",
    "Omissão de socorro majorada pelo resultado",
    "Maus tratos",
    "Constrangimento ilegal",
    "Ameaça",
    "Perturbação da tranquilidade",
    "Vias de fato",
    "Dano",
    "Furto",
    "Roubo",
    "Receptação",
    "Apropriação indébita",
    "Estelionato",
    "Direção sem habilitação",
    "Embriaguez ao volante",
    "Posse de droga para consumo pessoal",
  ];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filtrarInfracoes);
  }

  @override
  void dispose() {
    _searchController.removeListener(_filtrarInfracoes);
    _searchController.dispose();
    super.dispose();
  }

  void _filtrarInfracoes() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      if (query.isEmpty) {
        _filteredInfracoes = [];
      } else {
        _filteredInfracoes = _infracoes
            .where((item) => item.contains(query))
            .toList();
      }
    });
  }

  void _selecionarInfracao(String infracao) {
    _searchController.text = infracao;
    setState(() => _filteredInfracoes = []);
    // Aqui você pode adicionar ao BO, abrir PDF, etc.
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Adicionado: $infracao")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: Appbarpm(
        text: "Biblioteca de Infrações",
        pmText: "PM",
        showTagEnabled: false,
        showRightIcon: false,
        colorText: Colors.white,
        fontSize: 16,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Título da seção
            const Text(
              "Pesquisa de Infrações do TCO",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 12),

            // Campo de busca + dropdown de resultados
            Stack(
              children: [
                TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: "Pesquisar infração",
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF08529E), width: 2),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF08529E), width: 2),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: const BorderSide(color: Color(0xFF08529E), width: 2.5),
                    ),
                  ),
                ),

                // Lista de resultados (só aparece quando tem texto)
                if (_filteredInfracoes.isNotEmpty)
                  Positioned(
                    top: 60,
                    left: 0,
                    right: 0,
                    child: Material(
                      elevation: 8,
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        constraints: const BoxConstraints(maxHeight: 320),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: ListView.builder(
                          padding: EdgeInsets.zero,
                          shrinkWrap: true,
                          itemCount: _filteredInfracoes.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(_filteredInfracoes[index]),
                              onTap: () => _selecionarInfracao(_filteredInfracoes[index]),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              ],
            ),

            const SizedBox(height: 40),

            // Título da seção de materiais
            const Text(
              "Materiais de Apoio",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 16),

            // Botões reutilizando seu CardButton
            CardButton(
              title: "Biblioteca BO - PM",
              titleFontSize: 20,
              subtitle: "Documentos de auxílio do Boletim de Ocorrência",
              subtitleFontSize: 12,
              icon: Icons.description,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Abrindo Biblioteca BO - PM")),
                );
              },
            ),
            const SizedBox(height: 12),

            CardButton(
              title: "Biblioteca TCO",
              titleFontSize: 20,
              subtitle: "Documentos de auxílio do Termo Circunstanciado",
              subtitleFontSize: 12,
              icon: Icons.file_copy,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Abrindo Biblioteca TCO")),
                );
              },
            ),
            const SizedBox(height: 12),

            CardButton(
              title: "Orientações Procedimentais",
              subtitle: "Documentos de auxílio para ocorrências processuais",
              titleFontSize: 20,
              subtitleFontSize: 12,
              icon: Icons.menu_book,
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Abrindo Orientações Procedimentais")),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}