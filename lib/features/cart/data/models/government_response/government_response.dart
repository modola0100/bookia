import 'datum.dart';

class GovernmentResponse {
  List<dynamic>? data;
  String? message;
  List<dynamic>? error;
  int? status;

  GovernmentResponse({this.data, this.message, this.error, this.status});

  factory GovernmentResponse.fromJson(
    Map<String, dynamic> json,
  ) {
    return GovernmentResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map(
            (e) =>
                Government.fromJson(
                  e as Map<String, dynamic>,
                ),
          )
          .toList(),
      message: json['message'] as String?,
      error: json['error'] as List<dynamic>?,
      status: json['status'] as int?,
    );
  }

  Map<String, dynamic>
  toJson() {
    return {
      'data': data
          ?.map(
            (e) => e
                .toJson(),
          )
          .toList(),
      'message': message,
      'error': error,
      'status': status,
    };
  }
}
