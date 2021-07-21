import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccbclibrary/logics/providers.dart';
import 'package:ccbclibrary/presentation/player/media_state.dart';
import 'package:ccbclibrary/presentation/player/queue_state.dart';
import 'package:ccbclibrary/presentation/player/seekbar.dart';
import 'package:ccbclibrary/presentation/widgets/bannerad.dart';
import 'package:ccbclibrary/presentation/widgets/download_progress_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass/glass.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NowPlaying extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return WillPopScope(
      onWillPop: () async{
        context.read(adStateProvider).showMainAds();
        return true;
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: Icon(CupertinoIcons.chevron_down,color: Colors.white,),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text("Now Playing", style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
          ),
        ),
        body: Stack(
          children: [
            StreamBuilder<MediaState>(
                stream: mediaStateStream,
                builder: (context, snapshot) {
                  final mediaState = snapshot.data;
                  return CachedNetworkImage(
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover,),
                    imageUrl: mediaState!.mediaItem!.artUri!.toString(),
                    errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover,),
                  );
                }
            ),
            Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Theme.of(context).primaryColor.withOpacity(0.3),
                    Theme.of(context).primaryColorDark,
                    Colors.black
                  ],
                      begin: Alignment.topCenter, end: Alignment.bottomRight)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(height: 70,),
                  StreamBuilder<MediaState>(
                    stream: mediaStateStream,
                    builder: (context, snapshot) {
                      final mediaState = snapshot.data;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(-5, 7),
                                  blurRadius: 7),
                              BoxShadow(
                                  color: Colors.black12,
                                  offset: Offset(7, 9),
                                  blurRadius: 9),
                            ]),
                            child: Card(
                              color: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                              margin: EdgeInsets.zero,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  height: 300,
                                  width: size.width * .8,
                                  placeholder: (context, url) => Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover),
                                  imageUrl: mediaState?.mediaItem?.artUri?.toString()??'',
                                  errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SeekBar(
                            duration: mediaState?.mediaItem?.duration ?? Duration.zero,
                            position: mediaState?.position ?? Duration.zero,
                            onChangeEnd: (newPosition) {
                              AudioService.seekTo(newPosition);
                            },
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(),
                  StreamBuilder<QueueState>(
                    stream: queueStateStream,
                    builder: (context, snapshot) {
                      final queueState = snapshot.data;
                      final queue = queueState?.queue ?? [];
                      final mediaItem = queueState?.mediaItem;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
                            child: Text(
                              mediaItem?.title ?? '',
                              style: TextStyle(color: isDark ? Theme.of(context).accentColor : Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
                              maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
                            child: Text(mediaItem?.album??'', style: TextStyle(color: Colors.white),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.center),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(mediaItem?.artist??'', style: TextStyle(color: Colors.white70),
                                maxLines: 1, overflow: TextOverflow.ellipsis, textAlign: TextAlign.center),
                          ),
                          SizedBox(height: 20,),
                          if (queue.isNotEmpty)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.shuffle, color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: mediaItem == queue.first ? null : AudioService.skipToPrevious,
                                    icon: Icon(Icons.skip_previous_rounded, color: Colors.white,
                                    )),
                                StreamBuilder<AudioProcessingState>(
                                  stream: AudioService.playbackStateStream.map((state) => state.processingState).distinct(),
                                  builder: (context, snapshot) {
                                    final processingState = snapshot.data ?? AudioProcessingState.none;
                                    return StreamBuilder<bool>(
                                        stream: AudioService.playbackStateStream.map((state) => state.playing).distinct(),
                                        builder: (context, snapshot) {
                                          final playing = snapshot.data ?? false;
                                          return IconButton(
                                            iconSize: 60,
                                            onPressed: playing ? AudioService.pause : AudioService.play,
                                            icon: CircleAvatar(
                                              backgroundColor: isDark ? Colors.white : Colors.white12,
                                              minRadius: 60,
                                              child: processingState == AudioProcessingState.buffering
                                                  ? CircularProgressIndicator(
                                                  valueColor: AlwaysStoppedAnimation<Color>(isDark ? Colors.black : Colors.white))
                                                  : Icon(playing ? Icons.pause : Icons.play_arrow,
                                                color: isDark ? Colors.black : Colors.white,
                                                size: 35,
                                              ),
                                            ),
                                          );
                                        });
                                  },
                                ),
                                IconButton(
                                    onPressed: mediaItem == queue.last ? null : AudioService.skipToNext,
                                    icon: Icon(Icons.skip_next_rounded, color: Colors.white,
                                    )),
                                IconButton(
                                    onPressed: () {
                                      context.read(audioDownloadProvider).startDownload(url: mediaItem!.id, filename: mediaItem.title+'_'+mediaItem.album);
                                    },
                                    icon: Icon(Icons.download_rounded, color: Colors.white,)),
                              ],
                            ),
                        ],
                      );
                    },
                  ),
                  SizedBox.shrink(),
                ],
              ).asGlass(frosted: false, blurY: 7,blurX: 7,),
            ),
            Positioned(
                bottom: 0,left: 0,right: 0,
                child: DownloadProgressWidget())
          ],
        ),
        bottomNavigationBar: BannerWidget(),
      ),
    );
  }
}
