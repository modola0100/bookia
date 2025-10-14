import 'slider.dart';

class Data {
  List<Sliderr>? sliders;

  Data({this.sliders});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      sliders: (json['sliders'] as List<dynamic>?)
          ?.map((e) => Sliderr.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'sliders': sliders?.map((e) => e.toJson()).toList()};
  }
}
