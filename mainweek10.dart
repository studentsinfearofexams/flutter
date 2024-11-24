
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lab10/login.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
        apiKey: "AIzaSyCJ6zXUwEYUWYKlrdGyhHW-my1NoYlrDH0",
        appId: "1:743736802668:android:aa4c52049f43dc394d8749",
        messagingSenderId: "743736802668",
        projectId: "lab10-1b8c0"),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // Check for Errors
          if (snapshot.hasError) {
            print("Something Went Wrong");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          return MaterialApp(
            title: 'Flutter Firebase EMail Password Auth',
            theme: ThemeData(
              primarySwatch: Colors.deepOrange,
            ),
            debugShowCheckedModeBanner: false,
            home: Login(),
          );
        });
  }
}
