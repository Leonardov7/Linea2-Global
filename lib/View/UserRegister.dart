import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  @override
  UserRegisterApp createState() => UserRegisterApp();
}
class UserRegisterApp extends State<UserRegister>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de usuario'),
      ),
      body: SingleChildScrollView(

      ),
    ) ;
  }
}
