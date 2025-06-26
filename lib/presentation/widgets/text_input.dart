import 'package:flutter/material.dart';

enum TextType { email, password, text }

class TextInput extends StatefulWidget {
  final TextType type;
  final String hintText;

  const TextInput({
    super.key,
    required this.hintText,
    this.type = TextType.email,
  });

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          obscureText: widget.type == TextType.password && !showPassword,
          keyboardType: widget.type == TextType.email
              ? TextInputType.emailAddress
              : TextInputType.text,
          decoration: InputDecoration(
            hintText: widget.hintText,
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 16,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            suffixIcon: widget.type == TextType.password
                ? IconButton(
                  tooltip: showPassword ? 'Ocultar contraseña' : 'Mostrar contraseña',
                    icon: Icon(
                      showPassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                    ),
                    color: Colors.grey,
                    onPressed: () {
                      setState(() => showPassword = !showPassword);
                    },
                  )
                : null,
          ),
        ),
        const SizedBox(height: 30),
      ],
    );
  }
}
