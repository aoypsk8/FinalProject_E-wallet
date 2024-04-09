import 'package:flutter/material.dart';

class LangModel {
  String? name;
  bool? isSelected;
  Locale? code;
  String? langId;
  String? flat;
  LangModel(
      {this.name, this.isSelected = false, this.code, this.langId, this.flat});
}
