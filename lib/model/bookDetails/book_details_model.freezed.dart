// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'book_details_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BookDetails _$BookDetailsFromJson(Map<String, dynamic> json) {
  return _BookDetails.fromJson(json);
}

/// @nodoc
class _$BookDetailsTearOff {
  const _$BookDetailsTearOff();

  _BookDetails call(
      {double? id,
      String? docId,
      String? url,
      String? chapter,
      String? teacher,
      String? title}) {
    return _BookDetails(
      id: id,
      docId: docId,
      url: url,
      chapter: chapter,
      teacher: teacher,
      title: title,
    );
  }

  BookDetails fromJson(Map<String, Object> json) {
    return BookDetails.fromJson(json);
  }
}

/// @nodoc
const $BookDetails = _$BookDetailsTearOff();

/// @nodoc
mixin _$BookDetails {
  double? get id => throw _privateConstructorUsedError;
  String? get docId => throw _privateConstructorUsedError;
  String? get url => throw _privateConstructorUsedError;
  String? get chapter => throw _privateConstructorUsedError;
  String? get teacher => throw _privateConstructorUsedError;
  String? get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookDetailsCopyWith<BookDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookDetailsCopyWith<$Res> {
  factory $BookDetailsCopyWith(
          BookDetails value, $Res Function(BookDetails) then) =
      _$BookDetailsCopyWithImpl<$Res>;
  $Res call(
      {double? id,
      String? docId,
      String? url,
      String? chapter,
      String? teacher,
      String? title});
}

/// @nodoc
class _$BookDetailsCopyWithImpl<$Res> implements $BookDetailsCopyWith<$Res> {
  _$BookDetailsCopyWithImpl(this._value, this._then);

  final BookDetails _value;
  // ignore: unused_field
  final $Res Function(BookDetails) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? docId = freezed,
    Object? url = freezed,
    Object? chapter = freezed,
    Object? teacher = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double?,
      docId: docId == freezed
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      chapter: chapter == freezed
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: teacher == freezed
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$BookDetailsCopyWith<$Res>
    implements $BookDetailsCopyWith<$Res> {
  factory _$BookDetailsCopyWith(
          _BookDetails value, $Res Function(_BookDetails) then) =
      __$BookDetailsCopyWithImpl<$Res>;
  @override
  $Res call(
      {double? id,
      String? docId,
      String? url,
      String? chapter,
      String? teacher,
      String? title});
}

/// @nodoc
class __$BookDetailsCopyWithImpl<$Res> extends _$BookDetailsCopyWithImpl<$Res>
    implements _$BookDetailsCopyWith<$Res> {
  __$BookDetailsCopyWithImpl(
      _BookDetails _value, $Res Function(_BookDetails) _then)
      : super(_value, (v) => _then(v as _BookDetails));

  @override
  _BookDetails get _value => super._value as _BookDetails;

  @override
  $Res call({
    Object? id = freezed,
    Object? docId = freezed,
    Object? url = freezed,
    Object? chapter = freezed,
    Object? teacher = freezed,
    Object? title = freezed,
  }) {
    return _then(_BookDetails(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as double?,
      docId: docId == freezed
          ? _value.docId
          : docId // ignore: cast_nullable_to_non_nullable
              as String?,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      chapter: chapter == freezed
          ? _value.chapter
          : chapter // ignore: cast_nullable_to_non_nullable
              as String?,
      teacher: teacher == freezed
          ? _value.teacher
          : teacher // ignore: cast_nullable_to_non_nullable
              as String?,
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_BookDetails extends _BookDetails {
  const _$_BookDetails(
      {this.id, this.docId, this.url, this.chapter, this.teacher, this.title})
      : super._();

  factory _$_BookDetails.fromJson(Map<String, dynamic> json) =>
      _$_$_BookDetailsFromJson(json);

  @override
  final double? id;
  @override
  final String? docId;
  @override
  final String? url;
  @override
  final String? chapter;
  @override
  final String? teacher;
  @override
  final String? title;

  @override
  String toString() {
    return 'BookDetails(id: $id, docId: $docId, url: $url, chapter: $chapter, teacher: $teacher, title: $title)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _BookDetails &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.docId, docId) ||
                const DeepCollectionEquality().equals(other.docId, docId)) &&
            (identical(other.url, url) ||
                const DeepCollectionEquality().equals(other.url, url)) &&
            (identical(other.chapter, chapter) ||
                const DeepCollectionEquality()
                    .equals(other.chapter, chapter)) &&
            (identical(other.teacher, teacher) ||
                const DeepCollectionEquality()
                    .equals(other.teacher, teacher)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(docId) ^
      const DeepCollectionEquality().hash(url) ^
      const DeepCollectionEquality().hash(chapter) ^
      const DeepCollectionEquality().hash(teacher) ^
      const DeepCollectionEquality().hash(title);

  @JsonKey(ignore: true)
  @override
  _$BookDetailsCopyWith<_BookDetails> get copyWith =>
      __$BookDetailsCopyWithImpl<_BookDetails>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$_$_BookDetailsToJson(this);
  }
}

abstract class _BookDetails extends BookDetails {
  const factory _BookDetails(
      {double? id,
      String? docId,
      String? url,
      String? chapter,
      String? teacher,
      String? title}) = _$_BookDetails;
  const _BookDetails._() : super._();

  factory _BookDetails.fromJson(Map<String, dynamic> json) =
      _$_BookDetails.fromJson;

  @override
  double? get id => throw _privateConstructorUsedError;
  @override
  String? get docId => throw _privateConstructorUsedError;
  @override
  String? get url => throw _privateConstructorUsedError;
  @override
  String? get chapter => throw _privateConstructorUsedError;
  @override
  String? get teacher => throw _privateConstructorUsedError;
  @override
  String? get title => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$BookDetailsCopyWith<_BookDetails> get copyWith =>
      throw _privateConstructorUsedError;
}
