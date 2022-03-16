import 'dart:convert';

import 'package:flutter/material.dart';

class JsonPage extends StatefulWidget {
  const JsonPage({Key? key}) : super(key: key);

  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text(
            "Load JSON File From Local",
            style:  TextStyle(fontSize:14,
                color: Colors.black),
          ),
          backgroundColor: Colors.lime,
        ),
        body: FutureBuilder(
          builder: (context, snapshot) {
            var ShowData = json.decode(snapshot.data.toString());
            return ListView.builder(
                itemCount: ShowData.length,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    children: [
                      Card(
                        color: Colors.grey.shade200,
                        child: ListTile(
                          title: Text(ShowData[index]['name'],
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              )),
                          subtitle: Text(ShowData[index]['code'],
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              )),
                        ),
                      ),
                    ],
                  );
                });
          },
          future: DefaultAssetBundle.of(context)
              .loadString("assets/countries.json"),
        ));
  }
}
