import 'package:flutter/material.dart';
import '../service/invertexto_service.dart';

class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({super.key});

  @override
  State<BuscaCepPage> createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
  String? campo;
  String? resultado;

  final apiService = InvertextoApiService();

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
              decoration: const InputDecoration(
                labelText: "Digite o CEP",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              onSubmitted: (value) {
                setState(() {
                  campo = value;
                });
              },
            ),

            FutureBuilder(
              future: apiService.buscaCEP(campo),
              builder: (context, snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 5.0,
                    );

                  default:
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text(
                          'Erro ao buscar os dados.',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      );
                    } else {
                      return exibeResultado(context, snapshot);
                    }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(
    BuildContext context,
    AsyncSnapshot snapshot,
  ) {
    String enderecoCompleto = '';

    if (snapshot.data != null) {
      enderecoCompleto +=
          snapshot.data["street"] ?? "Rua não disponível";

      enderecoCompleto += "\n";

      enderecoCompleto +=
          snapshot.data["neighborhood"] ?? "Bairro não disponível";

      enderecoCompleto += "\n";

      enderecoCompleto +=
          snapshot.data["city"] ?? "Cidade não disponível";

      enderecoCompleto += "\n";

      enderecoCompleto +=
          snapshot.data["state"] ?? "Estado não disponível";
    }

    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Text(
        enderecoCompleto,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),
        softWrap: true,
      ),
    );
  }
}