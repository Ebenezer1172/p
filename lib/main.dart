 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:note/homepage.dart';  
import 'package:note/user_notifier.dart';
import 'package:note/viewscreen.dart';
 


void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserNotifier(),
        )
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key); 
  @override
  Widget build(BuildContext context) {
    return   MaterialApp(
      debugShowCheckedModeBanner: false,

        initialRoute: '/',
      routes: {
        // '/listscreen': (BuildContext context) => const NoteList(),
        // '/firstpage':  (BuildContext context) => const WelcomeScreen(),
         '/home':(BuildContext context) => const Home(),
         '/viewscreen':(BuildContext context ) => const ViewScreen(),
        //  '/editionscreen': (BuildContext context) => const  EditionScreen(),
      },
    
      home: const  Home(),
    );
  }
} 



 