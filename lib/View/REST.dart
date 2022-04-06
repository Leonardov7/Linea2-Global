import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart';

class REST extends StatefulWidget {
  @override
  RESTApp createState() => RESTApp();
}

class RESTApp extends State<REST> {
  TextEditingController id=TextEditingController();
  TextEditingController nombre=TextEditingController();
  TextEditingController correo=TextEditingController();
  TextEditingController username=TextEditingController();
  var dataHttp='';

  consumirGet(var id) async {
    Response response =
        await get(Uri.parse('https://jsonplaceholder.typicode.com/users/'+id));
    Map data = jsonDecode(response.body);
    //print('NAME: ${data['name']} /// username: ${data['username']}');
   // print(data);
    print(response.statusCode.toString()+ " Código de respuesta");
    if (response.statusCode.toString()=='200'){
      nombre.text='${data['name']}';
      correo.text='${data['email']}';
      username.text='${data['username']}';

    }

  }
consumirPost()async{
  Response response = await post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      body: {'title': 'Post Title', 'body': 'Lorem ipsum', 'userId': '1'}
  );
  Map data = jsonDecode(response.body);
  print(data);
  dataHttp= await response.body.toString();
}
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: Text('Consumir servicio'),
        backgroundColor: Colors.black45,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  controller: id,
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'ID',
                    hintText: 'Digite id de usuario',
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
                    consumirGet(id.text);
                  },
                  child: Text('GET'),

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
                    consumirPost();
                  },
                  child: Text('POST'),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  enabled: false,
                  controller: nombre,
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Nombre',
                    hintText: 'Nombre',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  enabled: false,
                  controller: correo,
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'Correo',
                    hintText: 'Correo',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  enabled: false,
                  controller: username,
                  decoration: InputDecoration(
                    fillColor: Colors.green,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)),
                    labelText: 'UserName',
                    hintText: 'UserName',
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10),
              child: Text("Data "+dataHttp))
            ],
          ),
        ),
      ),
    );
  }
}
