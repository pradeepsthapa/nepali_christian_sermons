import 'package:ccbclibrary/logics/providers.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class DownloadProgressWidget extends ConsumerWidget {

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final downloadState = watch(audioDownloadProvider);
    if(downloadState.downloadTaskStatus== DownloadTaskStatus.running)
      return Row(
        children: [
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 7),
                  child: Text("Downloading...${downloadState.progress}"+"%",style: TextStyle(fontSize: 12,color: Colors.white),maxLines: 1,overflow: TextOverflow.ellipsis,),
                ),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: LinearProgressIndicator(
                    value: downloadState.progress/100.toDouble(),
                  ),
                ),
              ],
            ),
          ),
          IconButton(onPressed: ()=>context.read(audioDownloadProvider).cancelDownload(downloadState.id), icon: Icon(Icons.close,size: 18,color: Colors.white,)),
        ],
      );
    if(downloadState.downloadTaskStatus==DownloadTaskStatus.complete){
      Future.delayed((Duration(milliseconds: 500)),(){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Download Completed."),));
      });
    }
    if(downloadState.downloadTaskStatus==DownloadTaskStatus.canceled){
      Future.delayed((Duration(milliseconds: 500)),(){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Download cancelled!"),));
      });
    }
    return SizedBox();
  }
}