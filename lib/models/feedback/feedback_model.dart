// ignore_for_file: unnecessary_getters_setters

import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'feedback_model.g.dart';

@HiveType(
  typeId: HiveTypes.feedbackModel,
  adapterName: HiveAdapters.feedbackModel,
)
class FeedbackModel extends HiveObject {
  // @override
  // get key => _id;

  @HiveField(0)
  String? _id;

  @HiveField(1)
  int? _date;

  @HiveField(2)
  bool? _isSent;

  @HiveField(3)
  String? _message;

  @HiveField(4)
  bool _hasError = false;

  FeedbackModel({
    String? id,
    int? date,
    bool? isSent,
    String? message,
  }) {
    if (id != null) {
      _id = id;
    }
    if (date != null) {
      _date = date;
    }
    if (isSent != null) {
      _isSent = isSent;
    }
    if (message != null) {
      _message = message;
    }
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  int? get date => _date;
  set date(int? date) => _date = date;
  bool? get isSent => _isSent;
  set isSent(bool? isSent) => _isSent = isSent;
  String? get message => _message;
  set message(String? message) => _message = message;
  get hasError => _hasError;
  set hasError(value) => _hasError = value;

  FeedbackModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _date = json['date'];
    _isSent = json['is_sent'];
    _message = json['message'];
    _hasError = json['has_error'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = _id;
    data['date'] = _date;
    data['is_sent'] = _isSent;
    data['message'] = _message;
    data['has_error'] = _hasError;
    return data;
  }
}
