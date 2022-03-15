import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'View/Login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: Home());
  }
}

class Home extends StatefulWidget {
  @override
  HomeStart createState() => HomeStart();
}

class HomeStart extends State<Home> {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bienvenidos App Línea 2',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home App línea 2'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    child: Image.asset('image/User.png'),

                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
                child: ElevatedButton(
                  style:ElevatedButton.styleFrom(minimumSize: Size(500,50)),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>Login()));
                  },
                  child: Text('Ingresar'),
                 )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
