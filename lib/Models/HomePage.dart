import 'package:englisheducation/Models/Pages/FloorRanDomWord.dart';
import 'package:englisheducation/Models/Pages/RanDomWord.dart';
import 'package:englisheducation/Models/Pages/StartWordPage.dart';
import 'package:flutter/material.dart';
import 'Pages/WordDetails.dart';
import 'Pages/Contact.dart';
import 'Pages/FloorWordList.dart';
import 'classes/class.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.message),
          tooltip: 'Show Snackbar',
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Contact()));
            // ScaffoldMessenger.of(conte
            // xt).showSnackBar(
            //     const SnackBar(content: Text('This is a snackbar')));
          },
        ),
        title: Text("ENGLİSH EDUCATİON"),
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
              itemCount: FloorList.length,
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
                              child: Text(FloorList[index].FloorName,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.comfortaa(
                                  textStyle : Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(fontSize: 18, fontWeight: FontWeight.w900),),),
                            ),
                          ]),
                        ),
                        leading: IconButton(
                          icon: Icon(Icons.quiz),
                          onPressed: () => () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => FloorRanDomWordList(id: FloorList[index].Id)));
                          },
                        ),
                        trailing: Icon(Icons.align_horizontal_right),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => FloorWordList(id : FloorList[index].Id)));
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => RanDomWordList()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.quiz),
      ),
    );
  }

}
