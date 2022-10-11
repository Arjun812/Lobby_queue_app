import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:webtest/widgets/ContainerText.dart';

import '../utils/random_color.dart';
import '../utils/styles.dart';

class LobbyCard extends StatelessWidget {
  const LobbyCard(
      {Key? key,
      required this.picture,
      required this.name,
      required this.division,
      this.borderColor,
      this.cardColors, this.gradient})
      : super(key: key);
  final String? picture, name, division;
  final Color? borderColor;
  final Color? cardColors;
  final LinearGradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      decoration: BoxDecoration(
        border: Border.all(color:borderColor!),
        borderRadius: BorderRadius.circular(20),
        color: cardColors,
        gradient: gradient,
        boxShadow: const [
          Shadows.secondaryShadow,
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              clipBehavior: Clip.hardEdge,
              decoration:
              const BoxDecoration(shape: BoxShape.circle),
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/kid.jpeg',
                image: picture!,
                imageErrorBuilder: (_, __, ___) {
                  return Image.asset('assets/images/kid.jpeg',scale: 1,); //this is what will fill the Container in case error happened
                },
                fit: BoxFit.cover,
                width: 70,
                height:100,
              ),
            ),
          ),
          const SizedBox(width: 10,),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                  child: ContainText(
                    name,
                    width: 100,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 2.0),
                      child: Icon(Icons.school,size: 16,),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 2.0),
                      child: ContainText(division),
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
