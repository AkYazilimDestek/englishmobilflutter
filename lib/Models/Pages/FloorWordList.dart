import 'package:englisheducation/Models/Pages/StartWordPage.dart';
import 'package:englisheducation/Models/Pages/WordDetails.dart';
import 'package:flutter/material.dart';
import 'Contact.dart';
import '../classes/class.dart';
import 'package:google_fonts/google_fonts.dart';

import 'FloorRanDomWord.dart';

class FloorWordList extends StatefulWidget {
  final int id;
  const FloorWordList({Key? key, required this.id}) : super(key: key);
  @override
  State<FloorWordList> createState() => _FloorWordListState();
}

class _FloorWordListState extends State<FloorWordList> {
  @override
  late String FloorTitle = "";
  late List<Word> FlorWordList = [];
  void initState() {
    super.initState();
    var Word = FloorList.where((element) => element.Id == widget.id).first;
    FloorTitle = Word.FloorName;
    FlorWordList = WordList.where((x) => x.FloorId == widget.id).toList();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${FloorTitle}"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.star),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => StarWordPage()));
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
                      hoverColor: Colors.black,
                      splashColor: Colors.black,
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => FloorRanDomWordList(id: widget.id)));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.quiz),
      ),
    );
  }
}


