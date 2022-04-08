import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:proyectolinea2/View/Geolocalizacion.dart';
import 'View/Login.dart';
import 'View/UserRegister.dart';
import 'View/REST.dart';

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
          backgroundColor: Colors.black45,
        ),drawer: Drawer(
          child: new ListView(
            children: <Widget>[
              UserAccountsDrawerHeader(
                accountName: Text("Guillermo García"),
                accountEmail: Text("email@prueba.es"),
                currentAccountPicture: CircleAvatar(child: Image.asset('image/User.png')),
                decoration: BoxDecoration(
                  color: Colors.black45,
                ),
              ),
              ListTile(
                title: Text('Home'),
                leading: Icon(Icons.home),
              ),
              ListTile(
                title: Text('Ingresar'),
                leading: Icon(Icons.login),
                onLongPress: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Login()));
                },
              ),
              ListTile(
                title: Text('Nuevo usuario'),
                leading: Icon(Icons.group_add),
                onLongPress: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => UserRegister()));
                },
              ),

            ],
          )
      ),
        body:
        SingleChildScrollView(
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
                  style: ElevatedButton.styleFrom(
                      primary: Colors.black45,
                      minimumSize: Size(400, 50)),

                  onPressed: () {
                    print('Ingreso Login');
                    Navigator.push(
                        context, MaterialPageRoute(builder: (_) => Login()));
                  },
                  child: Text('Ingresar',style: TextStyle(color: Colors.white,fontSize: 20),),
                ),
              ),
              Padding(
                padding:
                    EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      primary: Colors.black45,

                      minimumSize: Size(400, 50)),
                  onPressed: () {
                    print('Registrar Usuario');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => UserRegister()));
                  },
                  child: Text('Registrar Usuario',style: TextStyle(color: Colors.white,fontSize: 20)),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      primary: Colors.black45,

                      minimumSize: Size(400, 50)),
                  onPressed: () {
                    print('Registrar Usuario');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => REST('4.916,-74.096')));
                  },
                  child: Text('Consumir servicio',style: TextStyle(color: Colors.white,fontSize: 20)),
                ),
              ),
              Padding(
                padding:
                EdgeInsets.only(left: 10, top: 10, right: 10, bottom: 0),
                child: ElevatedButton(

                  style: ElevatedButton.styleFrom(
                      primary: Colors.black45,

                      minimumSize: Size(400, 50)),
                  onPressed: () {
                    print('Geolocalización');
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => Geolocalizacion('')));
                  },
                  child: Text('Geolocalización',style: TextStyle(color: Colors.white,fontSize: 20)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
