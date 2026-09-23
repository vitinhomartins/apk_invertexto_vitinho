import 'package:flutter/material.dart';
import '../service/invertexto_service.dart';

class GerarPessoaPage extends StatefulWidget {
  const GerarPessoaPage({super.key});

  @override
  State<GerarPessoaPage> createState() => _GerarPessoaPageState();
}

class _GerarPessoaPageState extends State<GerarPessoaPage> {
  final apiService = InvertextoApiService();

  Future<Map<String, dynamic>>? pessoa;

  void gerarPessoa() {
    setState(() {
      pessoa = apiService.geraPessoa();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: gerarPessoa,
                child: const Text(
                  'Gerar Pessoa',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            FutureBuilder<Map<String, dynamic>>(
              future: pessoa,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.white,
                    ),
                  );
                }

                if (snapshot.hasError) {
                  return Text(
                    'Erro: ${snapshot.error}',
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                    ),
                  );
                }

                if (!snapshot.hasData) {
                  return const Text(
                    'Clique no botão para gerar uma pessoa.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  );
                }

                final data = snapshot.data!;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Nome: ${data['name'] ?? ''}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'CPF: ${data['cpf'] ?? ''}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}