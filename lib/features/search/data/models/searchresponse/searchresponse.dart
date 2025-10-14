import 'data.dart';

class Searchresponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  Searchresponse({this.data, this.message, this.error, this.status});

  factory Searchresponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return Searchresponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(
              json['data'] as Map<String, dynamic>,
            ),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      'data': data
          ?.toJson(),
      'message': message,
      'error': error,
      'status': status,
    };
  }
}
