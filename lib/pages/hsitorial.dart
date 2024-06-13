import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba3/pages/cuenta.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp (historial());
}

class historial extends StatelessWidget {
  const historial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "inicio",
      debugShowCheckedModeBanner: false,
      home:Home(),
    );
  }

}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

   int idice=0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens=[
      //Aplicacion3();
      Cuerpo(context),
      
      cuenta(),
      
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inico'),
      ),
      body:
      screens[idice],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: idice,
        onTap: (valor){
          setState(() {
            idice=valor;
          });
        },
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.account_circle_outlined),label: "historial"),
        BottomNavigationBarItem(icon: Icon(Icons.home),label: "Cuenta"),
         
       // BottomNavigationBarItem(icon:Image.network("",scale: 10,),label: "scresn 3 ")
      ],),
    );
  }
}

Widget Cuerpo(context) {
  return Scaffold(
    body: SingleChildScrollView(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Transacción 1",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text("Tipo: Retiro"),
                  Text("Monto: \$30"),
                  Text("Saldo: \$450"),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0), // Separador entre tarjetas
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Transacción 2",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text("Tipo: Impuestos"),
                  Text("Monto:23"),
                  Text("Saldo: -55"),
                ],
              ),
            ),
          ),
          SizedBox(height: 20.0), // Separador entre tarjetas
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Transacción 3",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Text("Tipo: Descuento"),
                  Text("Monto: 56"),
                  Text("Saldo: 100"),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}



