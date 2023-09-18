import 'package:flutter/material.dart';
import 'package:music_player/utils/VideoDetails.dart';

import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class VdoDtailsPage extends StatefulWidget {
  const VdoDtailsPage({Key? key}) : super(key: key);

  @override
  State<VdoDtailsPage> createState() => _VdoDtailsPageState();
}

class _VdoDtailsPageState extends State<VdoDtailsPage> {

  late VideoPlayerController videoPlayerController;
  late ChewieController chewieController;

  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.asset(allVideos[index]['video'])
      ..initialize().then((value) => setState(() {}));
    chewieController = ChewieController(
        videoPlayerController: videoPlayerController,
        aspectRatio: 4 / 2,
        autoPlay: false,
        allowFullScreen: true
    );
  }

  @override
  Widget build(BuildContext context) {

    Map<String, dynamic> data1 =
    ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Divider(),
            Text(
              allVideos[index]['name1'],
              style: TextStyle(
                decoration:TextDecoration.underline,
                fontSize: 35,
              ),
            ),
            Divider(),
            SizedBox(
              height: 20,
            ),
            AspectRatio(
              aspectRatio: 4 / 2,
              child: Chewie(
                controller: chewieController,
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            Expanded(
              child: SingleChildScrollView(
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

          ],
        ),

      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    videoPlayerController.dispose();
  }
}