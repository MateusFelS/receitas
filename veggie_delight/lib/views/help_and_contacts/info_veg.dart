import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class InfoVeg extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Informações',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 27, 156, 133),
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
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
                          image: AssetImage('images/alya_dois.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'O que é Veganismo?',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 27, 156, 133),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'O veganismo é um estilo de vida que busca excluir, na medida do possível e praticável, todas as formas de exploração e crueldade animal, seja para alimentação, vestuário ou qualquer outra finalidade. Além disso, os veganos também evitam o uso de produtos que foram testados em animais.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Para mais informações sobre o tema, clique no botão abaixo! 🦊',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 11),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        _launchURL();
                      },
                      child: Text(
                        'Saiba Mais',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 27, 156, 133),
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        minimumSize: Size(
                          MediaQuery.of(context).size.width * .5,
                          40,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _launchURL() async {
    String url = 'https://vegan.com/info/information/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link: $url';
    }
  }
}
