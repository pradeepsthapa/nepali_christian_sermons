import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_model.freezed.dart';
part 'book_model.g.dart';

@freezed
abstract class Book implements _$Book{
  const Book._();
  const factory Book({
    String? docId,
    String? description,
    String? imageUrl,
    String? teacher,
    String? title,
}) = _Book;

  factory Book.empty() => Book();

  factory Book.fromDocument(DocumentSnapshot doc) {
    final data = doc.data() as Map<String,dynamic>;
    return Book.fromJson(data).copyWith(docId: doc.id);
  }

  Map<String,dynamic> toDocument() => toJson()..remove('id');

  factory Book.fromJson(Map<String,dynamic> json) => _$BookFromJson(json);
}

