import 'package:easy_localization/easy_localization.dart';
import 'package:final_flutter_ewallet/model/langModel.dart';
import 'package:final_flutter_ewallet/utils/icon_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  final storage = GetStorage();
  late RxList<LangModel> lang = RxList();

  // GetCurrentLanguage
  RxString languageName = "".obs;

  @override
  void onReady() async {
    super.onReady();
    getListLang();
    getStorgeLocal();
  }

  getListLang() {
    lang.add(
      LangModel(
        name: 'ພາສາລາວ',
        isSelected: false,
        code: const Locale('lo'),
        langId: 'lo',
        flat: MyIcon.flat_lao,
      ),
    );
    lang.add(
      LangModel(
        name: 'English',
        isSelected: false,
        code: const Locale('en', 'US'),
        langId: 'en',
        flat: MyIcon.flat_usa,
      ),
    );
  }

  getStorgeLocal() {
    var langId = storage.read('lang_id');
    var langflat = storage.read('lang_flat');

    // langId ??= 'en';
    if (langId == null) {
      storage.write('lang_id', 'en');
      langId = 'en';
    }
    if (langflat == null) {
      langflat == MyIcon.flat_usa;
      storage.write('lang_flat', MyIcon.flat_usa);
    }
    languageName.value = langId.toString();
    LangModel langs =
        lang.singleWhere((e) => e.langId == (langId == 'la' ? 'lo' : langId));
    langs.isSelected = true;
  }

  setLocal(LangModel e, BuildContext context) async {
    for (var element in lang) {
      element.isSelected = false;
    }
    e.isSelected = true;
    storage.write('lang_id', e.langId);
    storage.write('lang_flat', e.flat);
    var langId = storage.read('lang_id');
    languageName.value = langId.toString();
    await context.setLocale(e.code!);
    Get.updateLocale(e.code!);
    // subTopicMsisdn(e.langId!);
  }
}
