import 'dart:async';
import 'dart:ui';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testapp_work/screens/home.dart';

import '../../constant/colorapp.dart';

class CallAudioScreen extends StatefulWidget {
  const CallAudioScreen({super.key});

  @override
  State<CallAudioScreen> createState() => _CallAudioScreenState();
}

class _CallAudioScreenState extends State<CallAudioScreen> {
  Duration _callDuration = Duration.zero; // Initialisation de la durée à 0
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    // Démarrer le Timer pour incrémenter la durée chaque seconde
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _callDuration = _callDuration + const Duration(seconds: 1);
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Arrêter le Timer pour éviter les fuites de mémoire
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    final minutes = duration.inMinutes % 60;
    final seconds = duration.inSeconds % 60;
    final hours = duration.inHours;

    if (hours > 0) {
      return '${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    } else {
      return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Image principale
          Image.asset(
            "assets/images/callaudio.jpg",
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
          ),
          // Opacité et flou
          Positioned.fill(
            top: 250,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: Container(
                child: Column(
                  children: [
                    AvatarGlow(
                      startDelay: const Duration(milliseconds: 1000),
                      glowColor: AppColor.primary,
                      glowShape: BoxShape.circle,
                      child: Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/avatarglow.png"),
                              fit: BoxFit.fill),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ),
                    SizedBox(height: 150),
                    // Texte de la durée d'appel
                    Text(
                      _formatDuration(_callDuration),
                      style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 70,
                          width: 70,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColor.iconColor,
                          ),
                          child: Center(
                              child: Icon(
                                IconlyLight.video,
                                color: Colors.white,
                              )),
                        ),
                        SizedBox(width: 30),
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                          },
                          child: Container(
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.red,
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  _timer?.cancel(); // Arrêter le Timer en cas de fin d'appel
                                  Get.back();
                                },
                                child: Icon(
                                  IconlyLight.call,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: AppColor.iconColor,
                          ),
                          child: Center(
                              child: Icon(
                                Icons.mic,
                                color: Colors.white,
                              )),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
