import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  List videoList = [
    'https://www.youtube.com/watch?v=J97Px_-kY2I',
    'https://www.youtube.com/watch?v=llKo1UMjvzw',
    'https://www.youtube.com/watch?v=gq2bvwrERUc'
  ];

  late YoutubePlayerController _youtubePlayerController;
  late String videoUrl;

  @override
  void initState() {
    super.initState();
    videoUrl = videoList.first;
    _youtubePlayerController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: true,
      ),
    );
  }

  @override
  void dispose() {
    _youtubePlayerController.dispose();
    super.dispose();
  }

  void _changeVideo(String newVideoUrl) {
    setState(() {
      videoUrl = newVideoUrl;
    });
    _youtubePlayerController.load(YoutubePlayer.convertUrlToId(newVideoUrl)!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _youtubePlayerController,
        ),
        builder: (context, player) {
          return Column(
            children: [
              // some widgets
              player,
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: videoList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(videoList[index]),
                      onTap: () {
                        _changeVideo(videoList[index]);
                      },
                    );
                  },
                ),
              ),
              // some other widgets
            ],
          );
        },
      ),
    );
  }
}
