import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'View/Login.dart';
import 'View/UserRegister.dart';

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
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Container(
                    width: 200,
                    height: 200,
                    child: Image.asset('image/User.png'),
                  ),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(400, 50)),
                  onPressed: () {
                    print('Ingreso Login');
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: Text('Ingresar'),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(minimumSize: Size(400, 50)),
                  onPressed: () {
                    print('Registrar Usuario');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UserRegister()));
                  },
                  child: Text('Registrar Usuario'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
