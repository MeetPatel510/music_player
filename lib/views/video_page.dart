import 'package:flutter/material.dart';
import 'package:music_player/utils/VideoDetails.dart';


class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child:
        SingleChildScrollView(
          child: Center(
            child: Column(
              children:
              allVideos.map(
                    (e) => GestureDetector(
                  onTap: () {
                    index = allVideos.indexOf(e);
                    Navigator.of(context).pushNamed('vdodetail_page', arguments: allVideos[index]);
                  },
                  child: Container(
                    height: 200,
                    width: 400,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      image: DecorationImage(
                          image: AssetImage(
                            e['image1'],
                          ),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.play_circle_filled,
                      color: Colors.white.withOpacity(0.7),
                      size: 50,
                    ),
                  ),
                ),
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}
