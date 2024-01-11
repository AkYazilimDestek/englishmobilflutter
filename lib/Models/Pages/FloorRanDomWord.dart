import 'dart:async';
import '../classes/class.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:google_fonts/google_fonts.dart';

class FloorRanDomWordList extends StatefulWidget {
  const FloorRanDomWordList({Key? key, required this.id}) : super(key: key);
  final int id;
  @override
  State<FloorRanDomWordList> createState() => _RanDomStateList();
}

class _RanDomStateList extends State<FloorRanDomWordList> {
  late int RasgeleId = 0;
  late String GeneratedSentence = "";
  bool SayiBitis = false;
  late List<int> GelenWordList = [];
  late String AppBarText = "";
  void RasgeleSayi() {
    int MinNumber = 1;
    int MaxValue = WordList.where((element) => element.FloorId == widget.id).length + 1;
    var gelenrasgelesayi = MinNumber + Random().nextInt(MaxValue - MinNumber);
    var incomingWordilk =

        WordList.where((element) => element.Id == gelenrasgelesayi).first;
    setState(() {
      AppBarText = FloorList.where((element) => element.Id == widget.id).first.FloorName + " - RASGELE KELİME ";
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
        title: Text("$AppBarText"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: GestureDetector(
            onTap: () {
              int MinNumber = 1;
              int MaxValue = WordList.where((element) => element.FloorId == widget.id).length + 1;
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
