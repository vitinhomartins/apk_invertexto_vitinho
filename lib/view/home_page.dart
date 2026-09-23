import 'package:flutter/material.dart';
import 'por_extenso_page.dart';
import 'busca_cep_page.dart';
import 'gerar_pessoa_page.dart';
import 'gerar_codigo_page.dart';
import 'valida_email_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/imgs/logo.png',
              fit: BoxFit.contain,
              height: 40,
            ),
          ],
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            GestureDetector(
              child: const Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  SizedBox(width: 30),
                  Text(
                    'Por Extenso',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const PorExtensoPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            GestureDetector(
              child: const Row(
                children: [
                  Icon(
                    Icons.home,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  SizedBox(width: 30),
                  Text(
                    'Busca CEP',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BuscaCepPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            GestureDetector(
              child: const Row(
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  SizedBox(width: 30),
                  Text(
                    'Gerar Pessoa',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GerarPessoaPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            GestureDetector(
              child: const Row(
                children: [
                  Icon(
                    Icons.barcode_reader,
                    color: Colors.white,
                    size: 50.0,
                  ),
                  SizedBox(width: 30),
                  Text(
                    'Gerar Código de Barras',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const GerarCodigoPage(),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),

            GestureDetector(
              child: Row(
                children: [
                  Icon(Icons.edit,
                  color: Colors.white, size: 50.0),
                  SizedBox(width: 30),
                  Text("Validação de E-mail",
                  style: TextStyle(
                    color: Colors.white, fontSize: 20.0),)
                ],
              ),
              onTap: () {
                Navigator.push(context,
                MaterialPageRoute(
                  builder: ((context) => ValidaEmail())
                ));
              },
            ),
          ],
        ),
      ),
    );
  }
}