import 'package:flutter/material.dart';
import 'package:VeggieDelight/pages/login.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 156, 133),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 30.0),
              child: Text(
                'VeggieDelight',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0, left: 50.0),
              child: Text(
                'Deliciosas e detalhadas receitas de restaurantes no seu celular',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/girl.png'),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              ),
              child: Container(
                child: Center(
                  child: Text(
                    'Vamos lá',
                    style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 27, 156, 133),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                height: 50,
                width: MediaQuery.of(context).size.width * .8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
