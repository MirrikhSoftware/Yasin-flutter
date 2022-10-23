import 'package:yaaseen/core/components/app_packages.dart';
import 'package:yaaseen/hive_helper/hive_helper.dart';

part 'log_model.g.dart';

@HiveType(typeId: HiveTypes.log, adapterName: HiveAdapters.logAdapter)
class LogModel extends HiveObject {
  
  @HiveField(0)
  String? _file;
  
  @HiveField(1)
  String? _function;
  
  @HiveField(2)
  String? _type;
  
  @HiveField(3)
  String? _date;
  
  @HiveField(4)
  String? _userId;
  
  @HiveField(5)
  String? _message;
  
  @HiveField(6)
  int? _openedTime;

  LogModel({
    String? file,
    String? type,
    String? date,
    String? userId,
    String? message,
    int? openedTime,
    String? function,
  }) {
    if (file != null) {
      _file = file;
    }
    if (type != null) {
      _type = type;
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

    if (function != null) {
      _function = function;
    }
  }

  String? get file => _file;
  // set file(String? file) => _file = file;
  String? get type => _type;
  // set tpye(String? tpye) => _tpye = tpye;
  String? get date => _date;
  // set date(String? date) => _date = date;
  String? get userId => _userId;
  // set userId(String? userId) => _userId = userId;
  String? get message => _message;
  // set message(String? message) => _message = message;
  int? get openedTime => _openedTime;
  // set openedTime(String? openedTime) => _openedTime = openedTime;
  String? get function => _function;

  LogModel.fromJson(Map<String, dynamic> json) {
    _file = json['file'];
    _type = json['type'];
    _date = json['date'];
    _userId = json['user_id'];
    _message = json['message'];
    _openedTime = json['opened_time'];
    _function = json['function'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['file'] = _file;
    data['type'] = _type;
    data['date'] = _date;
    data['user_id'] = _userId;
    data['message'] = _message;
    data['opened_time'] = _openedTime;
    data['function'] = _function;
    return data;
  }
}
