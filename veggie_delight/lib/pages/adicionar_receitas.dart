import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:VeggieDelight/pages/recipes.dart';

Shader linearGradient = LinearGradient(
  colors: <Color>[
    Color.fromARGB(255, 27, 156, 133),
    Color.fromARGB(255, 27, 133, 156)
  ],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

class AdicionarReceita extends StatefulWidget {
  final String idUsuario;

  AdicionarReceita({required this.idUsuario});

  @override
  _AdicionarReceitaState createState() => _AdicionarReceitaState();
}

class _AdicionarReceitaState extends State<AdicionarReceita> {
  final TextEditingController _nomeController = TextEditingController();
  String _selectedDificuldade = 'Fácil';
  String _selectedNota = '1';
  final TextEditingController _tempoPreparoController = TextEditingController();
  final TextEditingController _ingredientesController = TextEditingController();
  final TextEditingController _modoPreparoController = TextEditingController();

  String _tipoReceita = 'Vegana';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 27, 156, 133),
        title: Text(
          'Adicionar Receita',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Adicione sua receita',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    foreground: Paint()..shader = linearGradient,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('images/girl.png'),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _nomeController,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                  ),
                ),
                SizedBox(height: 10),
                Text('Tipo de Receita'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownButton<String>(
                      value: _tipoReceita,
                      onChanged: (String? newValue) {
                        setState(() {
                          _tipoReceita = newValue!;
                        });
                      },
                      items: <String>['Vegana', 'Vegetariana']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text('Dificuldade'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownButton<String>(
                      value: _selectedDificuldade,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedDificuldade = newValue!;
                        });
                      },
                      items: <String>['Fácil', 'Médio', 'Difícil']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text('Nota'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    DropdownButton<String>(
                      value: _selectedNota,
                      onChanged: (String? newValue) {
                        setState(() {
                          _selectedNota = newValue!;
                        });
                      },
                      items: <String>['1', '2', '3', '4', '5']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  controller: _tempoPreparoController,
                  decoration: InputDecoration(
                    labelText: 'Tempo de preparo (min)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: _ingredientesController,
                  decoration: InputDecoration(
                    labelText: 'Ingredientes',
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                TextField(
                  controller: _modoPreparoController,
                  decoration: InputDecoration(
                    labelText: "Modo de preparo",
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    insertData();
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (BuildContext context) =>
                            Recipes(idUsuario: widget.idUsuario),
                      ),
                    );
                  },
                  child: Text(
                    'Adicionar Receita',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 27, 156, 133),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize: Size(MediaQuery.of(context).size.width * .9,
                        50), // tamanho mínimo
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> insertData() async {
    try {
      // Caso nenhuma imagem tenha sido selecionada
      await FirebaseFirestore.instance.collection('receitas').add({
        "nome": _nomeController.text,
        "dificuldade": _selectedDificuldade,
        "tempoPreparo": int.parse(_tempoPreparoController.text),
        "nota": int.parse(_selectedNota),
        "ingredientes": _ingredientesController.text.split('\n'),
        "modoPreparo": _modoPreparoController.text.split('\n'),
        "tipoReceita": _tipoReceita,
        "id_usuario": widget.idUsuario,
      });

      print("Data inserted successfully");
    } catch (e) {
      print("Error inserting data: $e");
    }
  }
}
