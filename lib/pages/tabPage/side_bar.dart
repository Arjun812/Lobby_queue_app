import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sidebarx/sidebarx.dart';

import '../../utils/styles.dart';
import '../homePage/home_page.dart';
import '../queuePage/queue_page.dart';

class SidebarXExampleApp extends StatelessWidget {
  SidebarXExampleApp({Key? key}) : super(key: key);

  final _controller = SidebarXController(selectedIndex: 0, extended: true);
  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'SidebarX Example',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.indigo,
              primaryColor: mainColor,
              canvasColor: canvasColor,
              scaffoldBackgroundColor: scaffoldBackgroundColor,
              textTheme: const TextTheme(
                headline5: TextStyle(
                  color: Colors.white,
                  fontSize: 46,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            home: Builder(
              builder: (context) {
                final isSmallScreen = MediaQuery.of(context).size.width < 600;
                return Scaffold(
                  key: _key,
                  backgroundColor: scaffoldMain,
                  appBar: isSmallScreen
                      ? AppBar(
                          backgroundColor: canvasColor,
                          title:
                              Text(_getTitleByIndex(_controller.selectedIndex)),
                          leading: IconButton(
                            onPressed: () {
                              // if (!Platform.isAndroid && !Platform.isIOS) {
                              //   _controller.setExtended(true);
                              // }
                              _key.currentState?.openDrawer();
                            },
                            icon: const Icon(Icons.menu),
                          ),
                        )
                      : null,
                  drawer: ExampleSidebarX(controller: _controller),
                  body: Row(
                    children: [
                      if (!isSmallScreen)
                        ExampleSidebarX(controller: _controller),
                      Expanded(
                        child: Center(
                          child: _ScreensExample(
                            controller: _controller,
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        });
  }
}

class ExampleSidebarX extends StatelessWidget {
  const ExampleSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: const Color.fromARGB(255, 47, 60, 104),
        //scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.white.withOpacity(0.7)),
        selectedTextStyle: const TextStyle(color: Colors.white),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.white.withOpacity(0.7),
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.white,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      footerDivider: divider,
      headerBuilder: (context, extended) {
        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(50),
            child: CircleAvatar(
              radius: _controller.extended ==true? 40:30,
              child: FadeInImage.assetNetwork(
                placeholder: 'assets/images/kid.jpeg',
                image: 'https://images.unsplash.com/photo-1568822617270-2c1579f8dfe2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1160&q=80',
                imageErrorBuilder: (_, __, ___) {
                  return Image.asset(
                    'https://picsum.photos/seed/picsum/200/300',
                    scale: 3,
                  ); //this is what will fill the Container in case error happened
                },
                fit: BoxFit.cover,
                width: 80,
                height: 80,
              ),
            ),
          ),
        );

        ///shimmer effect
        //   CircleAvatar(
        //   radius: 50,
        //   child: Shimmer.fromColors(
        //     baseColor: Colors.white24,
        //     highlightColor: Colors.white70,
        //     child: Image.network('https://picsum.photos/seed/picsum/200/300',
        //     fit: BoxFit.cover,
        //     ),
        //   ),
        // );
      },
      items: [
        SidebarXItem(
          icon: Feather.list,
          label: 'Home',
          onTap: () {
            debugPrint('Home');
          },
        ),
        const SidebarXItem(
          icon: Feather.database,
          label: 'Database',
        ),
        const SidebarXItem(
          icon: Feather.clipboard,
          label: 'History',
        ),
        const SidebarXItem(
          icon: Feather.user,
          label: 'User',
        ),
      ],
    );
  }
}

class _ScreensExample extends StatelessWidget {
  const _ScreensExample({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = _getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return const QueuePage();
          case 1:
            return HomePage();
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headline5,
            );
        }
      },
    );
  }
}

String _getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Database';
    case 2:
      return 'History';
    case 3:
      return 'User';
    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Color(0xFF2E2E48);
const scaffoldBackgroundColor = Color(0xFFEFEFEF);
const accentCanvasColor = Color(0xFF3E3E61);
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
