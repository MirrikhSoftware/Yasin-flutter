import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'news_model.g.dart';

@HiveType(typeId: HiveTypes.news, adapterName: HiveAdapters.newsAdapter)
class NewsModel {
  @HiveField(0)
  String? _id;
  @HiveField(1)
  String? _body;
  @HiveField(2)
  String? _newsType;
  @HiveField(3)
  String? _createdAt;
  @HiveField(4)
  bool? _isActive;
  @HiveField(5)
  List<String>? _images;
  @HiveField(6)
  List<String>? _shown;
  @HiveField(7)
  String? _title;

  NewsModel({
    String? body,
    String? id,
    String? newsType,
    String? createdAt,
    bool? isActive,
    List<String>? images,
    List<String>? shown,
    String? title,
  }) {
    if (body != null) {
      _body = body;
    }
    if (id != null) {
      _id = id;
    }
    if (newsType != null) {
      _newsType = newsType;
    }
    if (createdAt != null) {
      _createdAt = createdAt;
    }
    if (isActive != null) {
      _isActive = isActive;
    }
    if (images != null) {
      _images = images;
    }
    if (shown != null) {
      _shown = shown;
    }
    if(title != null) {
      _title =title;
    }
  }

  String? get body => _body;
  String? get id => _id;
  String? get newsType => _newsType;
  String? get createdAt => _createdAt;
  String? get title => _title;
  bool? get isActive => _isActive;
  List<String>? get images => _images;
  List<String>? get shown => _shown;

  NewsModel.fromJson(Map<String, dynamic> json) {
    _body = json['body'];
    _id = json['id'];
    _newsType = json['news_type'];
    _createdAt = json['created_at'];
    _isActive = json['is_active'];
    _title = json['title'];
    _images = json['images'].cast<String>();
    _shown = json['shown'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['body'] = _body;
    data['id'] = _id;
    data['news_type'] = _newsType;
    data['created_at'] = _createdAt;
    data['is_active'] = _isActive;
    data['images'] = _images;
    data['shown'] = _shown;
    data['title'] = _title;
    return data;
  }
}
