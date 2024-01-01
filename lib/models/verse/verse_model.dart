// ignore_for_file: unnecessary_getters_setters

import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/hive_helper/hive_adapters.dart';
import 'package:yaaseen/hive_helper/hive_types.dart';
import 'package:yaaseen/models/qori/qori.dart';
part 'verse_model.g.dart';

@HiveType(
  typeId: HiveTypes.verseModel,
  adapterName: HiveAdapters.verseModel,
)
class VerseModel extends HiveObject {
  @override
  get key => _verseId;

  @HiveField(0)
  int? _id;

  @HiveField(1)
  int? _paraNo;

  @HiveField(2)
  int? _suraId;

  @HiveField(3)
  int? _verseId;

  @HiveField(4)
  String? _plain;

  @HiveField(5)
  String? _arabic;

  @HiveField(6)
  String? _meaning;

  @HiveField(7)
  String? _meaningUz;

  @HiveField(8)
  String? _transcription;

  @HiveField(9)
  String? _transcriptionUz;

  @HiveField(10)
  bool isSaved = false;

  VerseModel({
    int? id,
    int? paraNo,
    int? suraId,
    int? verseId,
    String? plain,
    String? arabic,
    String? meaning,
    String? meaningUz,
    String? transcription,
    String? transcriptionUz,
    this.isSaved = false,
  }) {
    if (id != null) {
      _id = id;
    }
    if (paraNo != null) {
      _paraNo = paraNo;
    }
    if (suraId != null) {
      _suraId = suraId;
    }
    if (verseId != null) {
      _verseId = verseId;
    }
    if (plain != null) {
      _plain = plain;
    }
    if (arabic != null) {
      _arabic = arabic;
    }
    if (meaning != null) {
      _meaning = meaning;
    }
    if (meaningUz != null) {
      _meaningUz = meaningUz;
    }
    if (transcription != null) {
      _transcription = transcription;
    }
    if (transcriptionUz != null) {
      _transcriptionUz = transcriptionUz;
    }
  }

  int get id => _id ?? 0;
  set id(int? id) => _id = id;
  int get paraNo => _paraNo ?? 0;
  set paraNo(int? paraNo) => _paraNo = paraNo;
  int get suraId => _suraId ?? 0;
  set suraId(int? suraId) => _suraId = suraId;
  int get verseId => _verseId ?? 0;
  set verseId(int? verseId) => _verseId = verseId;
  String get plain => _plain ?? '';
  set plain(String? plain) => _plain = plain;
  String get arabic => _arabic ?? '';
  set arabic(String? arabic) => _arabic = arabic;
  String get meaning => _meaning ?? '';
  set meaning(String? meaning) => _meaning = meaning;
  String get meaningUz => _meaningUz ?? '';
  set meaningUz(String? meaningUz) => _meaningUz = meaningUz;
  String get transcription => _transcription ?? '';
  set transcription(String? transcription) => _transcription = transcription;
  String get transcriptionUz => _transcriptionUz ?? '';
  set transcriptionUz(String? transcriptionUz) =>
      _transcriptionUz = transcriptionUz;

  VerseModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _paraNo = json['para_no'];
    _suraId = json['sura_id'];
    _verseId = json['verse_id'];
    _plain = json['plain'];
    _arabic = json['arabic'];
    _meaning = json['meaning'];
    _meaningUz = json['meaning_uz'];
    _transcription = json['transcription'];
    _transcriptionUz = json['transcription_uz'];
    isSaved = json['is_saved'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['para_no'] = _paraNo;
    data['sura_id'] = _suraId;
    data['verse_id'] = _verseId;
    data['plain'] = _plain;
    data['arabic'] = _arabic;
    data['meaning'] = _meaning;
    data['meaning_uz'] = _meaningUz;
    data['transcription'] = _transcription;
    data['transcription_uz'] = _transcriptionUz;
    data['is_saved'] = isSaved;
    return data;
  }

  String getAudioUrl(QoriModel qori) =>
      'https://cdn.islamic.network/quran/audio/128/${qori}/$_id.mp3';
}
