import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:VeggieDelight/views/home/home.dart';
import 'package:VeggieDelight/views/auth/signup.dart';
import 'package:VeggieDelight/services/firebase_auth_services.dart';

Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 27, 156, 133),
    Color.fromARGB(255, 27, 133, 156)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final FirebaseAuthServices _auth = FirebaseAuthServices();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  bool _signinError = false;

  @override
  void dispose() {
    _emailController.dispose();
    _senhaController.dispose();
    super.dispose();
  }

  void _signin() async {
    String email = _emailController.text;
    String senha = _senhaController.text;

    User? user = await _auth.signIn(email, senha);

    if (user != null) {
      print("Usuario logado com sucesso!");
      String currentUserUid = user.uid;
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (BuildContext context) => Home(idUsuario: currentUserUid),
        ),
      );
    } else {
      print("Ocorreu algum erro!");
      setState(() {
        _signinError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 156, 133),
        title: Text(
          "Login",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Card(
              elevation: 5,
              shadowColor: Colors.grey.withOpacity(1),
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Faça seu login',
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
                          image: AssetImage('images/login_icon.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    TextField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: "Email"),
                    ),
                    SizedBox(height: 16.0),
                    TextField(
                      controller: _senhaController,
                      obscureText: true,
                      decoration: InputDecoration(labelText: "Senha"),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        _signin();
                      },
                      child: Text(
                        'Fazer Login',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 27, 156, 133),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize:
                            Size(MediaQuery.of(context).size.width * .9, 50),
                      ),
                    ),
                    SizedBox(height: 10),
                    _signinError
                        ? Text(
                            'Email ou senha incorretos!',
                            style: TextStyle(color: Colors.red),
                          )
                        : SizedBox(),
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      ),
                      child: Text(
                        'Não possui cadastro? Clique aqui!',
                        style: TextStyle(
                          color: Color.fromARGB(255, 27, 156, 133),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
