import 'package:flutter/material.dart';

class Pizza extends StatelessWidget {
  const Pizza({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 27, 156, 133),
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
                    'images/p.png',
                    //fit: BoxFit.cover,
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
                  child: Column(children: [
                    Column(
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
                                  Text('3 min',
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
                                  Text('5.0',
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
                                'Pizza Vegana',
                                style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 27, 156, 133),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, top: 10.0, right: 15.0),
                          child: Text(
                            'Essa massa é a base para montar quais sabores de pizza você quiser!',
                            style: TextStyle(
                              fontSize: 16,
                            ),
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
                            'Massa:\n\n• ½ xícara (120 ml) de água morna\n• 1 colher de chá de fermento biológico\n• 1 colher de sopa de farinha de trigo\n• 1//2 colher de sopa de açúcar\n• 1/4 de colher de chá de sal\n• 1 xícara (240 ml/ 120 gramas) de farinha de trigo branca\n• ¼ de xícara (4 colheres de sopa) de farinha de trigo integral (pode substituir por farinha branca)\n\nMolho:\n\n• 2 dentes de alho amassados ou picados bem fininhos\n• 2 colheres de sopa de azeite de oliva\n• 1 lata (400 ml) de tomates picados sem temperos\n• 1 colher de sopa de pasta de tomate concentrada\n• 1 colher de chá rasa de sal\n• 1 colher de chá rasa de açúcar\n• 1 colher de chá de orégano e manjericão seco\n• 200 ml de água\n\nQueijo:\n\n400 ml de leite de coco\n• 4 colheres de sopa de polvilho doce\n• 3 colheres de sopa de levedura nutricional (opcional)\n• 1 colher de chá de sal\n• 1 colher de chá de páprica doce ou defumada\n• 1 colher de chá de alho em pó',
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
