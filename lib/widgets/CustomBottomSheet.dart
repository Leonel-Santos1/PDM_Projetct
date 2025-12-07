import 'package:flutter/material.dart';

// ====================== CONFIGURAÇÃO ======================
enum FormFieldType { text, dropdown }

class FormFieldConfig {
  final String key;
  final String label;
  final String? hint;
  final FormFieldType type;
  final bool required;
  final List<String>? options;

  FormFieldConfig.text({
    required this.key,
    required this.label,
    this.required = true,
  }) : type = FormFieldType.text,
        hint = null,
        options = null;

  FormFieldConfig.dropdown({
    required this.key,
    required this.label,
    this.hint,
    required this.options,
    this.required = true,
  }) : type = FormFieldType.dropdown;
}

// ====================== BOTTOM SHEET REUTILIZÁVEL ======================
class ReusableFormBottomSheet extends StatefulWidget {
  final String title;
  final String? subtitle;
  final String? fixedInfoLabel;
  final List<FormFieldConfig> fields;
  final Function(Map<String, dynamic> data) onSubmit;  // ← obrigatório agora

  const ReusableFormBottomSheet({
    super.key,
    required this.title,
    this.subtitle,
    this.fixedInfoLabel,
    required this.fields,
    required this.onSubmit,
  });

  @override
  State<ReusableFormBottomSheet> createState() => _ReusableFormBottomSheetState();
}

class _ReusableFormBottomSheetState extends State<ReusableFormBottomSheet> {
  late final Map<String, TextEditingController> _controllers;
  late final Map<String, bool> _errors;
  late final Map<String, String?> _dropdownValues;

  @override
  void initState() {
    super.initState();
    _controllers = {};
    _errors = {};
    _dropdownValues = {};

    for (var f in widget.fields) {
      if (f.type == FormFieldType.text) {
        _controllers[f.key] = TextEditingController();
        _errors[f.key] = f.required;
      } else {
        _dropdownValues[f.key] = null;
        _errors[f.key] = f.required;
      }
    }
  }

  @override
  void dispose() {
    _controllers.values.forEach((c) => c.dispose());
    super.dispose();
  }

  void _submit() {
    bool hasError = false;

    // Validação
    for (var field in widget.fields) {
      if (field.type == FormFieldType.text && field.required) {
        final empty = _controllers[field.key]!.text.trim().isEmpty;
        _errors[field.key] = empty;
        if (empty) hasError = true;
      }
      if (field.type == FormFieldType.dropdown && field.required) {
        final empty = _dropdownValues[field.key] == null;
        _errors[field.key] = empty;
        if (empty) hasError = true;
      }
    }

    setState(() {}); // atualiza os erros visuais

    if (!hasError) {
      // Monta o resultado
      final Map<String, dynamic> result = {};
      for (var field in widget.fields) {
        if (field.type == FormFieldType.text) {
          result[field.key] = _controllers[field.key]!.text.trim();
        } else if (field.type == FormFieldType.dropdown) {
          result[field.key] = _dropdownValues[field.key];
        }
      }

      // FECHA PRIMEIRO, DEPOIS CHAMA O CALLBACK
      Navigator.of(context).pop();           // ← fecha o bottom sheet
      widget.onSubmit(result);               // ← aqui o print vai aparecer!
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
        left: 20,
        right: 20,
        top: 20,
      ),
      child: Material(   // ← Material resolve 99% dos problemas de clique
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Barra de puxar
              Container(width: 40, height: 5, margin: EdgeInsets.only(top: 10, bottom: 15),
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(10)),
              ),

              Text(widget.title, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              if (widget.subtitle != null) ...[
                SizedBox(height: 5),
                Text(widget.subtitle!, style: TextStyle(color: Colors.grey)),
              ],
              Divider(height: 30),

              if (widget.fixedInfoLabel != null)
                Container(
                  padding: EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(12)),
                  child: Text(widget.fixedInfoLabel!),
                ),

              if (widget.fixedInfoLabel != null) SizedBox(height: 15),

              ...widget.fields.map((field) => Padding(
                padding: EdgeInsets.only(bottom: 15),
                child: _buildField(field),
              )).toList(),

              SizedBox(height: 10),

              Row(
                children: [
                  Expanded(child: _button("Cancelar", Colors.red, () => Navigator.pop(context))),
                  SizedBox(width: 15),
                  Expanded(child: _button("Criar", Color.fromARGB(255, 8, 82, 158), _submit)),
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(FormFieldConfig field) {
    final hasError = _errors[field.key] ?? false;

    if (field.type == FormFieldType.dropdown) {
      return Container(
        padding: EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: hasError ? Color(0xFFFFECEB) : Colors.grey[200],
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: hasError ? Colors.red : Colors.grey),
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            isExpanded: true,
            hint: Text(field.hint ?? "Selecione", style: TextStyle(color: hasError ? Colors.red : null)),
            value: _dropdownValues[field.key],
            items: field.options!.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (v) {
              setState(() {
                _dropdownValues[field.key] = v;
                if (field.required) _errors[field.key] = v == null;
              });
            },
          ),
        ),
      );
    }

    return TextField(
      controller: _controllers[field.key],
      onChanged: field.required ? (v) => setState(() => _errors[field.key] = v.trim().isEmpty) : null,
      decoration: InputDecoration(
        labelText: field.label,
        prefixIcon: field.required && hasError ? Icon(Icons.error_outline, color: Colors.red) : null,
        filled: true,
        fillColor: field.required && hasError ? Color(0xFFFFECEB) : Colors.grey[200],
        labelStyle: TextStyle(color: field.required && hasError ? Colors.red : null),
        enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: field.required && hasError ? Colors.red : Colors.grey), borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: field.required && hasError ? Colors.red : Colors.blue, width: 2), borderRadius: BorderRadius.circular(12)),
      ),
    );
  }

  Widget _button(String text, Color color, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: color, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)), minimumSize: Size(double.infinity, 50)),
      onPressed: onPressed,
      child: Text(text, style: TextStyle(color: Colors.white, fontSize: 16)),
    );
  }
}