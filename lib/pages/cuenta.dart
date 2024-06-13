

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:prueba3/pages/hsitorial.dart';


class cuenta extends StatelessWidget {
  const cuenta({Key? key}) : super(key: key); // Corrección del constructor
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      theme: ThemeData.dark(),
      home: Lista(),
    );
  }
}

class Lista extends StatefulWidget {
  @override  _ListaState createState() => _ListaState();
}

class _ListaState extends State<Lista> {
  List<Map<dynamic, dynamic>> productList = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() {
    /////////////////////////////////////////
    /// Función con el objetivo de traer los datos
    /////////////////////////////////////////
    
    DatabaseReference productoRef = FirebaseDatabase.instance.ref('usuarios');
    productoRef.onValue.listen((DatabaseEvent event) {
      final data = event.snapshot.value;
      updateProductList(data);
    });
    
  }

  void updateProductList(dynamic data) {
    if (data != null) {
      List<Map<dynamic, dynamic>> tempList = [];
      data.forEach((key, value) {
        //////////////////////////////////////////
        /// Se asigna la clave y valor a la lista temporal
        //////////////////////////////////////////
        
        tempList.add({"ID": value['id'],"producto": value['correo'], "nike": value['nike']});
        
      });

      setState(() {
        productList = tempList;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase ListView'),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            //////////////////////////////////////
            /// Se manda a imprimir los valores solicitados
            //////////////////////////////////////
            //title: Text('${productList[index]["id"]}'),
            title: Text('${productList[index]["producto"]}'),
            subtitle:Text('${productList[index]["nike"]}') ,
            
          );
        },
        
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => historial()), 
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}



