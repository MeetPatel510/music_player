


import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:music_player/provider/SongProvider.dart';
import 'package:music_player/utils/SongDetails.dart';
import 'package:provider/provider.dart';

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({Key? key}) : super(key: key);

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<SongProvider>(context, listen: false)
          .songInitialization(songIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return

      CarouselSlider(
      options: CarouselOptions(
        height: 400,
        //viewportFraction: 0.8,
        enlargeCenterPage: true,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.easeInOut,

      ),
      items: [
        ...allSongs.map(
              (e) => InkWell(
            onTap: () {
              songIndex = allSongs.indexOf(e);
              Navigator.pushNamed(context, 'AudioControlsPage');
            },
                child:  Scaffold(
                  body:  Column(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: AssetImage(e['image']),
                              fit: BoxFit.cover,
                            ),
                            boxShadow: const [
                              BoxShadow(
                                offset: Offset(1, 6),
                                color: Colors.black,
                                blurRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: () {
                              Provider.of<SongProvider>(context, listen: false)
                                  .previousSong();
                            },
                            icon: const Icon(
                              Icons.skip_previous,
                              size: 34,
                            ),
                          ),
                          FloatingActionButton(
                            heroTag: null,
                            onPressed: () async {
                              Provider.of<SongProvider>(context, listen: false)
                                  .playButton();
                            },
                            child: Provider.of<SongProvider>(context)
                                .playAndPauseIcon(),
                          ),
                          IconButton(
                            onPressed: () {
                              Provider.of<SongProvider>(context, listen: false)
                                  .nextSong();
                            },
                            icon: const Icon(
                              Icons.skip_next,
                              size: 34,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),



                ),


          ),
        )
      ],
    );

  }

  @override
  void deactivate() {
    super.deactivate();
    Provider.of<SongProvider>(context, listen: false).songDeactivate();
  }
}
