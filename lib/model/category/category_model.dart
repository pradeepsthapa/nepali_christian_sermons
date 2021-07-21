import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'category_model.freezed.dart';
part 'category_model.g.dart';

@freezed
abstract class Category implements _$Category {
  const Category._();

  const factory Category({
    String? id,
    String? title,
    String? image,
    String? description,
  }) = _Category;

  factory Category.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String,dynamic>;
    return Category.fromJson(data).copyWith(id: doc.id);
  }

  Map<String,dynamic> toDocument() => toJson()..remove('id');

  factory Category.fromJson(Map<String,dynamic> json) => _$CategoryFromJson(json);
}