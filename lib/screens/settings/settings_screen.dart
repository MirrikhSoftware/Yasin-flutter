import 'package:flutter/material.dart';
import 'package:yaaseen/bloc/blocs.dart';
import 'package:yaaseen/hive_helper/app_prefs.dart';
import 'package:yaaseen/hive_helper/hive_boxes.dart';
import 'package:yaaseen/models/verse/verse_model.dart';
import 'package:yaaseen/widgets/widgets.dart';
import 'package:yaaseen/core/core.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final VerseModel _verse = HiveBoxes.verseBox.getAt(27)!;
  AppFormatter formatter = AppFormatter();
  late String number = formatter.numberFormat(_verse.verseId);
  late String formatted = '\uFD3F$number\uFD3E';

  String _locale = AppPref.locale;
  late final SettingsBloc _sBloc = BlocProvider.of(context);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return Scaffold(
          appBar: SimpleAppBar(title: AppStrings.settings.tr()),
          body: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: VerseListTile(verse: _verse),
                ),
              ),
              _showLocale(),
              _setData(SizeType.arabic),
              _setData(SizeType.transcription),
              _setData(SizeType.meainig),
            ],
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

  Row _setData(SizeType type) {
    return Row(
      children: [
        Expanded(
          flex: 4,
          child: AppCheckboxListTile(
            title: _getTitle(type),
            value: true,
            onChanged: (v) {},
          ),
        ),
        Expanded(
          flex: 7,
          child: Slider(
            max: 32,
            min: 12,
            value: _getSize(type),
            onChanged: (v) async {
              switch (type) {
                case SizeType.arabic:
                  _sBloc.add(ArabicTextSizeChanged(v));
                  break;

                case SizeType.meainig:
                  _sBloc.add(MeaningTextSizeChanged(v));

                  break;

                case SizeType.transcription:
                  _sBloc.add(TranscriptionTextSizeChanged(v));

                  break;
              }
            },
            onChangeEnd: (v) async {
              switch (type) {
                case SizeType.arabic:
                  await AppPref.setArabicSize(v);
                  break;

                case SizeType.meainig:
                  await AppPref.setMeaingSize(v);
                  break;

                case SizeType.transcription:
                  await AppPref.setTranscriptionSize(v);
                  break;
              }
            },
          ),
        ),
      ],
    );
  }

  double _getSize(SizeType type) {
    switch (type) {
      case SizeType.arabic:
        return _sBloc.arabicSize;
      case SizeType.meainig:
        return _sBloc.meaingSize;
      case SizeType.transcription:
        return _sBloc.trSize;
    }
  }

  String _getTitle(SizeType type) {
    switch (type) {
      case SizeType.arabic:
        return AppStrings.arabic.tr();

      case SizeType.meainig:
        return AppStrings.meaning.tr();

      case SizeType.transcription:
        return AppStrings.transcription.tr();
    }
  }
}

enum SizeType { arabic, meainig, transcription }
