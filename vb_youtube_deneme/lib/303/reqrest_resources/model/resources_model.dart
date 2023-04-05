part 'resources_model.g.dart';

class ResourcesModel {
  List<Data>? data;

  ResourcesModel({this.data});

  factory ResourcesModel.fromJson(Map<String, dynamic> json) {
    return _$ResourcesModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ResourcesModelToJson(this);
  }
}

class Data {
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  String? avatar;

  Data({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, email, firstName];
}
