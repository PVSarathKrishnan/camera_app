import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:cam/Screens/CameraScreen.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Obtain a list of the available cameras on the device.
  final cameras = await availableCameras();
  runApp(MyApp(cameras: cameras));
}

class MyApp extends StatelessWidget {
  final List<CameraDescription> cameras;
  const MyApp({Key? key, required this.cameras}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Camera App',
      home:AnimatedSplashScreen(splash: Column(
        children: [
          
          Icon(Icons.camera),
          SizedBox(height: 20,),
          Text("Opening Camera for You",style: GoogleFonts.bebasNeue(letterSpacing: 3),)
        ],
      ),
      duration: 1000,
      splashTransition: SplashTransition.fadeTransition,
       nextScreen: CameraScreen(cameras: cameras),) 
    );
  }
}