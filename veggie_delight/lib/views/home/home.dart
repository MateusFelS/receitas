import 'package:VeggieDelight/views/help_and_contacts/info_veg.dart';
import 'package:VeggieDelight/views/auth/signin.dart';
import 'package:VeggieDelight/views/help_and_contacts/about_us.dart';
import 'package:VeggieDelight/widget/app_bottom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:VeggieDelight/views/recipies_management/recipies_list.dart';

Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 27, 156, 133),
    Color.fromARGB(255, 27, 133, 156)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class Home extends StatefulWidget {
  final String idUsuario;

  Home({required this.idUsuario});

  @override
  State<Home> createState() => _HomeState();
}

enum TipoFiltro { SobreNos, InfoVeg, Sair }

class _HomeState extends State<Home> {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  void _onPopupMenuItemSelected(TipoFiltro result) {
    switch (result) {
      case TipoFiltro.SobreNos:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutUs()),
        );
        break;
      case TipoFiltro.InfoVeg:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoVeg()),
        );
        break;
      case TipoFiltro.Sair:
        _auth.signOut();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => SignIn()),
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'VeggieDelight',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 27, 156, 133),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: PopupMenuButton<TipoFiltro>(
              icon: Row(
                children: [
                  Icon(
                    Icons.keyboard_double_arrow_right,
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.menu,
                    color: Colors.white,
                  ),
                ],
              ),
              onSelected: _onPopupMenuItemSelected,
              itemBuilder: (BuildContext context) =>
                  <PopupMenuEntry<TipoFiltro>>[
                PopupMenuItem<TipoFiltro>(
                  value: TipoFiltro.SobreNos,
                  child: Text('Sobre Nós'),
                ),
                PopupMenuItem<TipoFiltro>(
                  value: TipoFiltro.InfoVeg,
                  child: Text('InfoVeg'),
                ),
                PopupMenuItem<TipoFiltro>(
                  value: TipoFiltro.Sair,
                  child: Text('Sair'),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30.0, left: 30.0),
                  child: Text(
                    'O que você quer cozinhar hoje?',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()..shader = linearGradient,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
                  child: TextField(
                    decoration: const InputDecoration(
                      hintText: 'Receitas',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(40.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 30.0),
                  child: const Text(
                    'Receitas populares',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 27, 156, 133),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildRecipeContainer(
                            'Pão de Batata', 'images/pao_batata.jpg'),
                        SizedBox(width: 10),
                        buildRecipeContainer(
                            'Pizza Vegana', 'images/pizza.jpg'),
                        SizedBox(width: 10),
                        buildRecipeContainer(
                            'Bauru Vegano', 'images/bauru.jpg'),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 30.0),
                  child: const Text(
                    'Novas Receitas',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 27, 156, 133),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildRecipeContainer(
                            'Ratatouille', 'images/ratatouille.jpg'),
                        SizedBox(width: 10),
                        buildRecipeContainer('Lasanha', 'images/lasanha.jpg'),
                        SizedBox(width: 10),
                        buildRecipeContainer(
                            'Purê de Abóbora', 'images/pure_abobora.jpg'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RecipiesList(
                                idUsuario: widget.idUsuario,
                              )),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 27, 156, 133),
                            Color.fromARGB(255, 27, 133, 156),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      height: 50,
                      width: MediaQuery.of(context).size.width * .9,
                      child: Center(
                        child: Text(
                          'Receitas da Comunidade',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomTabs(idUsuario: widget.idUsuario),
    );
  }

  Widget buildRecipeContainer(String recipeName, String imagePath) {
    return GestureDetector(
      child: Container(
        height: 150,
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Colors.black.withOpacity(0.5),
              child: Text(
                recipeName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
