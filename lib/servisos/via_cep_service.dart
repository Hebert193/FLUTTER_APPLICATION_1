import 'package:http/http.dart' as http ;

class ViaCepservice {
  buscarEndereco(String cep) {
    String endpoit = 'https://viacep.com.br/ws/$cep/json/';
    Uri uri = Uri.parse(endpoit);
    var response = await http.get(uri);  

    if (response.statusCode == 200) {
      print('sucesso');
      print(response.body);
    } else {
      print('erro');
    }
  }
}