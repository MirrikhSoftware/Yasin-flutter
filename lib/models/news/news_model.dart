import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';
import 'package:yaaseen/hive_helper/hive_types.dart';
part 'news_model.g.dart';

@HiveType(typeId: HiveTypes.news, adapterName: HiveAdapters.newsAdapter)
class NewsModel extends HiveObject {
  @HiveField(0)
  String? _sId;
  @HiveField(1)
  String? _status;
  @HiveField(2)
  String? _type;
  @HiveField(3)
  String? _title;
  @HiveField(4)
  String? _hTMLText;
  @HiveField(5)
  int? _date;
  @HiveField(6)
  String? _image;
  @HiveField(7)
  List<String>? _images;
  @HiveField(8)
  String? _createdAt;
  @HiveField(9)
  String? _updatedAt;
  @HiveField(10)
  int? _iV;
  @HiveField(11)
  String? _describtion;

  NewsModel({
    String? sId,
    String? status,
    String? type,
    String? title,
    String? hTMLText,
    int? date,
    String? image,
    List<String>? images,
    String? createdAt,
    String? updatedAt,
    int? iV,
    String? describtion,
  }) {
    if (sId != null) {
      _sId = sId;
    }
    if (status != null) {
      _status = status;
    }
    if (type != null) {
      _type = type;
    }
    if (title != null) {
      _title = title;
    }
    if (hTMLText != null) {
      _hTMLText = hTMLText;
    }
    if (date != null) {
      _date = date;
    }
    if (image != null) {
      _image = image;
    }
    if (images != null) {
      _images = images;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (updatedAt != null) {
      _updatedAt = updatedAt;
    }
    if (iV != null) {
      _iV = iV;
    }
    if (describtion != null) {
      _describtion = describtion;
    }
  }

  String? get sId => _sId;
  String? get status => _status;
  String? get type => _type;
  String? get title => _title;
  String? get hTMLText => _hTMLText;
  int? get date => _date;
  String? get image => _image;
  List<String>? get images => _images;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;
  int? get iV => _iV;
  String? get describtion => _describtion;

  NewsModel.fromJson(Map<String, dynamic> json) {
    _sId = json['_id'];
    _status = json['status'];
    _type = json['type'];
    _title = json['title'];
    _hTMLText = json['HTML_text'];
    _date = json['date'];
    _image = json['image'];
    _images = json['images'].cast<String>();
    _createdAt = json['createdAt'];
    _updatedAt = json['updatedAt'];
    _iV = json['__v'];
    _describtion = json['describtion'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = _sId;
    data['status'] = _status;
    data['type'] = _type;
    data['title'] = _title;
    data['HTML_text'] = _hTMLText;
    data['date'] = _date;
    data['image'] = _image;
    data['images'] = _images;
    data['createdAt'] = _createdAt;
    data['updatedAt'] = _updatedAt;
    data['__v'] = _iV;
    data['describtion'] = _describtion;
    return data;
  }
}
