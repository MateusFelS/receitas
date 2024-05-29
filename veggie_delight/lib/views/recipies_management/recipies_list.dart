import 'package:VeggieDelight/widget/app_bottom.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VeggieDelight/views/recipies_management/details.dart';
import 'package:VeggieDelight/views/recipies_management/my_recipies.dart';
import 'package:VeggieDelight/views/recipies_management/add_recipies.dart';

Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 27, 156, 133),
    Color.fromARGB(255, 27, 133, 156)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class RecipiesList extends StatefulWidget {
  final String idUsuario;

  RecipiesList({required this.idUsuario});

  @override
  State<RecipiesList> createState() => _RecipiesListState();
}

enum TipoFiltro { Todos, Vegana, Vegetariana }

class _RecipiesListState extends State<RecipiesList> {
  TipoFiltro _filtroSelecionado = TipoFiltro.Todos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Receitas',
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
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) => MyRecipies(
                      idUsuario: widget.idUsuario,
                    ),
                  ),
                );
              },
              child: Icon(
                Icons.receipt,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 16),
          Text(
            'Receitas da Comunidade',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              foreground: Paint()..shader = linearGradient,
            ),
          ),
          SizedBox(height: 10),
          Image(
            image: AssetImage('images/receitas.png'),
            height: 80,
            width: MediaQuery.of(context).size.width,
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _filtroSelecionado = TipoFiltro.Todos;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    _filtroSelecionado == TipoFiltro.Todos
                        ? Color.fromARGB(255, 27, 156, 133)
                        : Colors.grey,
                  ),
                ),
                child: Text(
                  'Todos',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _filtroSelecionado = TipoFiltro.Vegana;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    _filtroSelecionado == TipoFiltro.Vegana
                        ? Color.fromARGB(255, 27, 156, 133)
                        : Colors.grey,
                  ),
                ),
                child: Text(
                  'Vegana',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _filtroSelecionado = TipoFiltro.Vegetariana;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    _filtroSelecionado == TipoFiltro.Vegetariana
                        ? Color.fromARGB(255, 27, 156, 133)
                        : Colors.grey,
                  ),
                ),
                child: Text(
                  'Vegetariana',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder<QuerySnapshot>(
              future: FirebaseFirestore.instance.collection('receitas').get(),
              builder: (ctx, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      'Erro ao carregar dados',
                      style: TextStyle(color: Colors.red),
                    ),
                  );
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Center(
                    child: Text(
                      'Nenhuma receita encontrada.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                List<QueryDocumentSnapshot> receitasFiltradas = [];

                // Filtrar as receitas de acordo com o filtro selecionado
                if (_filtroSelecionado == TipoFiltro.Todos) {
                  receitasFiltradas = snapshot.data!.docs;
                } else {
                  receitasFiltradas = snapshot.data!.docs.where((doc) {
                    final data = doc.data() as Map<String, dynamic>;
                    if (_filtroSelecionado == TipoFiltro.Vegana) {
                      return data['tipoReceita'] == 'Vegana';
                    } else {
                      return data['tipoReceita'] == 'Vegetariana';
                    }
                  }).toList();
                }

                return Column(
                  children: [
                    SizedBox(height: 10),
                    Expanded(
                      child: Items(
                        list: receitasFiltradas,
                        idUsuario: widget.idUsuario,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Faça sua parte, adicione uma receita! 😊',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 80),
                  ],
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 27, 156, 133),
        child: Icon(
          Icons.soup_kitchen,
          color: Colors.white,
          size: 30,
        ),
        onPressed: () async {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddRecipies(
                idUsuario: widget.idUsuario,
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: AppBottomTabs(idUsuario: widget.idUsuario),
    );
  }
}

class Items extends StatelessWidget {
  final List<QueryDocumentSnapshot> list;
  final String idUsuario;

  Items({required this.list, required this.idUsuario});

  Future<String> getUserName(String userId) async {
    try {
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(userId)
          .get();
      if (userSnapshot.exists) {
        return userSnapshot['nome'];
      } else {
        return 'Nome do usuário não encontrado';
      }
    } catch (e) {
      print('Erro ao buscar o nome do usuário: $e');
      return 'Erro ao buscar o nome do usuário';
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (ctx, i) {
        final receita = list[i].data() as Map<String, dynamic>;
        return FutureBuilder<String>(
          future: getUserName(receita['id_usuario']),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return Text('Erro: ${snapshot.error}');
            } else {
              final userName = snapshot.data!;
              return Column(
                children: [
                  Container(
                    width: 290,
                    margin: EdgeInsets.symmetric(horizontal: 8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: [
                              Color.fromARGB(255, 27, 156, 133),
                              Color.fromARGB(255, 27, 133, 156)
                            ],
                            stops: [0.0, 1.0],
                          ).createShader(bounds);
                        },
                        child: Text(
                          receita['nome'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.waving_hand,
                                color: Colors.red,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Dificuldade: ${receita['dificuldade'] ?? '--'}',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.access_time,
                                color: Colors.black,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Tempo de Preparo: ${receita['tempoPreparo'] ?? '--'} minutos',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Nota: ${receita['nota'] ?? '--'}',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Icon(
                                Icons.emoji_emotions_outlined,
                                color: Colors.teal[600],
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Criada por: $userName',
                                style: TextStyle(
                                  color: Colors.grey[800],
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('(Clique para mais detalhes)',
                                  style: TextStyle(fontSize: 10)),
                            ],
                          ),
                        ],
                      ),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (BuildContext context) => Details(
                              receita: receita,
                              idUsuario: idUsuario,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            }
          },
        );
      },
    );
  }
}
