import 'package:flutter/material.dart';

class PaoBatata extends StatelessWidget {
  const PaoBatata({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 77, 196, 168),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * .5,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'images/pao_batata_2.png',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Icon(
                                  Icons.waving_hand,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                SizedBox(height: 10),
                                Text('Fácil',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.timer,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                SizedBox(height: 10),
                                Text('30 min',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              ],
                            ),
                            Column(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                SizedBox(height: 10),
                                Text('4.8',
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Pão de Batata',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 77, 196, 168),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20.0, top: 10.0, right: 15.0),
                        child: Text(
                          'Esse recheado vai fazer você esquecer\naqueles salgados de padaria!',
                          style: TextStyle(
                            fontSize: 16,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, top: 20.0, right: 15.0),
                        child: Text(
                          'Ingredientes',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, top: 20.0, right: 15.0),
                        child: Text(
                          'Massa:\n\n• 3 xícaras (chá) de batata picada em cubos pequenos\n• 15 gramas de fermento biológico fresco\n• 1 colher (sopa) de açúcar cristal\n• 120 ml de água morna\n• 1 colher (chá) de sal\n• 60 ml de Óleo de girassol\n• 4 1/2 xícaras (chá) de farinha de trigo\n• 1 colher (sopa) de azeite\n• 1 colher (sopa) de shoyu\n• gergelim branco a gosto\n\nRecheio:\n\n• 2 dentes de alho picados\n• 1/2 unidade de cebola média picada\n• 5 xícaras (chá) de brócolis\n• 1 colher (sopa) de orégano\n• 1/2 xícara (chá) de leite de amêndoas\n• 1 colher (sopa) de amido de milho\n• sal a gosto',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
