import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:object_detection/realtime/live_camera.dart';
import 'package:object_detection/static%20image/static.dart';
List<CameraDescription> cameras;

Future<void> main() async {
  // initialize the cameras when the app starts
  WidgetsFlutterBinding.ensureInitialized();
  cameras = await availableCameras();
  // running the app
  runApp(
    MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
    )
  );
}
class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Button-Less App"),
        centerTitle: true,
      ),
      body: Container(
        child:Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                  child: SwipeDetector(
                    onSwipeUp: () {
                      print("Main Swiped Up");
                    },
                    onSwipeDown: () {
                      print("Main Swiped Down");
                    },
                    onSwipeLeft: () {
                      print("Main Swiped Left");
                      Navigator.push(context, MaterialPageRoute(
                          builder: (context) => StaticImage(),
                      ));
                    },
                    onSwipeRight: () {
                      print("Main Swiped Right");
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) => LiveFeed(cameras),
                      ));
                    },
                  ))
            ],
          ),
        ),
      ),
    );
  }
}