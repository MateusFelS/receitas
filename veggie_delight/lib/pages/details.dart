import 'dart:typed_data';
import 'package:flutter/material.dart';

class Details extends StatefulWidget {
  final String idUsuario;
  final Map<String, dynamic> receita;

  Details({
    required this.receita,
    required this.idUsuario,
  });

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Detalhes',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 77, 196, 168),
      ),
      backgroundColor: Color.fromARGB(255, 77, 196, 168),
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: Image(
                    image: AssetImage('images/logo_receitas.png'),
                  ),
                  // Chama o método para exibir a imagem da receita
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
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 30.0,
                                top: 30.0,
                                right: 30.0,
                                bottom: 10.0),
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
                                    Text(
                                      widget.receita['dificuldade'].toString(),
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.black),
                                    ),
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
                                    Text(
                                        '${widget.receita['tempoPreparo'].toString()} min',
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
                                    Text(widget.receita['nota'].toString(),
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.black)),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16, left: 15, bottom: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  widget.receita['nome'].toString(),
                                  style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 77, 196, 168),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.cookie,
                                      color: Colors.brown,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Ingredientes:',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List<Widget>.generate(
                                      widget.receita['ingredientes'].length,
                                      (index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 5.0,
                                        ),
                                        child: Text(
                                          widget.receita['ingredientes'][index],
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 10.0, top: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.menu_book_rounded,
                                      color: Colors.blueGrey,
                                    ),
                                    SizedBox(width: 10),
                                    Text(
                                      'Modo de preparo:',
                                      style: TextStyle(
                                        fontSize: 22,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 30.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: List<Widget>.generate(
                                      widget.receita['modoPreparo'].length,
                                      (index) => Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 5.0),
                                        child: Text(
                                          widget.receita['modoPreparo'][index],
                                          style: TextStyle(
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        color: Color.fromARGB(255, 77, 196, 168),
                      ),
                      Container(
                        height: 200,
                        width: MediaQuery.of(context).size.width * 0.9,
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'Nenhum comentário ainda, seja o primeiro!',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Digite seu comentário',
                                  border: InputBorder.none,
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 16),
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                // Lógica para enviar o comentário
                              },
                              icon: Icon(Icons.send, color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 10),
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
