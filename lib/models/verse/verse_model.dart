import 'package:hive/hive.dart';
import 'package:yaaseen/hive_helper/hive_adapters.dart';
import 'package:yaaseen/hive_helper/hive_types.dart';

part 'verse_model.g.dart';

@HiveType(typeId: HiveTypes.verseModel, adapterName: HiveAdapters.verseModel)
class VerseModel extends HiveObject {
  VerseModel({
    this.id,
    this.paraNo,
    this.suraId,
    this.verseId,
    this.plain,
    this.arabic,
    this.meaning,
    this.meaningUz,
    this.isSaved = false,
  }) {
    id = id;
    paraNo = paraNo;
    suraId = suraId;
    verseId = verseId;
    plain = plain;
    arabic = arabic;
    meaning = meaning;
    isSaved = isSaved;
  }

  VerseModel.fromJson(dynamic json) {
    id = json['id'];
    paraNo = json['para_no'];
    suraId = json['sura_id'];
    verseId = json['verse_id'];
    plain = json['plain'];
    arabic = json['arabic'];
    meaning = json['meaning'];
    meaningUz = json['meaning_uz'];
    isSaved = json['is_saved'] ?? false;
  }

  @HiveField(0)
  late int? id;
  @HiveField(1)
  late int? paraNo;
  @HiveField(2)
  late int? suraId;
  @HiveField(3)
  late int? verseId;
  @HiveField(4)
  late String? plain;
  @HiveField(5)
  late String? arabic;
  @HiveField(6)
  late String? meaning;
  @HiveField(7)
  late String? meaningUz;
  @HiveField(8)
  bool isSaved = false;

  VerseModel copyWith({
    int? id,
    int? paraNo,
    int? suraId,
    int? verseId,
    String? plain,
    String? arabic,
    String? meaning,
    String? meaningUz,
  }) =>
      VerseModel(
        id: id,
        paraNo: paraNo,
        suraId: suraId,
        verseId: verseId,
        plain: plain,
        arabic: arabic,
        meaning: meaning,
        meaningUz: meaningUz
      );

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['para_no'] = paraNo;
    map['sura_id'] = suraId;
    map['verse_id'] = verseId;
    map['plain'] = plain;
    map['arabic'] = arabic;
    map['meaning'] = meaning;
    map['meaning_uz'] = meaningUz;
    map['is_saved'] = isSaved;
    return map;
  }

  @override
  get key => id;
}
