import 'dart:convert';
import 'dart:ffi';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:test_app/detay.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //https://jsonplaceholder.typicode.com/posts
  List<String> _data = ['ali', 'veli', "nürbek"];
  List<dynamic> vericik = [];
  bool yukleniyorMu = true;

  @override
  void initState() {
    // TODO: implement initState
    veriGetir();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("DWIGHT"),
        ),
        body: _page());
  }

  Widget _page() {
    if (yukleniyorMu) {
      return CircularProgressIndicator();
    } else {
      return ListView.builder(
        itemBuilder: (context, index) {
          var i = vericik[index];
          return ListTile(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Detay(
                            postID: i['id'],
                          )));
            },
            title: Text('${i['title']}'),
            subtitle: Text('${i['created_at']}'),
            // leading: Image.network(i['thumbnail'], width: 80, height: 80),
          );
        },
        itemCount: vericik?.length ?? 0,
      );
    }
  }

  veriGetir() async {
    setState(() {
      yukleniyorMu = true;
    });
    await http
        .get('http://api.yazilimgo.com/slimapi/post/popular')
        .then((value) {
      setState(() {
        vericik = jsonDecode(value.body)['result'];
      });
    });
    setState(() {
      yukleniyorMu = false;
    });
  }
}
