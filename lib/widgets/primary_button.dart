import 'package:flutter/material.dart';
import 'package:instagram_clone/utils/colors.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.isLoading = false,
  }) : super(key: key);
  final String label;
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        child: isLoading
            ? const Center(
                child: CircularProgressIndicator(color: primaryColor),
              )
            : Text(
                label,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
        width: 150.0,
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: const ShapeDecoration(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(6.0),
            ),
          ),
          gradient: LinearGradient(
            colors: [
              Color(0xFF7E38AF),
              Color(0xFFF70207),
              Color(0xFFF7C601),
            ],
          ),
        ),
      ),
    );
  }
}
