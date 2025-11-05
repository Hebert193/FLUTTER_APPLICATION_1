import 'package:flutter/material.dart';
import 'package:via_cep_api/pages/location_page.dart';
import 'package:via_cep_api/pages/home_page.dart';
import 'package:via_cep_api/pages/map_page.dart';

class ViaCepApi extends StatelessWidget {
  const ViaCepApi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const HomePage(),
    );
  }
}
