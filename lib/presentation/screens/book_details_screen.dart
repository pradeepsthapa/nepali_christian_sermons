import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccbclibrary/logics/providers.dart';
import 'package:ccbclibrary/model/book/book_model.dart';
import 'package:ccbclibrary/presentation/widgets/bannerad.dart';
import 'package:ccbclibrary/presentation/widgets/details_loaded_widget.dart';
import 'package:ccbclibrary/presentation/widgets/miniplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BookDetailsScreen extends StatelessWidget {
  final Book book;
  BookDetailsScreen(this.book);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.read(adStateProvider).showMainAds();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black87,
          title: Text(book.title??''),
        ),
        body: ListView(
          children: [
            Hero(
              tag: book.imageUrl??'',
              child: Container(
                height: 220,color: Colors.black12,width: double.infinity,
                child: CachedNetworkImage(fit: BoxFit.cover,height: 220,width: double.infinity,
                  placeholder: (context, url) => Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover,),
                  imageUrl: book.imageUrl??'https://firebasestorage.googleapis.com/v0/b/ccbcptc.appspot.com/o/covers%2Fcategory%2Fplaceholder.jpg?alt=media&token=f5bf634f-2b67-4fd2-a9f5-8046e1da399a',
                  errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover,),
                ),

              ),

            ),
            Card(
              elevation: 4,
              shadowColor: Colors.black26,
              margin: EdgeInsets.only(bottom: 7),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 9),
                child: Text(book.description??'', maxLines: 7, overflow: TextOverflow.ellipsis,),
              ),
            ),
           BannerWidget(),
           DetailsLoadedWidget(book)
          ],
        ),
        bottomNavigationBar: MiniPlayerWidget(),
      ),
    );
  }
}



