import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prueba3/pages/hsitorial.dart';
import 'package:prueba3/pages/login.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp (inicio());
}

class inicio extends StatelessWidget {
  const inicio({super.key});

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inico'),
      ),
      body:
      Cuerpo(context),
    );
  }
}

Widget Cuerpo(context) {
  return Scaffold(
    body: Stack(
      fit: StackFit.expand,
      children: [
        Image.network(
          "https://i.pinimg.com/originals/3f/03/e5/3f03e5461c4fecdf2c05c5b7d9cff178.png",
          fit: BoxFit.cover,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("MATEO DAVID IMBAQUINGO CRESPO",
              style: TextStyle(color: Colors.red,fontSize: 25)),
            Text("Git:Mrteo444",
              style: TextStyle(color: Colors.red,fontSize: 25)),
            Boton1(context),
          ],
        ),
      ],
    ),
  );
}

Widget Boton1( context ){
  return ( 
    ElevatedButton(onPressed: () {
      mostrarAlerta02(context);
    }, child: Text("Alerta 02"))
  );
}


void mostrarAlerta02(context) {
  showDialog(
    context: context,
    builder: (context) {
      return Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage("https://i.pinimg.com/originals/3f/03/e5/3f03e5461c4fecdf2c05c5b7d9cff178.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: AlertDialog(
          title: Text("Bienvenido"),
          content: Text("¿Ir a al login?"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Loginscreen()));
              },
              child: Text("Si"),
            ),
            TextButton(
              onPressed: () {
                print("Aquí va otro función");
                Navigator.pop(context);
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                print("Aquí va otra función");
                Navigator.pop(context);
              },
              child: Text("Cancelar"),
            ),
          ],
        ),
      );
    },
  );
}