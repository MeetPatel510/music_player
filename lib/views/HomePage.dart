import 'package:flutter/material.dart';
import 'package:music_player/views/audio_page.dart';
import 'package:music_player/views/video_page.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Media Player"),
          centerTitle: true,
          bottom: const TabBar(
            indicatorSize: TabBarIndicatorSize.tab,
            labelStyle: TextStyle(
              fontSize: 18,
            ),
            tabs: [
              Tab(
                child: Text("Audio"),
              ),
              Tab(
                child: Text("Video"),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AudioPlayer(),
            VideoPage(),
          ],
        ),
      ),
    );
  }
}
