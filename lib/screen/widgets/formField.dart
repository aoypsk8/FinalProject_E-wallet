import 'package:final_flutter_ewallet/screen/widgets/textFont.dart';
import 'package:final_flutter_ewallet/utils/colors.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

// ignore: camel_case_types
class buildFormField extends StatelessWidget {
  const buildFormField({
    super.key,
    this.isValidate = true,
    required this.controller,
    required this.hinText,
    this.max,
    this.suffixIcon,
    this.suffixonTapFuc,
    this.color = cr_fff,
    this.fillColor = true,
    this.hintTextColor = cr_fff,
    this.typeInput = TextInputType.number,
  });

  final bool isValidate;
  final bool? fillColor;
  final String hinText;
  final int? max;
  final Color? color;
  final Color? hintTextColor;
  final TextEditingController controller;
  final Widget? suffixIcon;
  final TextInputType? typeInput;
  final Function()? suffixonTapFuc;

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: cr_f2f2, width: 1),
    );
    final errorBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: cr_f63, width: 1),
    );

    return SizedBox(
      width: double.infinity,
      child: TextFormField(
        keyboardType: typeInput,
        controller: controller,
        onChanged: (value) {
          if (max != null && value.length == max) {
            FocusScope.of(context).unfocus();
          }
        },
        style: GoogleFonts.notoSansLao(color: hintTextColor),
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
          hintStyle: GoogleFonts.notoSansLao(
            color: hintTextColor,
          ),
          filled: fillColor,
          fillColor: color,
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

class BuildTextAreaValidate extends StatelessWidget {
  BuildTextAreaValidate({
    Key? key,
    required this.controller,
    this.label = '',
    required this.name,
    this.hintText = '',
    this.icon,
    this.iconColor = color_777,
    this.max,
    this.suffixIcon,
    this.suffixonTapFuc,
    this.fillcolor = cr_f2f2,
    this.inputHeight = 50.0,
  });

  final TextEditingController controller;
  final String name;
  final String label;
  final String hintText;
  final IconData? icon;
  final Color iconColor;
  final int? max;
  final Color fillcolor;
  final Widget? suffixIcon;
  final Function()? suffixonTapFuc;
  final double inputHeight;

  final storage = GetStorage();

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: const BorderSide(color: cr_f2f2, width: 1),
    );
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.multiline,
      maxLines: 6,
      maxLength: max == null ? null : max,
      style: storage.read('lang_id') == 'lo'
          ? GoogleFonts.notoSansLao(
              color: cr_436,
              fontSize: 12.5.sp,
            )
          : GoogleFonts.poppins(
              color: cr_436,
              fontSize: 12.5.sp,
            ),
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(12),
        hintText: hintText.tr(),
        hintStyle: storage.read('lang_id') == 'lo'
            ? GoogleFonts.notoSansLao(
                color: cr_4c4,
                fontSize: 12.5.sp,
              )
            : GoogleFonts.poppins(
                color: cr_4c4,
                fontSize: 12.5.sp,
              ),
        // fillColor: fillcolor,
        // filled: true,
        counter: const SizedBox.shrink(),
        enabledBorder: border,
        focusedBorder: border,
        //! error border
        errorStyle: GoogleFonts.notoSansLao(color: Colors.red),
        focusedErrorBorder: border,
        errorBorder: border,
      ),
    );
  }
}
