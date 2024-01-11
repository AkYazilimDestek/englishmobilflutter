import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:englisheducation/Models/HomePage.dart';
import 'package:englisheducation/Models/Pages/WordDetails.dart';
import 'package:flutter/material.dart';
import 'Contact.dart';
import '../classes/class.dart';
import 'package:google_fonts/google_fonts.dart';

class IknowWordList extends StatefulWidget {
  const IknowWordList({Key? key}) : super(key: key);

  @override
  State<IknowWordList> createState() => _IknowWordListState();
}

class _IknowWordListState extends State<IknowWordList> {
  @override
  late List<Word> FlorWordList = [];
  Future<void> iknowword() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String>? iknowwordlist = prefs.getStringList('iknowwordlist');
    setState((){
      print(iknowwordlist!.toList());
      iknowwordlist!.forEach((element2) {
        Word? gelendeger = WordList!.firstWhereOrNull((element) => element.Id.toString() == element2.toString());
        if (gelendeger != null) {
          FlorWordList.add(
            Word(Id :gelendeger.Id,FloorId: gelendeger.FloorId,Turkishword : gelendeger.Turkishword, EnglishWord : gelendeger.EnglishWord, Picture : gelendeger.Picture,TurkisSentence : gelendeger.TurkisSentence, EnglishSentence : gelendeger.EnglishSentence,Explanation : gelendeger.Explanation),
          );
        }
      });
      print(FlorWordList.toList());
    });
  }
  void initState() {
    super.initState();
    iknowword();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BİLDİĞİNİZ KELİMELER"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              // ScaffoldMessenger.of(context).showSnackBar(
              //     const SnackBar(content: Text('This is a snackbar')));
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          color: Colors.grey[350],
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
              itemCount: FlorWordList.length,
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                            color: Colors.black26,
                            width: 2,
                          )
                      ),
                    ),
                    child: ListTile(
                      selected: true,
                      title: Center(
                        child: Row(children: [
                          Expanded(
                            child: Text(FlorWordList[index].EnglishWord,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.comfortaa(
                                textStyle : Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 18, fontWeight: FontWeight.w900),),),
                          ),
                          Expanded(
                            child: Text("=",textAlign: TextAlign.center,style : TextStyle(
                                fontSize: 23
                            )),
                          ),
                          Expanded(
                            child: Text(
                              FlorWordList[index].Turkishword,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.comfortaa(
                                textStyle : Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(fontSize: 18, fontWeight: FontWeight.w900),),
                            ),
                          )
                        ]),
                      ),
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WordDetails(id : FlorWordList[index].Id)));
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
