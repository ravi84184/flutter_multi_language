import 'package:flutter/material.dart';
import 'package:in_app_localisation/app_translations.dart';
import 'package:in_app_localisation/application.dart';
import 'package:in_app_localisation/language_page.dart';

class LanguageSelectorPage extends StatefulWidget {
  @override
  _LanguageSelectorPageState createState() => _LanguageSelectorPageState();
}

class _LanguageSelectorPageState extends State<LanguageSelectorPage> {
  static final List<String> languagesList = application.supportedLanguages;
  static final List<String> languageCodesList =
      application.supportedLanguagesCodes;

  final Map<dynamic, dynamic> languagesMap = {
    languagesList[0]: languageCodesList[0],
    languagesList[1]: languageCodesList[1],
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            AppTranslations.of(context).text("title_select_language"),
          ),
          actions: <Widget>[
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => LanguagePage(),
                  ),
                );
              },
              icon: Icon(
                Icons.call_missed_outgoing,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: _buildLanguagesList(),
      ),
    );
  }

  _buildLanguagesList() {
    return ListView.builder(
      itemCount: languagesList.length,
      itemBuilder: (context, index) {
        return _buildLanguageItem(languagesList[index]);
      },
    );
  }

  _buildLanguageItem(String language) {
    return InkWell(
      onTap: () {
        print(language);
        application.onLocaleChanged(Locale(languagesMap[language]));
      },
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Text(
            language,
            style: TextStyle(
              fontSize: 24.0,
            ),
          ),
        ),
      ),
    );
  }
}
