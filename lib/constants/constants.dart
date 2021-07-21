import 'package:audio_service/audio_service.dart';
import 'package:ccbclibrary/model/book/book_model.dart';
import 'package:ccbclibrary/model/bookDetails/book_details_model.dart';
import 'package:ccbclibrary/presentation/player/audio_task.dart';

class Constants {
  static const OT_DOCID = 'oldtestament';
  static const OT_COLLID = 'otbooks';

  static const NT_DOCID = 'newtestament';
  static const NT_COLLID = 'ntbooks';

  static const TOPICAL_DOCID = 'topical';
  static const TOPICAL_COLLID = 'topical';

  static Future<void> startAudioPlayer({required Book book, required List<BookDetails> bookDetails, int? index}) async{
    final List<MediaItem> playlist = [];
    for (int i = 0; i < bookDetails.length; i++) {
      BookDetails item = bookDetails[i];
      MediaItem media = MediaItem(
          id: item.url??'',
          album: item.chapter??'',
          title: book.title??'',
          artist: book.teacher??'',
          artUri: Uri.parse(book.imageUrl??'https://firebasestorage.googleapis.com/v0/b/ccbcptc.appspot.com/o/covers%2Fcategory%2Fplaceholder.jpg?alt=media&token=f5bf634f-2b67-4fd2-a9f5-8046e1da399a')
      );
      playlist.add(media);
    }

    await AudioService.start(
        backgroundTaskEntrypoint: audioPlayerTaskEntrypoint,
        androidNotificationChannelName: 'Calvary Chapel Nepal Teachings',
        androidNotificationIcon: 'mipmap/ic_launcher',
        androidEnableQueue: true,
        // params: {"data": lists}
    );

    await AudioService.updateQueue(playlist);
    if(index !=null)  await AudioService.skipToQueueItem(playlist[index].id);
    AudioService.play();
  }
}