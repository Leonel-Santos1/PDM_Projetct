import 'package:flutter/material.dart';

class ReusableFormBottomSheet extends StatefulWidget {
  final String title;
  final String? subtitle;
  final List<FormFieldConfig> fields;
  final String? fixedInfoLabel; // ex: "UPM: 2º BPM"
  final VoidCallback? onCancel;
  final Function(Map<String, dynamic> data)? onSubmit;

  const ReusableFormBottomSheet({
    super.key,
    required this.title,
    this.subtitle,
    required this.fields,
    this.fixedInfoLabel,
    this.onCancel,
    this.onSubmit,
  });

  @override
  State<ReusableFormBottomSheet> createState() =>
      _ReusableFormBottomSheetState();
}

class _ReusableFormBottomSheetState extends State<ReusableFormBottomSheet> {
  late final Map<String, TextEditingController> _controllers;
  late final Map<String, bool> _hasError;
  late final Map<String, String?> _dropdownValues;

  @override
  void initState() {
    super.initState();
    _controllers = {};
    _hasError = {};
    _dropdownValues = {};

    for (var field in widget.fields) {
      if (field.type == FormFieldType.text) {
        _controllers[field.key] = TextEditingController();
        _hasError[field.key] = field.required;
      } else if (field.type == FormFieldType.dropdown) {
        _dropdownValues[field.key] = null;
        _hasError[field.key] = field.required;
      }
    }
  }

  @override
  void dispose() {
    _controllers.values.forEach((c) => c.dispose());
    super.dispose();
  }

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

              Text(
                widget.title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (widget.subtitle != null) ...[
                const SizedBox(height: 5),
                Text(
                  widget.subtitle!,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                  textAlign: TextAlign.center,
                ),
              ],
              const Divider(height: 30),

              // Informação fixa (ex: UPM)
              if (widget.fixedInfoLabel != null)
                Container(
                  padding: const EdgeInsets.all(15),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    widget.fixedInfoLabel!,
                    style: const TextStyle(fontSize: 16),
                  ),
                ),

              if (widget.fixedInfoLabel != null) const SizedBox(height: 15),

              // Campos dinâmicos
              ...widget.fields.map(_buildField),

              const SizedBox(height: 25),

              Row(
                children: [
                  Expanded(
                    child: _actionButton("Cancelar", Colors.red, () {
                      widget.onCancel?.call();
                      Navigator.pop(context);
                    }),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: _actionButton(
                      "Criar",
                      const Color.fromARGB(255, 8, 82, 158),
                      _submit,
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

  Widget _buildField(FormFieldConfig config) {
    final bool hasError = _hasError[config.key] ?? false;

    if (config.type == FormFieldType.dropdown) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 15),
        child: _dropdownField(config, hasError),
      );
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: TextField(
        controller: _controllers[config.key],
        onChanged: (value) {
          if (config.required) {
            setState(() => _hasError[config.key] = value.trim().isEmpty);
          }
        },
        decoration: InputDecoration(
          labelText: config.label,
          prefixIcon: config.required && hasError
              ? const Icon(Icons.error_outline, color: Colors.red)
              : null,
          filled: true,
          fillColor: config.required && hasError
              ? const Color(0xFFFFECEB)
              : Colors.grey[200],
          labelStyle: TextStyle(
            color: config.required && hasError ? Colors.red : Colors.black87,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: config.required && hasError ? Colors.red : Colors.grey,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: config.required && hasError ? Colors.red : Colors.blue,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }

  Widget _dropdownField(FormFieldConfig config, bool hasError) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: hasError ? const Color(0xFFFFECEB) : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasError ? Colors.red : Colors.grey,
          width: 1.3,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: _dropdownValues[config.key],
          hint: Text(
            config.hint ?? "Selecione",
            style: TextStyle(color: hasError ? Colors.red : Colors.black87),
          ),
          icon: Icon(
            Icons.arrow_drop_down,
            color: hasError ? Colors.red : Colors.black,
          ),
          items: config.options!
              .map((opt) => DropdownMenuItem(value: opt, child: Text(opt)))
              .toList(),
          onChanged: (value) {
            setState(() {
              _dropdownValues[config.key] = value;
              if (config.required) _hasError[config.key] = value == null;
            });
          },
        ),
      ),
    );
  }

  void _submit() {
    bool hasError = false;

    for (var field in widget.fields) {
      if (field.type == FormFieldType.text && field.required) {
        final empty = _controllers[field.key]!.text.trim().isEmpty;
        _hasError[field.key] = empty;
        if (empty) hasError = true;
      }
      if (field.type == FormFieldType.dropdown && field.required) {
        final empty = _dropdownValues[field.key] == null;
        _hasError[field.key] = empty;
        if (empty) hasError = true;
      }
    }

    if (!hasError) {
      final Map<String, dynamic> result = {};
      for (var field in widget.fields) {
        if (field.type == FormFieldType.text) {
          result[field.key] = _controllers[field.key]!.text.trim();
        } else if (field.type == FormFieldType.dropdown) {
          result[field.key] = _dropdownValues[field.key];
        }
      }
      widget.onSubmit?.call(result);
      Navigator.pop(context);
    } else {
      setState(() {});
    }
  }

  Widget _actionButton(String text, Color color, VoidCallback onPressed) {
    return SizedBox(
      height: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}

// ========== CONFIGURAÇÃO DOS CAMPOS ==========
enum FormFieldType { text, dropdown }

class FormFieldConfig {
  final String key; // identificador único (ex: "bo", "despacho", "local")
  final String label;
  final String? hint;
  final FormFieldType type;
  final bool required;
  final List<String>? options; // apenas para dropdown

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
