import 'package:chuck_norris/chuck_norris.dart' as chuck_norris;
import 'package:chuck_norris/services/category_service.dart';
import 'dart:io';
//import 'package:dotenv/dotenv.dart';
// !!!!!!Esercizio!!!!!!

// Creare un algoritmo che scarica un
// citazione da https://api.chucknorris.io/
// Inserire la citazione e dati annessi in una
// classe apposita
// Stamparla nella console assieme ad id e
// data di creazione
// Modificare il codice per far sì che si
// possano prendere citazioni solo di una
// determinata categoria decisa a priori
// Per i più temerari:
// Inserire la categoria per la quale filtrare in
// un file di ambiente da caricare
// all’esecuzione del programma
// Se proprio vuoi strafare:
// Accettare da linea di comando una
// stringa con la quale filtrare le citazioni
// attraverso le api
// Salvare la citazione in un file con tutti i
// suoi metadati

void main(List<String> arguments) async {
  //final env = DotEnv()..load();
  final cats = await getCategories();

  print("choose a  number  for the category");
  for (var i = 0; i < cats.length; i++) {
    print("$i - ${cats[i]}");
  }
  final catIndex = stdin.readLineSync();

  final cat = cats[int.parse(catIndex!)];

  final quote = await chuck_norris.getCITfromcategory(cat);
  print("Cit:${quote.cit}\n Id:${quote.id}\n CreatedAt:${quote.createdAt}");

  return;

  // print("cosa vuoi cercare oggi??");
  // final input = stdin.readLineSync();

  // final cit = await chuck_norris.getCITbysearchParam(input!);
  // print(cit);

  // final ss = cit.toString();
  // await File("cit.txt").writeAsString(ss);
}
