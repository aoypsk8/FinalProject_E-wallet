import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:google_fonts/google_fonts.dart';

class buildFormField extends StatelessWidget {
  const buildFormField({
    super.key,
    this.isValidate = true,
    required this.controller,
    required this.hinText,
    this.max,
    this.suffixIcon,
    this.suffixonTapFuc,
  });

  final bool isValidate;
  final String hinText;
  final int? max;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final Function()? suffixonTapFuc;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: cr_f2f2, width: 1.5),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: cr_f63, width: 1.5),
    );

    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (max != null && value.length == max) {
            FocusScope.of(context).unfocus();
          }
        },
        style: GoogleFonts.notoSansLao(),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ),
          suffixIcon: suffixonTapFuc != null
              ? Container(
                  margin: const EdgeInsets.only(right: 5),
                  child: InkWell(
                    onTap: suffixonTapFuc,
                    child: suffixIcon,
                  ),
                )
              : null,
          border: InputBorder.none,
          hintText: tr(hinText),
          hintStyle: GoogleFonts.notoSansLao(),
          filled: true,
          enabledBorder: border,
          focusedBorder: border,

          //! error border
          errorStyle: GoogleFonts.notoSansLao(color: cr_f63),
          focusedErrorBorder: errorBorder,
          errorBorder: errorBorder,
        ),
        validator: isValidate
            ? FormBuilderValidators.compose([
                FormBuilderValidators.required(),
              ])
            : null,
      ),
    );
  }
}
