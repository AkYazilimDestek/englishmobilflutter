import 'dart:async';
import '../classes/class.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class RanDomWordList extends StatefulWidget {
  const RanDomWordList({Key? key}) : super(key: key);

  @override
  State<RanDomWordList> createState() => _RanDomStateList();
}

class _RanDomStateList extends State<RanDomWordList> {
  late int RasgeleId = 0;
  late String GeneratedSentence = "";
  bool SayiBitis = false;
  int MinNumber = 1;
  int MaxValue = WordList.length + 1;
  late List<int> GelenWordList = [];
  void RasgeleSayi() {
    var gelenrasgelesayi = MinNumber + Random().nextInt(MaxValue - MinNumber);
    var incomingWordilk =
        WordList.where((element) => element.Id == gelenrasgelesayi).first;
    setState(() {
      GeneratedSentence =
          incomingWordilk.EnglishWord + " : " + incomingWordilk.Turkishword;
      GelenWordList.add(gelenrasgelesayi);
    });
  }

  @override
  void initState() {
    super.initState();
    RasgeleSayi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white24,
      appBar: AppBar(
        title: Text("RASGELE KELİME ÖĞREN"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              if (SayiBitis) {
                setState(() {
                  GeneratedSentence = "TEKRAR YAPILDI.";
                });
              } else {
                setState(() {
                  bool listelemeyedevam = false;
                  while (listelemeyedevam == false) {
                    setState(() {
                      var gelenrasgelesayi =
                          MinNumber + Random().nextInt(MaxValue - MinNumber);
                      print(gelenrasgelesayi.toString());
                      print(GelenWordList.where(
                                  (element) => element == gelenrasgelesayi)
                              .length ==
                          0);
                      if (GelenWordList.where(
                                  (element) => element == gelenrasgelesayi)
                              .length ==
                          0) {
                        listelemeyedevam = true;
                        var incomingWord = WordList.where(
                            (element) => element.Id == gelenrasgelesayi).first;
                        GeneratedSentence = incomingWord.EnglishWord +
                            " : " +
                            incomingWord.Turkishword;
                        print((MaxValue - 1).toString() + " ---------");
                        if (GelenWordList.length == (MaxValue - 2)) {
                          GelenWordList.clear();
                          GelenWordList.add(gelenrasgelesayi);
                          SayiBitis = true;
                        } else {
                          GelenWordList.add(gelenrasgelesayi);
                        }
                      }
                    });
                  }
                });
              }
            },
            child: Container(
              width: MediaQuery.of(context).size.width * 0.82,
              height: 150,
              alignment: Alignment.center,
              child: Text("$GeneratedSentence",
                  style: GoogleFonts.comfortaa(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(fontSize: 25,color: Colors.white,fontWeight: FontWeight.w900))),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green,
                  border: Border.all(color: Colors.white, width: 6)),
            ),
          ),
        ),
      ),
    );
  }
}
