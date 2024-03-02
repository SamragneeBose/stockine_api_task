import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'content.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? mapResponse;
  List? listResponse;

  Future apiCall() async{
    http.Response response;
    response = await http.get(
        Uri.parse('https://yahoo-finance15.p.rapidapi.com/api/v1/markets/news'),
        headers: {
          'X-RapidAPI-Key': 'API_Key', //Replace with actual API key
          'X-RapidAPI-Host': 'yahoo-finance15.p.rapidapi.com'
        }
    );
    if(response.statusCode == 200)
    {
      setState(() {
        mapResponse = json.decode(response.body);
        listResponse = mapResponse?['body'];
      });
    }
    else
    {

    }
  }

  @override
  void initState() {
    // TODO: implement initState
    apiCall();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Stockine"),
      ),
      body: (listResponse == null)?
      const SizedBox(
        child: Text("No content available at the moment!"),
      ) :
      Scrollbar(
        child: ListView.builder(
            itemCount: listResponse!.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.amberAccent,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Content(
                        text: listResponse![index]['title'].toString(),
                        size: 24,
                      ),
                      Content(
                        text: listResponse![index]['source'].toString(),
                        size: 18,
                      ),
                      Content(
                        text: listResponse![index]['pubDate'].toString(),
                        size: 16,
                        // align: TextAlign.right,
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}