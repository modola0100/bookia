import 'data.dart';

class SlidersResponse {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  SlidersResponse({this.data, this.message, this.error, this.status});

  factory SlidersResponse.fromJson(Map<String, dynamic> json) {
    return SlidersResponse(
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'data': data?.toJson(),
      'message': message,
      'error': error,
      'status': status,
    };
  }
}
