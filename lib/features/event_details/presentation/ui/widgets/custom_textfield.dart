import 'package:amiy_app/core/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../core/utils/responive.dart'; 

/// A custom text field widget with validation and styling.
class CustomTextField extends StatelessWidget {
  /// Creates a [CustomTextField].
  ///
  /// The [controller], [label], [responsive], and [validator] parameters
  /// are required to initialize the widget.
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.label,
    required this.responsive,
    required this.validator,
  }) : super(key: key);

  /// The controller for managing the text field's content.
  final TextEditingController controller;

  /// The label text for the text field.
  final String label;

  /// The responsive design helper.
  final Responsive responsive;

  /// A function to validate the text field input.
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: responsive.blockSizeHorizontal * 70,
      child: TextFormField(
        controller: controller,
        validator: validator,
        decoration: InputDecoration(
          labelText: label,
          labelStyle: GoogleFonts.montserrat(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: const Color(AppColors.grey600),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: const BorderSide(
              color: Color(AppColors.primaryColor),
              width: 1.5,
            ),
          ),
        ),
        style: GoogleFonts.openSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: const Color(AppColors.black),
        ),
      ),
    );
  }
}
