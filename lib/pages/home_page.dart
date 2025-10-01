import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/models/endereco.dart';
import 'package:flutter_application_1/services/via_cep_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController controllerCep = TextEditingController();
  TextEditingController controllerLogradouro = TextEditingController();
  TextEditingController controllerComplemento = TextEditingController();
  TextEditingController controllerBairro = TextEditingController();
  TextEditingController controllerCidade = TextEditingController();
  TextEditingController controllerEstado = TextEditingController();
  Endereco? endereco; //Variavel pode receber null "?"

  ViaCepService viaCepService = ViaCepService();

  Future <void> buscarCep(String cep) async{
    Endereco? response = await viaCepService.buscarEndereco(cep);

    if (response?.localidade == null) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            icon: Icon(Icons.warning),
            title: Text("Atenção"),
            content: Text("Cep não encontrado"),
          );
        },
      );
      return;
    }

    setState(() {
      endereco = response;
    });

    setControllersCep(endereco!);
  }

  void setControllersCep(Endereco endereco)
  {
    controllerLogradouro.text = endereco.logradouro!;
    controllerComplemento.text = endereco.complemento ?? "";
    controllerBairro.text = endereco.bairro!;
    controllerCidade.text = endereco.localidade!;
    controllerEstado.text = endereco.estado ?? "";
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ViaCEP Api"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            spacing: 20,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: controllerCep,
                maxLength: 8,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () {
                      buscarCep(controllerCep.text);
                      },
                  ),
                  border: OutlineInputBorder(),
                  labelText: "CEP",
                ),
              ),
              TextField(
                controller: controllerLogradouro,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Logradouro",
                ),
              ),
               TextField(
                controller: controllerComplemento,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Complemento",
                ),
              ),
              TextField(
                controller: controllerBairro,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Bairro",
                ),
              ),
              TextField(
                controller: controllerCidade,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Cidade",
                ),
              ),
              TextField(
                controller: controllerEstado,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: "Estado",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
