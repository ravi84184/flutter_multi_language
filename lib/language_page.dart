import 'package:flutter/material.dart';
import 'package:in_app_localisation/app_translations.dart';
import 'package:in_app_localisation/application.dart';

class LanguagePage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguagePage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            AppTranslations.of(context).text("title_select_language"),
          ),
        ),
        body: _buildLanguagesList(),
      ),
    );
  }

  _buildLanguagesList() {
    return Center(
      child: Text(AppTranslations.of(context).text("tab_home")),
    );
  }

}