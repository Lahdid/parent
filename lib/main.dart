import 'dart:isolate';
import '/utils/constants.dart' as constants;
import 'package:flutter/material.dart';
import 'package:platform_device_id/platform_device_id.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:socket_io_client/socket_io_client.dart';
import 'package:weparent/utils/themeManager.dart';
import 'package:weparent/routes/routes.dart';





Future<void> main() async {

  final receivePort = ReceivePort();
  //await Isolate.spawn(printMessage, receivePort.sendPort);


  runApp(ChangeNotifierProvider(create: (context) => ThemeManager(),
  child: const MyApp()));
}




class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



 @override
  void initState() {

    super.initState();


  }

 final ThemeData myDarkTheme = ThemeData.dark().copyWith(
   //customize dark theme
 );

  @override
  Widget build(BuildContext context) {
final manager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:  ThemeData(
        appBarTheme: AppBarTheme( backgroundColor: Colors.white)
      ),

       darkTheme: myDarkTheme,
       themeMode: manager.themeMode,


      //home: SignIn(),
      //home: SignUp(),
      //home: EnterEmail()
      routes: routes,
    );
  }
}
