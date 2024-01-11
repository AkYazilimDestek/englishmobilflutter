import 'package:englisheducation/Models/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Contact extends StatefulWidget {
  const Contact({Key? key}) : super(key: key);

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("İLETİŞİME GEÇ"),
        centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.home),
              tooltip: 'Show Snackbar',
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
          ]
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(padding: const EdgeInsets.all(20),
      child : SingleChildScrollView(
        child : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _space(),
              _TextFullName(),
              _space(),
              _space(),
              _TextMail(),
              _space(),
              _space(),
              _TextPhone(),
              _space(),
              _space(),
              _TextMessage(),
              _space(),
              _space(),
              _sendButton(),
              _space(),
              _ButtonMessage(),
            ],
        ),
      ),
    );
  }
  Widget _space() {
    return SizedBox(
      height: 10,
    );
  }

  Widget _TextFullName() {
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "TAM ADINIZ",
          ),
          //   controller: controller.usernameController,
        ),
      ),
    );
  }


  Widget _TextMail() {
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "EPOSTA ADRESİNİZ",
          ),
          //   controller: controller.usernameController,
        ),
      ),
    );
  }

  Widget _TextPhone() {
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "TELEFON NUMARANIZ",
          ),
          //   controller: controller.usernameController,
        ),
      ),
    );
  }

  Widget _TextMessage() {
    return Material(
      elevation: 10,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(40, 2, 8, 2),
        child: TextField(
          maxLines: 4,
          textInputAction: TextInputAction.next,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "MESAJINIZ",
          ),
          //   controller: controller.usernameController,
        ),
      ),
    );
  }

  Widget _sendButton() {
    return ElevatedButton(onPressed: (){}, child: Text("MESAJ GÖNDER"));
  }

  Widget _ButtonMessage() {
    return Center(
      child: Text("GERİ BİLDİRİMLERİNİZ BİZİM İÇİN ÖNEMLİ.",style: GoogleFonts.comfortaa(),),
    );
  }
}
