import 'package:audio_service/audio_service.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ccbclibrary/presentation/player/media_state.dart';
import 'package:ccbclibrary/presentation/player/queue_state.dart';
import 'package:ccbclibrary/presentation/screens/now_playing_screen.dart';
import 'package:flutter/material.dart';

class MiniPlayerWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final size = MediaQuery.of(context).size;

    return StreamBuilder<bool>(
        stream: AudioService.runningStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.active) {
            return SizedBox.shrink();
          }
          final running = snapshot.data ?? false;
          if(!running) return SizedBox.shrink();
          return Material(
            child: InkWell(
              splashFactory: InkRipple.splashFactory,
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>NowPlaying()));
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12,width: 0.5)
                ),
                height: 65,
                child: StreamBuilder<QueueState>(
                    stream: queueStateStream,
                    builder: (context, snapshot) {
                      final queueState = snapshot.data;
                      final queue = queueState?.queue ?? [];
                      final mediaItem = queueState?.mediaItem;
                      if(AudioService.connected)
                        return StreamBuilder<MediaState>(
                            stream: mediaStateStream,
                            builder: (context, snapshot) {
                              final mediaState = snapshot.data;
                              if(mediaState==null) return SizedBox.shrink();

                              double valueFromPosition(
                                  {required final Duration? current, required Duration? total}) {
                                return current!.inSeconds/total!.inSeconds;
                              }
                              return Column(
                                children: [
                                  Expanded(
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(3),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,width: 55,height: size.height,
                                              placeholder: (context, url) => Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover),
                                              imageUrl: mediaState.mediaItem?.artUri?.toString()??'',
                                              errorWidget: (context, url, error) => Image.asset('assets/images/placeholder.jpg',fit: BoxFit.cover),
                                            ),),
                                        ),
                                        Expanded(
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 10),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              mainAxisSize: MainAxisSize.min,
                                              children: [
                                                if (mediaItem?.title != null)
                                                  Text(mediaItem?.title??'',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.w700),),
                                                if (mediaItem?.artist != null)
                                                  Text(mediaItem?.artist??'',maxLines: 1,overflow: TextOverflow.ellipsis,
                                                    style: TextStyle(fontSize: 12,color: isDark?Colors.white70:Colors.black54),
                                                  ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        if (queue.isNotEmpty)
                                          Row(mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              IconButton(
                                                  onPressed: mediaItem == queue.first ? null : AudioService.skipToPrevious,
                                                  icon: Icon(Icons.skip_previous_rounded)),
                                              StreamBuilder<AudioProcessingState>(
                                                stream: AudioService.playbackStateStream.map((state) => state.processingState).distinct(),
                                                builder: (context, snapshot) {
                                                  final processingState = snapshot.data ?? AudioProcessingState.none;
                                                  return StreamBuilder<bool>(
                                                      stream: AudioService.playbackStateStream.map((state) => state.playing).distinct(),
                                                      builder: (context, snapshot) {
                                                        final playing = snapshot.data ?? false;
                                                        return IconButton(
                                                          iconSize: 30,
                                                          onPressed: playing?AudioService.pause:AudioService.play,
                                                          icon: processingState==AudioProcessingState.buffering?
                                                          Container(height:24,width: 24,child: CircularProgressIndicator(valueColor:AlwaysStoppedAnimation<Color>(isDark?Colors.white:Colors.black,),strokeWidth: 3,))
                                                              :Icon(playing?Icons.pause_circle_filled_rounded:Icons.play_circle_fill_rounded,size: 30,),
                                                        );
                                                      }
                                                  );
                                                },
                                              ),

                                              IconButton(
                                                  onPressed: mediaItem == queue.last ? null : AudioService.skipToNext,
                                                  icon: Icon(Icons.skip_next_rounded,)),
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                  // if(mediaState.mediaItem?.duration!=null)
                                  LinearProgressIndicator(
                                    value: mediaState.mediaItem?.duration==null?null:valueFromPosition(
                                        current: mediaState.position,
                                        total: mediaState.mediaItem?.duration??Duration.zero),),
                                ],
                              );
                            }
                        );
                      return SizedBox.shrink();
                    }
                ),
              ),
            ),
          );
        }
    );
  }
}

