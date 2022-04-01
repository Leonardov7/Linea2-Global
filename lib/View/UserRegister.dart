import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_localizations/flutter_localizations.dart';

class UserRegister extends StatefulWidget {
  @override
  UserRegisterApp createState() => UserRegisterApp();
}

class UserRegisterApp extends State<UserRegister> {
  DateTime selectedDate = DateTime.now();
  var passHide=true;
  var ojo=Icons.visibility;
  TextEditingController fecha = TextEditingController();
  TextEditingController pass= TextEditingController();
  TextEditingController nombreUser= TextEditingController();
  TextEditingController identity=TextEditingController();
  TextEditingController correo=TextEditingController();
  TextEditingController tele=TextEditingController();
  var _currentSelectedDate;
  final firebase=FirebaseFirestore.instance;
  inserDatatUser() async{
    try{
      await firebase
          .collection("User")
          .doc()
          .set({
        "NombreUsuario":nombreUser.text,
        "Identificación":identity.text,
        "Correo":correo.text,
        "Telefono":tele.text,
        "FechaNacido":fecha.text,
        "Password":pass.text,
        "Estado":true
      });
    }
    catch (e){
      print('ERROR--> '+e.toString());
    }
  }

  void callDataPcker() async {
    var selectedDate = await getDatePickerWidget();
    setState(() {
      _currentSelectedDate = selectedDate;
      if (selectedDate != null) {
        fecha.text = selectedDate.toString().substring(0, 10);
        //fecha.text='1940-01-01';
      }
    }
    );
  }

  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
        context: context,
        initialDate: DateTime(2022),
        firstDate: DateTime(1930),
        lastDate: DateTime.now(),
        fieldHintText: "DIA/MES/AÑO",
        fieldLabelText: "Día/Mes/Año",
        helpText: "FECHA DE NACIMIENTO",
        errorFormatText: "Ingrese una fecha válida",
        errorInvalidText: "Fecha fuera de rango",
        initialEntryMode: DatePickerEntryMode.input,
        builder: (context, child) {
          return Theme(data: ThemeData.dark(), child: Center(child: child));
        });
  }

  var flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black45,
        title: Text('Registro de usuario'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(left: 5, top: 10)),
            Container(
              width: 500,
              height: 70,
              child: Image.asset('image/img.png'),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: TextField(
                controller: nombreUser,
                autofocus: true,
                //controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Nombres',
                  hintText: 'Digite su nombre y apellido',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: TextField(
                controller: identity,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Identificación',
                  hintText: 'Digite número de identificación',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: TextField(
                controller: correo,
                keyboardType: TextInputType.emailAddress,
                //controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Correo',
                  hintText: 'Digite su Correo',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: TextField(
                controller: tele,
                keyboardType: TextInputType.number,
                //controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Teléfono',
                  hintText: 'Digite su teléfono',
                ),
              ),
            ),
            /*  Focus(
                child: TextField(
                  controller: fecha,
                  style: TextStyle(color: Colors.blueGrey),
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Fecha',
                    hintText: 'Digite la fecha de nacimiento',
                    // print('2:  $hasFocus');
                  ),
                ),
                onFocusChange: (hasFocus) {
                  //    print('$hasFocus');
                  if (hasFocus == true) {
                    //  flag=true;
                    print(hasFocus);
                    //callDataPcker();
                    print(_currentSelectedDate.toString());
                    fecha.text = _currentSelectedDate.toString();
                    //   hasFocus=false;
                  }
                  ;
                }),
           */
            Padding(
                padding: EdgeInsets.only(left: 15, top: 10, right: 15),
                child: Stack(
                    alignment: const Alignment(1.0, 1.0),
                    children: <Widget>[
                      new TextField(
                        enabled: false,
                        controller: fecha,
                        style: TextStyle(color: Colors.blueGrey),
                        decoration: InputDecoration(
                          fillColor: Colors.green,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10)),
                          labelText: 'Fecha de nacimiento',
                          hintText: 'Digite la fecha de nacimiento',
                        ),
                      ),
                      new FlatButton(
                          onPressed: () {
                            callDataPcker();
                          },
                          child: new Icon(Icons.date_range))
                    ])),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: Stack(
                alignment: const Alignment(1.0, 1.0),
                children: [
                  TextField(
                    controller: pass,
                    keyboardType: TextInputType.multiline,
                    obscureText: passHide,
                    //controller: user,
                    style: TextStyle(color: Colors.blueGrey),
                    decoration: InputDecoration(
                      fillColor: Colors.green,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      labelText: 'Contraseña',
                      hintText: 'Digite su contraseña',
                    ),
                  ),
                  new FlatButton(

                      onPressed: (){setState(() {
                        if (passHide){
                          passHide=false;
                          ojo=Icons.visibility_off;
                        }
                      else{
                        passHide=true;
                        ojo=Icons.visibility;
                        }
                      }); }
                      , child: new Icon(ojo))
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, top: 10, right: 15),
              child: ElevatedButton(

                style: ElevatedButton.styleFrom(
                  primary: Colors.black45,
                  minimumSize: Size(400, 50)
                ),
                onPressed: () {
                  inserDatatUser();
                },
                child: Text('Enviar'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
