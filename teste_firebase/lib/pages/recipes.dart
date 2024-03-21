import 'package:VeggieDelight/pages/info_veganismo.dart';
import 'package:VeggieDelight/pages/sobre_nos.dart';
import 'package:flutter/material.dart';
import 'package:VeggieDelight/pages/lista_receitas.dart';
import 'package:VeggieDelight/templates/pao_batata.dart';
import 'package:VeggieDelight/templates/pizza.dart';
import 'package:VeggieDelight/templates/bauru.dart';

Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 27, 156, 133),
    Color.fromARGB(255, 27, 133, 156)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class Recipes extends StatefulWidget {
  final String idUsuario;

  Recipes({required this.idUsuario});

  @override
  State<Recipes> createState() => _RecipesState();
}

enum TipoFiltro { SobreNos, InfoVeg }

class _RecipesState extends State<Recipes> {
  TipoFiltro _filtroSelecionado = TipoFiltro.SobreNos;

  void _onPopupMenuItemSelected(TipoFiltro result) {
    switch (result) {
      case TipoFiltro.SobreNos:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SobreNos()),
        );
        break;
      case TipoFiltro.InfoVeg:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => InfoVeganismo()),
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
          PopupMenuButton<TipoFiltro>(
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            onSelected: _onPopupMenuItemSelected,
            itemBuilder: (BuildContext context) => <PopupMenuEntry<TipoFiltro>>[
              PopupMenuItem<TipoFiltro>(
                value: TipoFiltro.SobreNos,
                child: Text('Sobre Nós'),
              ),
              PopupMenuItem<TipoFiltro>(
                value: TipoFiltro.InfoVeg,
                child: Text('InfoVeg'),
              ),
            ],
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
                        buildRecipeContainer('Pão de Batata',
                            'images/pao_batata.jpg', PaoBatata()),
                        SizedBox(width: 10),
                        buildRecipeContainer(
                            'Pizza Vegana', 'images/pizza.jpg', Pizza()),
                        SizedBox(width: 10),
                        buildRecipeContainer(
                            'Bauru Vegano', 'images/bauru.jpg', Bauru()),
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
                          builder: (context) => ListaReceitas(
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
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRecipeContainer(
      String recipeName, String imagePath, Widget route) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route),
      ),
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
              child: Text(
                recipeName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
