

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prueba3/main.dart';
import 'package:prueba3/pages/login.dart';
 
import 'package:firebase_database/firebase_database.dart';

void main() {
  runApp(Registro());
}
 
class Registro extends StatelessWidget {
  const Registro({super.key});
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Firebase',
      theme: ThemeData.dark(),
      home: Home(),
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
        title: const Text('registro'),
      ),
      body: Body(context),
    );
  }
}
 
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
 
final TextEditingController userController = TextEditingController();
final TextEditingController idController = TextEditingController();


Widget Body(context) {
  return Scaffold(
    body: Container(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Registro',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'id',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: userController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'nickname',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'Correo Electrónico',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  hintText: 'Contraseña',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                login(context);
                guardar();
                  print('Ir a la pantalla de cartelera');
                },
                child: const Text(
                  'Registrar',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Registro(),
                    ),
                  );
                  print('Ir a la pantalla de registro');
                },
                child: const Text(
                  '¿No tienes una cuenta?  Regístrate aquí',
                  style: TextStyle(
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
 
Widget BotonVolver(context) {
  return (ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => inicio()));
      },
      child: const Text('Ir a login')));
}
 
 
Future<void> login(context) async {
 try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: emailController.text,
    password: passwordController.text,
  );
   Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Loginscreen(),
                    ),
                  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
}


void guardar() async{
  DatabaseReference ref = FirebaseDatabase.instance.ref("usuarios/"+idController.text);

 await ref.set({
  "id": idController.text,
  "correo": emailController.text,
  "nike": userController.text,
    
  
});
 }