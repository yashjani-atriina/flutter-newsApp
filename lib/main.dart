import 'dart:async';

import 'package:flutter/material.dart';

import 'functionality/newsApiFunction.dart';
import 'models/newsApimodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<NewsApiModel> futureNews;

  @override
  void initState() {
    super.initState();
    futureNews = fetchNews();
  }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            child: FutureBuilder<NewsApiModel>(
              future: fetchNews(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                    // itemCount: snapshot.data!.articles!.length,
                    physics: BouncingScrollPhysics(),
                    itemCount: snapshot.data!.products!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Scaffold(
                                appBar: AppBar(
                                  title: Text(snapshot
                                      .data!.products![index].brand
                                      .toString()),
                                ),
                                body: Center(
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Scaffold(
                                            appBar: AppBar(
                                              title: Text(snapshot
                                                  .data!.products![index].brand
                                                  .toString()),
                                            ),
                                            body: Center(
                                              child: Column(
                                                children: [
                                                  Image.network(
                                                    snapshot
                                                        .data!
                                                        .products![index]
                                                        .images![0],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            // Text(
                                            //   snapshot.data!.products![index]
                                            //       .category
                                            //       .toString(),
                                          ),
                                          // {
                                          //   Navigator.push(
                                          //     context,
                                          //     MaterialPageRoute(
                                          //       builder: (context) => BrandName(
                                          //         brandName: snapshot.data!
                                          //             .products![index].category!,
                                          //       ),
                                          //     ),
                                          //   );
                                          // },
                                        ),
                                      );
                                    },
                                    child: Text(snapshot
                                        .data!.products![index].brand
                                        .toString()),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                        title: Text(
                          snapshot.data!.products![index].brand.toString(),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.blue,
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
