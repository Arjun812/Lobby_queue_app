import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:webtest/widgets/ContainerText.dart';

import '../utils/styles.dart';

class StudentCard extends StatefulWidget {
  final String? name, division, picture;

  const StudentCard({Key? key, this.name, this.division, this.picture})
      : super(key: key);

  @override
  State<StudentCard> createState() => _StudentCardState();
}

class _StudentCardState extends State<StudentCard> with TickerProviderStateMixin{
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      //width: 150.w,
      margin: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: const [
          Shadows.secondaryShadow,
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            height: 250,
            left: 60,
            top: 140,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                color: Colors.red,
                height: 200,
              ),
            ),
          ),
          Positioned(
            height: 250,
            left: 80,
            top: 120,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Container(
                color: Colors.yellow,
                height: 200,
              ),
            ),
          ),
          Positioned(
            height: 220,
            left: 95,
            top: 135,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: SizedBox(
                height: 200,
                child: Image.network(widget.picture!),
              ),
            ),
          ),
          Positioned(
            height: 50,
            left: 290,
            top: 345,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: SizedBox(
                height: 50,
                child: Image.asset('assets/images/rubik.png'),
              ),
            ),
          ),
          Positioned(
            height: 50,
            left: 50,
            top: 105,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: SizedBox(
                height: 50,
                child: Image.asset('assets/images/coin.png'),
              ),
            ),
          ),
          Positioned(
            height: 200,
            left: 355,
            top: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ContainText(
                    'Fist Name',
                  width: 500,
                  //fontStyle: FontStyle.italic,
                  fontColor: Colors.black,
                  fontSize:28,
                  fontWeight: FontWeight.bold,

                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10, right: 10, left: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 30,),
                      Icon(Icons.school,size: 28,),
                      SizedBox(width: 8,),
                      ContainText(
                        'Fist Name',
                        width: 500,
                        //fontStyle: FontStyle.italic,
                        fontColor: Colors.black,
                        fontSize:18,
                        fontWeight: FontWeight.bold,

                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // Positioned(
          //   height: 150,
          //   left: 600,
          //   top: 320,
          //   child: AspectRatio(
          //     aspectRatio: 1 / 1,
          //     child: SizedBox(
          //       height: 50,
          //       child: Image.asset('assets/images/tennis.png'),
          //     ),
          //   ),
          // ),
          Positioned(
            height: 250,
            left:550,
            top: 250,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Lottie.asset(
                'assets/animation/cat-happy.json',
                controller: _controller,
                onLoaded: (composition) {
                  _controller..duration = composition.duration..forward();
                  _controller.repeat();
                },
              ),
            ),
          ),
          Positioned(
            height: 250,
            left: 350,
            top: 10,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Lottie.asset(
                'assets/animation/exploding-ribbon-and-confetti.json',
                controller: _controller,
                onLoaded: (composition) {
                  _controller..duration = composition.duration..forward();
                  _controller.repeat();
                },
              ),
            ),
          ),

        ],
      ),
    );
  }
}
