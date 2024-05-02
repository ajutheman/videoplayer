import 'package:flutter/material.dart';

class YoutubePlayerController {
  final String initialVideoId;
  final bool mute;
  final bool autoPlay;
  final bool disableDragSeek;
  final bool loop;
  final bool isLive;
  final bool forceHD;
  final bool enableCaption;

  late bool _isPlaying;
  late double _volume;
  late bool _muted;

  YoutubePlayerController({
    required this.initialVideoId,
    this.mute = false,
    this.autoPlay = true,
    this.disableDragSeek = false,
    this.loop = false,
    this.isLive = false,
    this.forceHD = false,
    this.enableCaption = true,
  }) {
    _isPlaying = autoPlay;
    _volume = mute ? 0 : 100;
    _muted = mute;
  }

  bool get isPlaying => _isPlaying;
  double get volume => _volume;
  bool get isMuted => _muted;

  void play() {
    _isPlaying = true;
    // Add logic to play the video
  }

  void pause() {
    _isPlaying = false;
    // Add logic to pause the video
  }

  // void mute() {
  //   _muted = true;
  //   _volume = 0;
  //   // Add logic to mute the video
  // }

  void unMute() {
    _muted = false;
    _volume = 100;
    // Add logic to unmute the video
  }

  void setVolume(double volume) {
    _volume = volume;
    // Add logic to set the volume of the video
  }

  void dispose() {
    // // Release resources associated with the video player
    // // For example:
    // // - Stop video playback
    // // - Release any streams or controllers
    // // - Dispose of any listeners or subscriptions
    //
    // // _controller.pause(); // Example: Stop video playback
    //
    // // Dispose of any TextEditingController instances
    // _idController.dispose();
    // _seekToController.dispose();
    //
    // // Dispose of the YoutubePlayerController instance
    // _controller.dispose();
  }

// Add more methods and properties as needed
}

class YoutubePlayerDemoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Youtube Player Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        appBarTheme: const AppBarTheme(
          color: Colors.blueAccent,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 20,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.blueAccent,
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late YoutubePlayerController _controller;
  late TextEditingController _idController;

  final List<String> _ids = [
    'nPt8bK2gbaU',
    'gQDByCdjUXw',
    'iLnmTe5Q2Qw',
    '_WoCV4c6XOE',
    'KmzdUe0RSJo',
    '6jZDSSZZxjQ',
    'p2lYr3vM_1w',
    '7QUtEmBT_-w',
    '34_PXCzGw1M',
  ];

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: _ids.first,
    );
    _idController = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _idController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Youtube Player Flutter',
          style: TextStyle(color: Colors.white),
        ),
      ),
      // dd
      body: ListView(
        children: [
          YoutubePlayer(controller: _controller),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                TextField(
                  controller: _idController,
                  decoration: InputDecoration(
                    hintText: 'Enter YouTube video ID',
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    if (_idController.text.isNotEmpty) {
                      _controller = YoutubePlayerController(
                        initialVideoId: _idController.text,
                      );
                      setState(() {});
                    }
                  },
                  child: const Text('Play Video'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class YoutubePlayer extends StatelessWidget {
  final YoutubePlayerController controller;

  const YoutubePlayer({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 200,
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: Container(
          color: Colors.black,
          child: Center(
            child: Text(
              'Video Player Placeholder',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(YoutubePlayerDemoApp());
}
