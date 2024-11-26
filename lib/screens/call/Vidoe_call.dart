import 'dart:async';
import 'dart:ui';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constant/colorapp.dart';

class ViedeoScreen extends StatefulWidget {
  const ViedeoScreen({Key? key}) : super(key: key);

  @override
  State<ViedeoScreen> createState() => _ViedeoScreenState();
}

class _ViedeoScreenState extends State<ViedeoScreen> {
  double _xOffset = 0;
  double _yOffset = 0;
  Duration _callDuration = Duration.zero; // Durée de l'appel
  Timer? _timer; // Timer pour incrémenter la durée

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
          // Image de fond
          Image.asset(
            "assets/images/callaudio.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
          ),
          // Widget draggable
          Positioned(
            top: _yOffset,
            left: _xOffset,
            child: Draggable(
              child: Container(
                height: 170,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage("assets/images/pro.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              feedback: Container(
                height: 170,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: AssetImage("assets/images/pro.jpg"),
                    fit: BoxFit.cover,
                  ),
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
              onDraggableCanceled: (velocity, offset) {
                setState(() {
                  _xOffset = offset.dx;
                  _yOffset = offset.dy;
                });
              },
            ),
          ),
          Positioned(
            bottom: 100,
            left: 30,
            right: 30,
            child: Column(
              children: [
                Text(
                  "Dr.Marcus Horizon",
                  style: GoogleFonts.montserrat(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Affichage de la durée dynamique
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
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.red,
                      ),
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            _timer?.cancel(); // Arrêter le Timer à la fin de l'appel
                            Get.back();
                          },
                          child: Icon(
                            IconlyLight.call,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 30),
                    AvatarGlow(
                      startDelay: const Duration(milliseconds: 1000),
                      glowColor: AppColor.primary,
                      glowShape: BoxShape.circle,
                      child: Container(
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
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
