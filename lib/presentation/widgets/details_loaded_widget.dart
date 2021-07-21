import 'package:audio_service/audio_service.dart';
import 'package:ccbclibrary/constants/constants.dart';
import 'package:ccbclibrary/logics/providers.dart';
import 'package:ccbclibrary/model/book/book_model.dart';
import 'package:ccbclibrary/model/bookDetails/book_details_model.dart';
import 'package:ccbclibrary/presentation/player/queue_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'loading_widget.dart';


class DetailsLoadedWidget extends StatelessWidget {
  final Book book;
  DetailsLoadedWidget(this.book);

  @override
  Widget build(BuildContext context) {

    return Consumer(
        builder: (context,watch,child){
          final bookDetails = watch(bookDetailsProvider(book.docId));
          return bookDetails.when(
              data: (data)=> DetailsLoaded(details: data,book: book),
              loading: ()=> SearchLoadingWidget(),
              error: (error,_)=>Text(error.toString()));
        });
  }
}


class DetailsLoaded extends StatelessWidget {
  final Book book;
  final List<BookDetails> details;
  DetailsLoaded({required this.details, required this.book});

  @override
  Widget build(BuildContext context) {
    if(details.isEmpty) return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 50,),
        Text("📂",style: TextStyle(fontSize: 30),),
        SizedBox(height: 20,),
        Text("No internet connection!",style: TextStyle(fontSize: 24,color: Colors.grey[500]),),
      ],
    );
    return ListView.builder(
        primary: false,shrinkWrap: true,
        itemCount: details.length,
        itemBuilder: (context,index){
          final detail = details[index];
          return StreamBuilder<QueueState>(
              stream: queueStateStream,
              builder: (context, snapshot) {
                final queueState = snapshot.data;
                final queue = queueState?.queue ?? [];
                final mediaItem = queueState?.mediaItem;
                return Padding(
                  padding: const EdgeInsets.fromLTRB(5, 8, 5, 0),
                  child: Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                    margin: EdgeInsets.zero,
                    elevation: 3,
                    shadowColor: Colors.black12,
                    child: ListTile(
                      selected: mediaItem?.id==detail.url?true:false,
                      dense: true,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
                      onTap: ()async{
                        if(queue.isNotEmpty&&queue.first.id==details[0].url){
                          AudioService.skipToQueueItem(detail.url??'');
                        }
                        else {
                          if(AudioService.running) {
                            await AudioService.stop().then((value) {
                              Constants.startAudioPlayer(book: book, bookDetails: details,index: index);
                            });
                          }
                          else {
                            Constants.startAudioPlayer(book: book, bookDetails: details, index: index);
                          }
                        }
                      },
                      title: Text(detail.chapter??'',style: TextStyle(fontWeight: FontWeight.bold),),
                      subtitle: Text(book.teacher??''),
                    ),
                  ),
                );
              }
          );
        });
  }


}
