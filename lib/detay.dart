import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Detay extends StatefulWidget {
  final int postID;

  const Detay({Key key, this.postID}) : super(key: key);

  @override
  _DetayState createState() => _DetayState();
}

class _DetayState extends State<Detay> {
  bool yukleniyorMu = true;

  @override
  void initState() {
    veriGetir();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('qqq'),
      ),
    );
  }

  void veriGetr() {}

  veriGetir() async {
    setState(() {
      yukleniyorMu = true;
    });
    await http.post('http://api.yazilimgo.com/slimapi/post/single',
        body: {"id": widget.postID}).then((value) {
      print(value.body.toString());
    });
    setState(() {
      yukleniyorMu = false;
    });
  }
}
