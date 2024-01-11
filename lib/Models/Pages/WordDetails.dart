import 'package:englisheducation/Models/HomePage.dart';
import 'package:englisheducation/Models/Pages/FloorWordList.dart';
import 'package:englisheducation/Models/Pages/IknowWordList.dart';
import 'package:flutter/material.dart';
import 'package:englisheducation/Models/Pages/StartWordPage.dart';
import '../classes/class.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WordDetails extends StatefulWidget {
  final int id;
  const WordDetails({Key? key, required this.id}) : super(key: key);
  @override
  State<WordDetails> createState() => _WordDetailsState();
}

class _WordDetailsState extends State<WordDetails> {
  @override
  late String EnglishWord = "";
  late String Turkishword = "";
  late String Explanation = "";
  late String EnglishSentence = "";
  late String TurkisSentence = "";
  late String WordId = "";
  late Color StarColor = Colors.white;
  late Color KnowladgeColor = Colors.white;
  late int FloorId = 0;
  void GelenBilgiler() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final List<String>? yildizli = prefs.getStringList('starwordId');
      setState(() {
        bool isthereawordLoad = false;
        yildizli!.forEach((element) {
          if (element == widget.id.toString()) {
            isthereawordLoad = true;
          }
          if (isthereawordLoad) {
            StarColor = Colors.yellow;
          }
        });
      });
    } catch (e) {}

    try {
      final List<String>? knowloadge = prefs.getStringList('iknowwordlist');
      setState(() {
        bool isthereawordLoad = false;
        knowloadge!.forEach((element) {
          if (element == widget.id.toString()) {
            isthereawordLoad = true;
          }
          if (isthereawordLoad) {
            KnowladgeColor = Colors.lightBlueAccent;
          }
        });
      });
    } catch (e) {}


    setState(() {
      var Word = WordList.where((element2) => element2.Id == widget.id).first;
      FloorId  = FloorList.where((element) => element.Id == Word.FloorId).first.Id;
      Turkishword = Word.Turkishword;
      EnglishWord = Word.EnglishWord;
      Explanation = Word.Explanation ?? "";
      TurkisSentence = Word.TurkisSentence;
      EnglishSentence = Word.EnglishSentence;
      WordId = Word.Id.toString();
    });
  }

  void initState() {
    super.initState();
    GelenBilgiler();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.home),
          onPressed: () {
            Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
          },
        ),
        title: Text("${Turkishword}  --  ${EnglishWord}"),
        centerTitle: true,
        actions: [
          IconButton(
            color: KnowladgeColor,
            icon: const Icon(Icons.add_box),
            onPressed: () async {
            final prefs = await SharedPreferences.getInstance();
            final List<String>? iknowwordlist = prefs.getStringList('iknowwordlist');
            if (iknowwordlist != null || iknowwordlist != []) {
              bool isthereaword = true;
              iknowwordlist!.forEach((element) {
                if ((element ?? "0").toString() == (widget.id ?? "0").toString()) {
                  isthereaword = false;
                  iknowwordlist.remove('${widget.id}');
                  prefs.setStringList('iknowwordlist', iknowwordlist.toList());
                  setState(() {
                    KnowladgeColor = Colors.white;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('KELİME ÖĞRENİLENLERDEN KALDIRILDI.')));

                }
              });

              if (isthereaword) {
                  iknowwordlist.add('${widget.id}');
                  prefs.setStringList('iknowwordlist', iknowwordlist.toList());
                  setState(() {
                    KnowladgeColor = Colors.lightBlueAccent;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('KELİME ÖĞRENİLENLERE EKLENDİ.')));
              }

              } else {
              setState(() {
                KnowladgeColor = Colors.lightBlueAccent;
              });
              prefs.setStringList('iknowwordlist', ["${widget.id}"]);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text('BAŞARILI ŞEKİLDE EKLENDİ.')));
            }
            },
          ),
          IconButton(
            color: StarColor,
            icon: const Icon(Icons.star),
            tooltip: 'Show Snackbar',
            onPressed: () async {
              final prefs = await SharedPreferences.getInstance();
              final List<String>? yildizli = prefs.getStringList('starwordId');
             if (yildizli != null || yildizli != []) {
               bool isthereaword = true;
               yildizli!.forEach((element) {
                 if ((element ?? "0").toString() == (widget.id ?? "0").toString()) {
                   isthereaword = false;
                   yildizli.remove('${widget.id}');
                   prefs.setStringList('starwordId', yildizli.toList());
                   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                       content: Text('KELİME BEĞENİLENLERDEN KALDIRILDI.')));
                    setState(() {
                      StarColor = Colors.white;
                    });
                 }
               });
               if (isthereaword) {
                 yildizli.add('${widget.id}');
                 prefs.setStringList('starwordId', yildizli.toList());
                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                     content: Text('KELİME BEĞENİLENE EKLENDİ.')));
                   setState(() {
                     StarColor = Colors.yellow;
                   });
               }
             } else {
               prefs.setStringList('starwordId', ["${widget.id}"]);
               ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                   content: Text('BAŞARILI ŞEKİLDE EKLENDİ.')));
             }
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 4,
                  child: IconButton(
                    icon: const Icon(Icons.voice_chat),
                    tooltip: 'Increase volume by 10',
                    onPressed: () async {
                      final FlutterTts flutterTts = FlutterTts();
                      await flutterTts.setLanguage("en-US");
                      await flutterTts.setPitch(1);
                      await flutterTts.speak("${EnglishWord}");
                    },
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text("${Turkishword}  --  ${EnglishWord}"),
                ),
                Expanded(
                  flex: 2,
                  child: Text("${TurkisSentence}  --  ${EnglishSentence}"),
                ),
                Expanded(
                  flex: 2,
                  child: Text("${Explanation}"),
                ),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'School',
          ),
        ],
        selectedItemColor: Colors.amber[800],
        onTap: (int index) {
          switch (index) {
             case 0:
               Navigator.push(context,MaterialPageRoute(builder: (context) => StarWordPage()));
             break;
            case 1:
              Navigator.push(context,MaterialPageRoute(builder: (context) => IknowWordList()));
              break;
            case 2:
              Navigator.push(context,MaterialPageRoute(builder: (context) => FloorWordList(id : FloorId)));
              break;
          }
        },
      ),
    /*  floatingActionButton: FloatingActionButton(
        onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => StarWordPage()));
          },
        child: const Icon(Icons.star),
      ), */
    );
  }
}
