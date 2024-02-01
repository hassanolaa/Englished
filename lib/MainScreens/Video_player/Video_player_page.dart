

import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class Video_player_page extends StatefulWidget {
  String video;
   Video_player_page({
     required this.video,
   }) ;

  @override
  State<Video_player_page> createState() => _Video_player_pageState();
}

class _Video_player_pageState extends State<Video_player_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.all(20),
        children:  [
          SizedBox(height: 20,),
          VideoPlayerView(
            url:widget.video ,
            dataSourceType: DataSourceType.network,
          ),
          SizedBox(height: 20,),
        //  VideoPlayerView(
        //    url:"images/test.mp4" ,
        //    dataSourceType: DataSourceType.asset,
        //  )
        ],
      ),
    );
  }
}

class VideoPlayerView extends StatefulWidget {

  const VideoPlayerView({
  super.key,
  required this.url,
  required this.dataSourceType,
  });
  final String url;
  final DataSourceType dataSourceType;
  @override
  State<VideoPlayerView> createState() => _VideoPlayerViewState();
}

class _VideoPlayerViewState extends State<VideoPlayerView> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;
  @override
  void initState() {
    // TODO: implement initState
    switch(widget.dataSourceType){
      case DataSourceType.asset:
        _videoPlayerController=VideoPlayerController.asset(widget.url);
        break;
      case DataSourceType.network:
        _videoPlayerController=VideoPlayerController.network(widget.url);
        break;

    }
    _chewieController=ChewieController(videoPlayerController:_videoPlayerController,
        aspectRatio: 16/9
        ,autoPlay: true,
        autoInitialize: true,
      showControls: true,

    );
    super.initState();
  }
  @override
  void dispose(){
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.dataSourceType.name.toUpperCase(),style:TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)
        ,Divider(),
        AspectRatio(aspectRatio: 16/9,
          child: Chewie(controller: _chewieController!,),
        )
      ],
    );
  }
}

