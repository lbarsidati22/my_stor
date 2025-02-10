import 'package:flutter/material.dart';

class LabelWithTextFeiled extends StatelessWidget {
  final String label;
  final String hintText;
  final IconData icon;
  final Widget? sufexIcon;
  final TextEditingController controller;
  final bool obSucurText;
  const LabelWithTextFeiled({
    super.key,
    required this.label,
    required this.hintText,
    required this.icon,
    this.sufexIcon,
    required this.controller,
    this.obSucurText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          validator: (value) {
            value == null || value.isEmpty ? '$label Cannot Be empty' : null;
          },
          controller: controller,
          obscureText: obSucurText,
          decoration: InputDecoration(
            suffixIcon: sufexIcon,
            prefixIcon: Icon(icon),
            hintText: hintText,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ],
    );
  }
}
