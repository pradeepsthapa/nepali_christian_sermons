import 'dart:io';
import 'package:ccbclibrary/logics/exceptions.dart';
import 'package:ccbclibrary/logics/providers.dart';
import 'package:ccbclibrary/model/book/book_model.dart';
import 'package:ccbclibrary/model/category/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class BaseBookRepository {
  Future<List<Book>> retrieveBooks(
      {required String category, required String collectionId});

  Future<List<Category>> retrieveCategory();
}

class BookRepository implements BaseBookRepository {
  final Reader _reader;

  BookRepository(this._reader);

  @override
  Future<List<Category>> retrieveCategory() async {
    try {
      final snapshot =
          await _reader(firebaseProvider).collection('ccbcbible').get();
      return snapshot.docs.map((e) => Category.fromDocument(e)).toList();
    } on SocketException catch (e) {
      print(e);
      throw "Internet connection problem!";
    } on FirebaseException catch (e) {
      print(e);
      throw CustomExceptions(e.message);
    }
  }

  @override
  Future<List<Book>> retrieveBooks(
      {required String category, required String collectionId}) async {
    try {
      final snapshot = await _reader(firebaseProvider)
          .collection('ccbcbible')
          .doc(category)
          .collection(collectionId)
          .get();
      return snapshot.docs.map((e) => Book.fromDocument(e)).toList();
    } on FirebaseException catch (e) {
      throw CustomExceptions(e.message);
    }
  }
}
