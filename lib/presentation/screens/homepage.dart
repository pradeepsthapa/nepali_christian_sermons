import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccbclibrary/constants/constants.dart';
import 'package:ccbclibrary/logics/providers.dart';
import 'package:ccbclibrary/model/category/category_model.dart';
import 'package:ccbclibrary/presentation/screens/error_screen.dart';
import 'package:ccbclibrary/presentation/screens/no_internet_screen.dart';
import 'package:ccbclibrary/presentation/widgets/bannerad.dart';
import 'package:ccbclibrary/presentation/widgets/loading_widget.dart';
import 'package:ccbclibrary/presentation/widgets/miniplayer.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'book_list_screen.dart';
import 'maindrawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        context.read(adStateProvider).showExitAd();
        return false;
      },
      child: Scaffold(
        drawer: MainDrawer(),
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            elevation: 0,
            title: Text("Audio Teachings"),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: ProviderListener<ConnectivityResult?>(
                onChange: (BuildContext context, state) {
                  if(state == ConnectivityResult.none){
                    if(state==ConnectivityResult.none) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("No internet connection!")));
                    Navigator.push(context, CupertinoPageRoute(builder: (_)=>NoInternetScreen()));
                  }
                  if(state==ConnectivityResult.mobile) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Connected to mobile data")));
                  if(state==ConnectivityResult.wifi) ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Connected to wifi network")));
                },
                provider: connectivityStateProvider,
                child: Consumer(
                  builder: (context,watch,child){
                    return watch(categoryProvider).when(
                        data: (data)=>LoadedCategory(data),
                        loading: ()=> MainLoadingWidget(),
                        error: (error,_){
                          return ErrorScreen(error.toString());
                        });
                  },
                ),
              ),
            ),
            MiniPlayerWidget()
          ],
        ),
        bottomNavigationBar: BannerWidget(),
      ),
    );
  }
}

class LoadedCategory extends StatelessWidget {
  final List<Category> categories;
  LoadedCategory(this.categories);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ListView.builder(
      padding: EdgeInsets.zero,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final category = categories[index];
          return Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Card(
              shadowColor: Colors.black54,
              elevation: 5,
              margin: EdgeInsets.zero,
              child: InkWell(
                onTap: (){
                  context.read(categoryNameProvider).state = category.id!;
                  setCollectionState(context,category.id!);
                  Navigator.push(context, MaterialPageRoute(builder: (_)=>BookListScreen(title: category.title??'',)));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Column(
                  children: [
                    Container(
                      height: 220,
                      width:size.width,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Stack(
                          children: [
                            Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover,width: size.width,),
                            DetailsImageLoadingWidget()
                          ],
                        ),
                        imageUrl: category.image??'https://firebasestorage.googleapis.com/v0/b/ccbcptc.appspot.com/o/covers%2Fcategory%2Fplaceholder.jpg?alt=media&token=f5bf634f-2b67-4fd2-a9f5-8046e1da399a',
                        errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover),
                      ),
                    ),

                     Padding(
                      padding: const EdgeInsets.fromLTRB(7, 10, 7, 0),
                      child: Text(category.title??'',
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Theme.of(context).accentColor),),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(9, 7, 9, 15),
                      child: Text(category.description??''),
                    ),
                  ],
                ),
                ),
              ),
            ),
          );
        });
  }

  void setCollectionState(BuildContext context,String id) {
    if(id==Constants.NT_DOCID) {
      context.read(collectionIdProvider).state = Constants.NT_COLLID;
    }
    else if(id==Constants.OT_DOCID) {
      context.read(collectionIdProvider).state = Constants.OT_COLLID;
    }
    else if(id==Constants.TOPICAL_DOCID) {
      context.read(collectionIdProvider).state =  Constants.TOPICAL_COLLID;
    }
  }
}
