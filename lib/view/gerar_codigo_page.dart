import 'package:flutter/material.dart';
import '../service/invertexto_service.dart';

class GerarCodigoPage extends StatefulWidget {
  const GerarCodigoPage({super.key});

  @override
  State<GerarCodigoPage> createState() => _GerarCodigoPageState();
}

class _GerarCodigoPageState extends State<GerarCodigoPage> {
  final apiService = InvertextoApiService();

  String? codigo;

  void gerarCodigo(String valor) {
    if (valor.isNotEmpty) {
      setState(() {
        codigo = valor;
      });
    }
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
            TextField(
              keyboardType: TextInputType.text,
              style: const TextStyle(
                color: Colors.white,
              ),
              decoration: const InputDecoration(
                labelText: 'Digite o código',
                labelStyle: TextStyle(
                  color: Colors.white,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
              onSubmitted: gerarCodigo,
            ),
            const SizedBox(height: 30),
            if (codigo != null)
              Image.network(
                apiService.gerarCodigoBarrasUrl(codigo!),
                width: double.infinity,
                height: 200,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Text(
                    'Erro ao gerar código de barras.',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 18,
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}