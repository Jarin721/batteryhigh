import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data extends Equatable {
  final String? productCode;
  final String? name;
  final double? price;
  final int? stock;
  final String? description;
  final String? image;
  final List<String>? categories;
  @JsonKey(name: '_id')
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  @JsonKey(name: '__v')
  final int? v;

  const Data({
    this.productCode,
    this.name,
    this.price,
    this.stock,
    this.description,
    this.image,
    this.categories,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  Data copyWith({
    String? productCode,
    String? name,
    double? price,
    int? stock,
    String? description,
    String? image,
    List<String>? categories,
    String? id,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return Data(
      productCode: productCode ?? this.productCode,
      name: name ?? this.name,
      price: price ?? this.price,
      stock: stock ?? this.stock,
      description: description ?? this.description,
      image: image ?? this.image,
      categories: categories ?? this.categories,
      id: id ?? this.id,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      productCode,
      name,
      price,
      stock,
      description,
      image,
      categories,
      id,
      createdAt,
      updatedAt,
      v,
    ];
  }
}
