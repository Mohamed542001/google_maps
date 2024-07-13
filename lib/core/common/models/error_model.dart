class ErrorModel {
  String? field;
  String? message;

  ErrorModel(this.field, this.message);

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'field': field,
      'message': message,
    };
  }

  factory ErrorModel.fromJson(Map<String, dynamic> json) {
    return ErrorModel(
      json['field'] != null ? json['field'] as String : null,
      json['message'] != null ? json['message'] as String : null,
    );
  }
}
