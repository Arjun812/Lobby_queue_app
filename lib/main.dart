import 'dart:io';

import 'package:desktop_window/desktop_window.dart';
import 'package:excel/excel.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:webtest/utils/styles.dart';
import 'pages/tabPage/side_bar.dart';
import 'pages/tabPage/tab_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  if(!kIsWeb &&
      (Platform.isMacOS||Platform.isLinux||Platform.isWindows)
  ){
    await DesktopWindow.setMinWindowSize(const Size(600, 800));
  }
 // runApp(const MyApp());
  runApp(SidebarXExampleApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder:(context , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.indigo,
            primaryColor: mainColor
            //primaryColor: C
          ),
          home: const TabPage(title: 'Web App'),
        );
      }
    );
  }
}


