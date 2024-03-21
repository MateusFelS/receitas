import 'package:flutter/material.dart';

class SobreNos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sobre Nós',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // Cor branca para o título
          ),
        ),
        backgroundColor: Color.fromARGB(255, 27, 156,
            133), // Cor verde personalizada para a barra de navegação
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Card(
              elevation: 5, // Adicionando elevação ao Card
              shadowColor: Colors.grey.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white, // Cor de fundo do container
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(75),
                          border: Border.all(
                            color: Color.fromARGB(255, 27, 156, 133),
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image(
                            image: AssetImage('images/alya.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'VeggieDelight',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(
                              255, 27, 156, 133), // Cor verde personalizada
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Sou uma pessoa apaixonada por culinária vegana e vegetariana e que está fazendo um pequeno projeto pessoal. Meu objetivo é proporcionar que usuários compartilhem receitas deliciosas e saudáveis para todos os amantes da comida vegana. Seja bem-vindo(a) ao VeggieDelight!',
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}