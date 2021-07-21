// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_BookDetails _$_$_BookDetailsFromJson(Map<String, dynamic> json) {
  return _$_BookDetails(
    id: (json['id'] as num?)?.toDouble(),
    docId: json['docId'] as String?,
    url: json['url'] as String?,
    chapter: json['chapter'] as String?,
    teacher: json['teacher'] as String?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$_$_BookDetailsToJson(_$_BookDetails instance) =>
    <String, dynamic>{
      'id': instance.id,
      'docId': instance.docId,
      'url': instance.url,
      'chapter': instance.chapter,
      'teacher': instance.teacher,
      'title': instance.title,
    };
