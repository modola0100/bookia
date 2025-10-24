class Government {
  int? id;
  String? governorateNameEn;

  Government({this.id, this.governorateNameEn});

  factory Government.fromJson(
    Map<String, dynamic> json,
  ) {
    return Government(
      id: json['id'] as int?,
      governorateNameEn: json['governorate_name_en'] as String?,
    );
  }

  Map<String, dynamic>
  toJson() {
    return {'id': id, 'governorate_name_en': governorateNameEn};
  }
}
