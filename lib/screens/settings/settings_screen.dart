import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/hive_helper/app_prefs.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/route/routes.dart';
import 'package:yaaseen/widgets/widgets.dart';
import 'package:yaaseen/core/core.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final VerseModel _verse = HiveBoxes.verseBox.getAt(27)!;
  AppFormatter formatter = AppFormatter();
  late String number = formatter.numberFormat(_verse.verseId);
  late String formatted = '\uFD3F$number\uFD3E';

  String _locale = AppPref.locale;
  final _oldLocale = AppPref.locale;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return WillPopScope(
          onWillPop: () async {
            if (_locale != _oldLocale) {
              AppNavigator.pop(_locale);
              return false;
            }
            return true;
          },
          child: Scaffold(
            appBar: AppBar(title: Text(AppStrings.settings.tr())),
            body: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: VerseListTile(verse: _verse),
                  ),
                ),
                _showLocale(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _showLocale() => Row(
        children: [
          Expanded(
            child: AppRadioListTile(
              value: 'uz',
              onChanged: _onChanged,
              group: _locale,
            ),
          ),
          Expanded(
            child: AppRadioListTile(
              value: 'cr',
              onChanged: _onChanged,
              group: _locale,
            ),
          ),
        ],
      );

  void _onChanged(Object? value) async {
    await AppPref.setLocale(value.toString());
    setState(() {
      _locale = value.toString();
    });
  }
}

enum SizeType { arabic, meaning, transcription }
