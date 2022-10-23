import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'log_model.g.dart';

@HiveType(typeId: HiveTypes.log, adapterName: HiveAdapters.logAdapter)
class LogModel {
  String? _file;
  String? _tpye;
  String? _date;
  String? _userId;
  String? _message;
  int? _openedTime;

  LogModel(
      {String? file,
      String? tpye,
      String? date,
      String? userId,
      String? message,
      int? openedTime}) {
    if (file != null) {
      _file = file;
    }
    if (tpye != null) {
      _tpye = tpye;
    }
    if (date != null) {
      _date = date;
    }
    if (userId != null) {
      _userId = userId;
    }
    if (message != null) {
      _message = message;
    }
    if (openedTime != null) {
      _openedTime = openedTime;
    }
  }

  String? get file => _file;
  // set file(String? file) => _file = file;
  String? get tpye => _tpye;
  // set tpye(String? tpye) => _tpye = tpye;
  String? get date => _date;
  // set date(String? date) => _date = date;
  String? get userId => _userId;
  // set userId(String? userId) => _userId = userId;
  String? get message => _message;
  // set message(String? message) => _message = message;
  int? get openedTime => _openedTime;
  // set openedTime(String? openedTime) => _openedTime = openedTime;

  LogModel.fromJson(Map<String, dynamic> json) {
    _file = json['file'];
    _tpye = json['tpye'];
    _date = json['date'];
    _userId = json['user_id'];
    _message = json['message'];
    _openedTime = json['opened_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file'] = _file;
    data['tpye'] = _tpye;
    data['date'] = _date;
    data['user_id'] = _userId;
    data['message'] = _message;
    data['opened_time'] = _openedTime;
    return data;
  }
}
