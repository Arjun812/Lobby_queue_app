import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webtest/utils/styles.dart';
import 'package:webtest/widgets/lobby_card.dart';
import 'package:webtest/widgets/student_main_card.dart';

import '../../utils/random_color.dart';

class QueuePage extends StatefulWidget {
  const QueuePage({Key? key}) : super(key: key);

  @override
  State<QueuePage> createState() => _QueuePageState();
}

class _QueuePageState extends State<QueuePage> {
  final ScrollController _scrollController = ScrollController();
  final ScrollController _controller = ScrollController();
  List<Color>? _randomColors;
  Color? _colorCode;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _randomColors = Randoms().randomColors;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Expanded(
            child: Center(
              child:StudentCard(
                division: "LKG - A",
                name: "First Second",
                picture:'https://images.unsplash.com/photo-1603545723222-704768ce6193?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1094&q=80',
              )
            ),
          ),
          width > 1000
              ? SingleChildScrollView(
                  controller: _controller,
                  child: Scrollbar(
                    scrollbarOrientation: ScrollbarOrientation.bottom,
                    controller: _scrollController,
                    child: SizedBox(
                      width: 100.w,
                      child: Column(
                        children: [
                          Text(
                            'Queue List',
                            style: TextStyles.blackTextStyle,
                          ),
                          ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 10,
                            shrinkWrap: true,
                            padding: const EdgeInsets.only(top: 10),
                            itemBuilder: (context, index) {
                              _colorCode = Randoms().randomColors.elementAt(
                                  Random()
                                      .nextInt(Randoms().randomColors.length));
                              return LobbyCard(
                                picture:
                                    'https://images.unsplash.com/photo-1603545723222-704768ce6193?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1094&q=80',
                                name: 'name',
                                division: "LKG - A",
                                borderColor: _colorCode,

                                gradient: LinearGradient(colors: [
                                  _colorCode!.withOpacity(1),
                                  _colorCode!.withOpacity(0.8)
                                ]),
                                //cardColors: _,
                              );
                              //     Container(
                              //   height: 100,
                              //   margin: const EdgeInsets.only(
                              //       bottom: 10, right: 10, left: 10),
                              //   decoration: BoxDecoration(
                              //     border: Border.all(color: _colorCode!),
                              //     borderRadius: BorderRadius.circular(20),
                              //     color: _colorCode!.withOpacity(0.5),
                              //     gradient: LinearGradient(colors: [_colorCode!.withOpacity(0.7),_colorCode!.withOpacity(0.9)]),
                              //     boxShadow: const [
                              //       Shadows.secondaryShadow,
                              //     ],
                              //   ),
                              // );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
