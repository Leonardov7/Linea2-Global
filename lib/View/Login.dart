import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';
import 'package:proyectolinea2/View/Geolocalizacion.dart';

class Login extends StatefulWidget {
  //cambia dinámicamente
  @override
  LoginApp createState() => LoginApp();
}

class LoginApp extends State<Login> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  final LocalAuthentication auth = LocalAuthentication();
  String idUser='';

  validarDatos() async {
    try {
      CollectionReference ref = FirebaseFirestore.instance.collection("User");
      print('***----1');
      QuerySnapshot usuario = await ref.get();
      if (usuario.docs.length != 0) {
        print('***----2');
        for (var cursor in usuario.docs) {

          if (user.text == cursor.get('Correo')) {
            print('***----3');
            if (pass.text == cursor.get('Password')) {
              idUser= cursor.id.toString();
              mensaje('Mensaje', 'dato encontrado',idUser);

              print(cursor.id);
            }
          }
          //print(cursor.get('User'));
        }
      }
    } catch (e) {
      mensajeGeneral('Error', e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    /*setState(() {
      biometrico();
    });*/
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.asset('image/User.png'),
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Correo',
                  hintText: 'Digite su cooreo',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: TextField(
                controller: pass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Pass',
                  hintText: 'Digite la contraseña',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(500, 50),
                  primary: Colors.black45,
                ),
                onPressed: () {
                  validarDatos();

                  //pass.clear();
                  //mensaje('Este es un título', 'Este es un mensaje');
                },
                child: Text('Ingresar',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(50, 50),
                  primary: Colors.black45,
                ),
                onPressed: () async{
                  print("dentro");
                  bool isSuccess= await biometrico();

                  print('success '+isSuccess.toString());
                },
                child: Icon(Icons.fingerprint, size: 80),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void mensaje(String titulo, String mess, String userId) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              RaisedButton(
                onPressed: () async {
                  String idU=await userId;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => Geolocalizacion(idU)));

                },
                child:
                    Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              )
            ],
          );
        });
  }
  void mensajeGeneral(String titulo, String mess) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title: Text(titulo),
            content: Text(mess),
            actions: <Widget>[
              RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();

                },
                child:
                Text("Aceptar", style: TextStyle(color: Colors.blueGrey)),
              )
            ],
          );
        });
  }

  Future<bool> biometrico() async {
    //print("biométrico");

    bool flag = true;
    bool authenticated = false;
    if (flag) {

      const androidString = const AndroidAuthMessages(
        cancelButton: "Cancelar",
        goToSettingsButton: "Ajustes",
        signInTitle: "Ingrese",
        goToSettingsDescription: "Confirme su huella",

        biometricHint: "Toque el sensor",
        biometricNotRecognized: "Huella no reconocida",
        biometricRequiredTitle: "Required Title",
        biometricSuccess: "Huella reconocida",
      );
      bool canCheckBiometrics = await auth.canCheckBiometrics;
      bool isBiometricSupported = await auth.isDeviceSupported();
      List<BiometricType> availableBiometrics =
          await auth.getAvailableBiometrics();
      print(canCheckBiometrics); //Returns trueB
      print("support -->" + isBiometricSupported.toString());
      print(
          availableBiometrics.toString()); //Returns [BiometricType.fingerprint]
      try {
        authenticated = await auth.authenticate(
            localizedReason: "Autentíquese para acceder",
            useErrorDialogs: true,
            stickyAuth: true,
            biometricOnly: true,
            androidAuthStrings: androidString);
        if (!authenticated) {
         authenticated=false;
        }
      } on PlatformException catch (e) {
        print(e);
      }
     /* if (!mounted) {
        return;
      }*/

    }
    return authenticated;
  }
}
