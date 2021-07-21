import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccbclibrary/logics/providers.dart';
import 'package:ccbclibrary/model/book/book_model.dart';
import 'package:ccbclibrary/presentation/screens/book_details_screen.dart';
import 'package:ccbclibrary/presentation/widgets/bannerad.dart';
import 'package:ccbclibrary/presentation/widgets/loading_widget.dart';
import 'package:ccbclibrary/presentation/widgets/miniplayer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'error_screen.dart';

class BookListScreen extends StatelessWidget {
  final String title;
  BookListScreen({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        elevation: 0,
        title: Text(title),
      ),
      body: Column(
        children: [
          Expanded(
            child: Consumer(
              builder: (context,watch,child){
                final list = watch(bookListProvider);
                return list.when(
                    data: (data)=>BookLoadedScreen(data),
                    loading: ()=>MainLoadingWidget(),
                    error: (error,st)=>ErrorScreen(error.toString()));
              },
            ),
          ),
          MiniPlayerWidget()
        ],
      ),
      bottomNavigationBar: BannerWidget(),
    );
  }
}


class BookLoadedScreen extends StatelessWidget {
  final List<Book> books;
  BookLoadedScreen(this.books);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      crossAxisCount: 4,
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        final item = books[index];
        return Card(
          margin: EdgeInsets.zero,
          elevation: 5,
          shadowColor: Colors.black45,
          child: InkWell(
            borderRadius: BorderRadius.circular(5),
            splashFactory: InkRipple.splashFactory,
            onTap: (){
              Navigator.push(context, PageRouteBuilder(
                  transitionDuration: Duration(milliseconds: 700),
                  transitionsBuilder: (context,a1,a2,child){
                    return FadeTransition(
                      opacity: a1,
                      child: child,
                    );
                  },
                  pageBuilder: (context,  a1, a2) {
                    return BookDetailsScreen(item);
                  }));
            },
            child: Padding(
              padding: const EdgeInsets.all(7.0),
              child: Column(
                children: [
                  Hero(
                    tag: item.imageUrl??'',
                    child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5)),
                      child: CachedNetworkImage(fit: BoxFit.cover,height: 170,
                        placeholder: (context, url) => Stack(
                          children: [
                            Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover,),
                            ImageLoadingWidget()
                          ],
                        ),
                        imageUrl: item.imageUrl??'https://firebasestorage.googleapis.com/v0/b/ccbcptc.appspot.com/o/covers%2Fcategory%2Fplaceholder.jpg?alt=media&token=f5bf634f-2b67-4fd2-a9f5-8046e1da399a',
                        errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover,),
                      ),
                    ),
                  ),
                  Center(child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 3),
                    child: Text(item.title??'',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor),maxLines: 2,overflow: TextOverflow.ellipsis,textAlign: TextAlign.center,),
                  )),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
                    child: Text(item.description??'',style: TextStyle(fontSize: 12,),maxLines: 7,overflow: TextOverflow.ellipsis,),
                  ),
                ],),
            ),
          ),
        );
      },
      staggeredTileBuilder: (int index) {
        return StaggeredTile.fit(2);
      },
      mainAxisSpacing: 7.0,
      crossAxisSpacing: 7.0,
    );
  }
}
