import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'book_details_model.freezed.dart';
part 'book_details_model.g.dart';

@freezed
abstract class BookDetails implements _$BookDetails {
  const BookDetails._();

  const factory BookDetails({
    double? id,
    String? docId,
    String? url,
    String? chapter,
    String? teacher,
    String? title,
  }) = _BookDetails;

  factory BookDetails.fromDocument(QueryDocumentSnapshot doc) {
    return BookDetails.fromJson(doc.data() as Map<String,dynamic>).copyWith(docId: doc.reference.id);
  }

  Map<String,dynamic> toDocument() => toJson()..remove('id');

  factory BookDetails.fromJson(Map<String,dynamic> json) => _$BookDetailsFromJson(json);
}