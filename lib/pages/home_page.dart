import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List pokedex=[];
  @override
  void initState() {
    super.initState();
    if(mounted){
      fetchPokeapi();
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue,Colors.green],
          begin:Alignment.topRight, end: Alignment.bottomLeft)
        ),
        child: Stack(
          children: [
            Positioned(
              top: -50,
              right: -50,
              child: Image.asset("assets/pokeball.png",width: 170,fit: BoxFit.fitWidth,))
          ],
        ),
      ),
    );
  }
  void fetchPokeapi(){
    var url = Uri.https('raw.githubusercontent.com','/Biuni/PokemonGO-Pokedex/master/pokedex.json');
    http.get(url).then((value){
      if(value.statusCode == 200){
        var data = jsonDecode(value.body);
        pokedex = data["pokemon"];
        setState(() {});
        if (kDebugMode) {
          print(pokedex);
        }
      }
    } ).catchError((e){
      if (kDebugMode) {
        print(e);
      }
    }) ;
  }
}