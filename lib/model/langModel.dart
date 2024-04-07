import 'package:flutter/material.dart';

class Lang {
  String? name;
  bool? isSelected;
  Locale? code;
  String? langId;
  String? flat;

  Lang({this.name, this.isSelected = false, this.code, this.langId, this.flat});
}
