import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VeggieDelight/pages/recipes.dart';

Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 27, 156, 133),
    Color.fromARGB(255, 27, 133, 156)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class MinhasReceitas extends StatelessWidget {
  final String idUsuario;

  MinhasReceitas({required this.idUsuario});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Minhas Receitas',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 27, 156, 133),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('receitas')
            .where('id_usuario', isEqualTo: idUsuario)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar dados',
                style: TextStyle(color: Colors.red),
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text(
                'Nenhuma receita encontrada.',
                style: TextStyle(color: Colors.grey),
              ),
            );
          }
          return Column(
            children: [
              SizedBox(height: 16),
              Text(
                'Gerencie suas Receitas',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient,
                ),
              ),
              SizedBox(height: 10),
              Image(
                image: AssetImage('images/minhas_receitas.png'),
                height: 100,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 10),
              Expanded(
                child: Items(
                  list: snapshot.data!.docs,
                  idUsuario: idUsuario,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Items extends StatelessWidget {
  final List<QueryDocumentSnapshot> list;
  final String idUsuario;

  Items({required this.list, required this.idUsuario});

  void delete(String docId) {
    FirebaseFirestore.instance.collection('receitas').doc(docId).delete();
  }

  void confirm(BuildContext context, String docId) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            'Tem certeza?',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          actions: [
            MaterialButton(
              onPressed: () {
                delete(docId);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext) => Recipes(
                      idUsuario: idUsuario,
                    ),
                  ),
                );
              },
              child: Text(
                'Deletar',
                style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 27, 133, 156),
                    fontWeight: FontWeight.bold),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancelar',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: list.length,
      itemBuilder: (ctx, i) {
        final receita = list[i].data() as Map<String, dynamic>;
        final docId = list[i].id;
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
                    // Dificuldade
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
                    // Tempo de Preparo
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
                    // Nota
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Deseja deletar? Clique aqui ->',
                            style: TextStyle(fontSize: 10)),
                        GestureDetector(
                          onTap: () {
                            confirm(context, docId);
                          },
                          child: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
