import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'homepage.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen>
    with SingleTickerProviderStateMixin {
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.white, letterSpacing: 3));

  @override
  Widget build(BuildContext context) {
    // const color = Colors.white;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey[900],
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Text(
                      "TIC TAC TOE",
                      style: myNewFontWhite.copyWith(fontSize: 25),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: AvatarGlow(
                    endRadius: 140,
                    duration: const Duration(seconds: 2),
                    glowColor: Colors.white,
                    repeat: true,
                    repeatPauseDuration: const Duration(seconds: 1),
                    startDelay: const Duration(seconds: 1),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                            style: BorderStyle.none,
                          ),
                          shape: BoxShape.circle),
                      child: CircleAvatar(
                        backgroundColor: Colors.grey[900],
                        radius: 80.0,
                        child: Image.asset(
                          'lib/images/ticktactoe.png',
                          color: Colors.white,
                          fit: BoxFit.scaleDown,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Text(
                      "@CREATIVENESS",
                      style: myNewFontWhite.copyWith(fontSize: 20),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, bottom: 60),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        color: Colors.white,
                        child: Center(
                          child: Text(
                            'PLAY GAME',
                            style: myNewFont,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
