import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:VeggieDelight/pages/login.dart';
import 'package:VeggieDelight/services/firebase_auth_services.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _signup() async {
    String nome = _nomeController.text;
    String email = _emailController.text;
    String senha = _senhaController.text;

    User? user = await _auth.signUp(nome, email, senha);

    if (user != null) {
      print("Usuario criado com sucesso!");
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => Login(),
        ),
      );
    } else {
      print("Ocorreu algum erro!");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 156, 133),
        title: Text(
          'Registro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            elevation: 5,
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Crie sua conta',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient,
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        image: AssetImage('images/registro_icon.png'),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: _nomeController,
                    decoration: InputDecoration(
                      labelText: 'Nome',
                    ),
                  ),
                  TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                    ),
                  ),
                  TextField(
                    controller: _senhaController,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Senha',
                    ),
                    keyboardType: TextInputType.number,
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      _signup();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) => Login(),
                        ),
                      );
                    },
                    child: Text(
                      'Finalizar Registro',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 27, 156, 133),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      minimumSize: Size(MediaQuery.of(context).size.width * .9,
                          50), // tamanho mínimo
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
