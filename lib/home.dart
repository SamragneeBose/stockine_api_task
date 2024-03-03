import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
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
  String msg = "No content available at the moment!";

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
        // print('Success');
      });
    }
    else
      {
        setState(() {
          msg='Error: ${response.statusCode}';
        });
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
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          apiCall();
          },
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Theme.of(context).colorScheme.onSecondary,
        child: const Icon(Icons.refresh),
      ),
      body: (listResponse == null)?
      SizedBox(
          child: Center(
              child: Text(
                  msg,
                style: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
          ),
      ) :
      Scrollbar(
        child: ListView.builder(
            itemCount: listResponse!.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  color: Theme.of(context).colorScheme.primary,
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
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        OutlinedButton(
                            onPressed: () => setState(() {
                              launchUrl(
                                Uri.parse(listResponse![index]['link'].toString()),
                                mode: LaunchMode.externalApplication,
                              );
                            }),
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Theme.of(context).colorScheme.secondary,
                              backgroundColor: Theme.of(context).colorScheme.onSecondary,
                              side: BorderSide(
                                width: 3,
                                color: Theme.of(context).colorScheme.secondary,
                              )
                            ),
                            child: const Text(
                                "Read More",
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}