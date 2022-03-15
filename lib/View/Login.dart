import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Login extends StatefulWidget{//cambia dinámicamente
  @override
  LoginApp createState()=> LoginApp();
}

class LoginApp extends State<Login>{
  
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingreso de Clientes'),  
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.all(10),
            child: Center(
              child: Container(
                width: 100,
                height: 100,
                child: Image.asset('image/User.png'),
              ),
            ),
            )
            
          ],
        ),
      ),
    );
  }
}