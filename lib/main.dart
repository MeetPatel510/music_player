import 'package:flutter/material.dart';
import 'package:music_player/provider/SongProvider.dart';
import 'package:music_player/provider/VideoPlayer.dart';
import 'package:music_player/views/audio_detail_page.dart';
import 'package:music_player/views/HomePage.dart';
import 'package:music_player/views/vdodetail_page.dart';import 'package:provider/provider.dart';
import 'package:assets_audio_player/assets_audio_player.dart';

import 'models/SongModel.dart';
import 'models/VideoModel.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SongProvider(
            songModel: SongModel(
              isSongPlay: false,
              isMute: false,
              volume: 0.6,
              assetsAudioPlayer: AssetsAudioPlayer(),
              currentSliderValue: const Duration(seconds: 0),
              totalDuration: const Duration(seconds: 0),
              songIndex: 0,
            ),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => VideoProvider(
            videoModel: VideoModel(),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(
          useMaterial3: true,
        ),
        darkTheme: ThemeData.dark(
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        color: Colors.greenAccent,
        routes: {
          '/': (context) => const HomePage(),
          'AudioControlsPage': (context) => const AudioControlsPage(),
          'vdodetail_page': (context) => const VdoDtailsPage(),
        },
      ),
    ),
  );
}
