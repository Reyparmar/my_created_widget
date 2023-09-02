import 'dart:convert';

class CustomScrollItemModel {
  int? id;
  String? image;
  String? name;
  CustomScrollItemModel({
    this.id,
    this.image,
    this.name,
  });

  CustomScrollItemModel copyWith({
    int? id,
    String? image,
    String? name,
  }) {
    return CustomScrollItemModel(
      id: id ?? this.id,
      image: image ?? this.image,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'name': name,
    };
  }

  factory CustomScrollItemModel.fromMap(Map<String, dynamic> map) {
    return CustomScrollItemModel(
      id: map['id']?.toInt(),
      image: map['image'],
      name: map['name'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomScrollItemModel.fromJson(String source) =>
      CustomScrollItemModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CustomScrollItemModel(id: $id, image: $image, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomScrollItemModel &&
        other.id == id &&
        other.image == image &&
        other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ image.hashCode ^ name.hashCode;
}
