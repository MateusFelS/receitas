import 'package:flutter/material.dart';

class Bauru extends StatelessWidget {
  const Bauru({super.key});

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
                    'images/b.png',
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
                                'Bauru Vegano',
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
                            'Um salgado de rua sempre salva quando bate a fome.',
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
                            'Massa:\n\n• 1 e 1/2 xícaras de água\n• 2 colheres de sopa de fermento biológico seco\n• 2 colheres de sopa de açúcar\n• 1/2 colher de sopa de sal\n• 1/2 xícara de óleo\n• 500 gramas de farinha de trigo (pode ser que precise de mais)\n\nCatupiry de Castanha:\n\n• 1/2 xícaras de castanha de caju deixada de molho\n• 1 xícara de água\n• Suco de um limão\n• 1 dente de alho\n• 1 colher de sopa de azeite\n• Sal e pimenta\n• 2 colher de sopa de tapioca ou de polvilho azedo\n\nMistura para pincelar:\n\n1 colher de sopa de melado de cana ou cúrcuma\n• 1 colher de sopa de azeite\n• 2 colheres de sopa de água',
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
