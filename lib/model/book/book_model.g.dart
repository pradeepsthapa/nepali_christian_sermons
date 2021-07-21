// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Book _$_$_BookFromJson(Map<String, dynamic> json) {
  return _$_Book(
    docId: json['docId'] as String?,
    description: json['description'] as String?,
    imageUrl: json['imageUrl'] as String?,
    teacher: json['teacher'] as String?,
    title: json['title'] as String?,
  );
}

Map<String, dynamic> _$_$_BookToJson(_$_Book instance) => <String, dynamic>{
      'docId': instance.docId,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'teacher': instance.teacher,
      'title': instance.title,
    };
