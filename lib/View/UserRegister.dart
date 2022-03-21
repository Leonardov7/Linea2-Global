import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserRegister extends StatefulWidget {
  @override
  UserRegisterApp createState() => UserRegisterApp();
}

class UserRegisterApp extends State<UserRegister> {
  DateTime selectedDate = DateTime.now();
  TextEditingController fecha = TextEditingController();
  var _currentSelectedDate;

  void callDataPcker() async {
    var selectedDate = await getDatePickerWidget();
    setState(() {
      _currentSelectedDate = selectedDate;
      fecha.text=selectedDate.toString();
    });
  }

  Future<DateTime?> getDatePickerWidget() {
    return showDatePicker(
        context: context,
        initialDate: DateTime(2022),
        firstDate: DateTime(1930),
        lastDate: DateTime.now(),
        fieldHintText: "DIA/MES/AÑO",
        fieldLabelText: "FECHA DE NACIMIENTO",
        helpText: "FECHA DE NACIMIENTO",
        errorFormatText: "Ingrese una fecha válida",
        errorInvalidText: "Fecha fuera de rango",
        initialEntryMode: DatePickerEntryMode.input,
        builder: (context, child) {
          return Theme(data: ThemeData.fallback(), child: Center(child: child));
        });
  }

  var flag = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              padding: EdgeInsets.only(left: 15,top: 10,right: 15),
              child: TextField(
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
              padding: EdgeInsets.only(left: 15,top: 10,right: 15),
              child: TextField(
                //controller: user,
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
              padding: EdgeInsets.only(left: 15,top: 10,right: 15),
              child: TextField(
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
              padding: EdgeInsets.only(left: 15,top: 10,right: 15),
              child: TextField(
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
                padding: EdgeInsets.only(left: 15,top: 10,right: 15),
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
                          labelText: 'Fecha',
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
              padding: EdgeInsets.only(left: 15,top: 10,right: 15),
              child: TextField(
                //onFocusChange: (hasFocus) {
                //print('2:  $hasFocus');
                //},
                // onChanged: (Text) {
                // callDataPcker();
                //},
                //controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Fecha de nacimiento',
                  hintText: 'Digite su nombre',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15,top: 10,right: 15),
              child: TextField(
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
            ),
            Padding(
              padding: EdgeInsets.only(left: 15,top: 10,right: 15),
              child: TextField(
                //controller: user,
                style: TextStyle(color: Colors.blueGrey),
                decoration: InputDecoration(
                  fillColor: Colors.green,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'Confirmación de contraseña',
                  hintText: 'Confirme la contraseña',
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 15,top: 10,right: 15),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(minimumSize: Size(400, 50)),
              onPressed: (){

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
