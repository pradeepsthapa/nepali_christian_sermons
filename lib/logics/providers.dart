import 'package:ccbclibrary/logics/book_repository.dart';
import 'package:ccbclibrary/logics/connectivity_state.dart';
import 'package:ccbclibrary/logics/downloader.dart';
import 'package:ccbclibrary/logics/exceptions.dart';
import 'package:ccbclibrary/logics/theme_state.dart';
import 'package:ccbclibrary/model/book/book_model.dart';
import 'package:ccbclibrary/model/bookDetails/book_details_model.dart';
import 'package:ccbclibrary/model/category/category_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'interstitial_adservice.dart';

final themeStateProvider = ChangeNotifierProvider<MainTheme>((ref) => MainTheme());

final firebaseProvider = Provider<FirebaseFirestore>((ref) => FirebaseFirestore.instance);

final bookRepositoryProvider = Provider<BookRepository>((ref) => BookRepository(ref.read));

final categoryProvider = FutureProvider<List<Category>>((ref) => BookRepository(ref.read).retrieveCategory());

final bookListExceptionProvider = StateProvider<CustomExceptions?>((ref) => null);

final audioDownloadProvider = ChangeNotifierProvider<AudioDownloader>((ref)=>AudioDownloader());

final collectionIdProvider = StateProvider<String>((ref) => 'otbooks');
final categoryNameProvider = StateProvider<String>((ref) => 'newtestament');

final bookListProvider = FutureProvider<List<Book>>((ref) {
  return BookRepository(ref.read).retrieveBooks(
      category: ref.watch(categoryNameProvider).state,
      collectionId: ref.watch(collectionIdProvider).state);
});

final connectivityStateProvider = StateNotifierProvider<ConnectivityState,ConnectivityResult?>((ref)=>ConnectivityState());

final bookDetailsProvider = FutureProvider.family<List<BookDetails>, String?>((ref, docId) async{
  final querySnapshot = await ref.read(firebaseProvider).collection('ccbcbible').doc(ref.read(categoryNameProvider).state).collection(ref.read(collectionIdProvider).state).doc(docId).collection('bookdetails').orderBy('id').get();
  final list = querySnapshot.docs.map((e) => BookDetails.fromDocument(e)).toList();
  return list;
});

final adStateProvider = Provider<AdService>((ref)=>AdService());