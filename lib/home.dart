import 'package:flutter/material.dart';

import 'data.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: SingleChildScrollView(
        child: StreamBuilder(
          stream: Stream.periodic(const Duration(seconds: 5)),
          builder: (context, snapshot) {
            return FutureBuilder(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData){
                  return Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 100,),
                          RichText(
                              text: TextSpan(
                                  style: const TextStyle(fontSize: 40),
                                  children: [
                                    const TextSpan(text: "Author: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                    TextSpan(text: snapshot.data!.author),
                                  ]
                              )
                          ),
                          const SizedBox(height: 50,),
                          RichText(
                            text: TextSpan(
                                style: const TextStyle(fontSize: 40),
                                children: [
                                  const TextSpan(text: "slug: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: snapshot.data!.authorSlug),
                                ]),
                          ),
                          const SizedBox(height: 50,),
                          RichText(
                            text: TextSpan(
                                style: const TextStyle(fontSize: 40),
                                children: [
                                  const TextSpan(text: "content: ", style: TextStyle(fontWeight: FontWeight.bold)),
                                  TextSpan(text: snapshot.data!.content),
                                ]),
                          ),

                        ],
                      ),
                    ),
                  );
                }else{
                  return const Center(child: Text("loading", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30, color: Colors.white),));
                }
              },
            );
          },
        ),
      ),
    );
  }
}