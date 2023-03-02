import 'package:dio/dio.dart';

import '../models/newsApimodel.dart';

Future<NewsApiModel> fetchNews() async {
  var newsResponse = await Dio().get('https://dummyjson.com/products');

  if (newsResponse.statusCode == 200) {
    return NewsApiModel.fromJson(newsResponse.data);
  } else {
    throw Exception('Failed to load album');
  }
}

// Future<RealUsers> fetchRealUser() async {
//   var realResponse = await Dio().get('https://reqres.in/api/users?page=1');
//   // print(realResponse.data['data'].toString() + 'realResponse');

//   if (realResponse.statusCode == 200) {
//     return RealUsers.fromJson(realResponse.data);
//   } else {
//     throw Exception('Failed to load album');
//   }
// }


// fetchApi() async {
//   Dio dio = Dio();
//   var response = await dio.get(
//       'https://newsapi.org/v2/everything?q=tesla&from=2022-12-12&sortBy=publishedAt&apiKey=26f4104f1a414d7ab2fd8ad2ddd31afa');
//   print(response.data);

//   if (response.statusCode == 200) {
//     return (response.data as List)
//         .map((e) => NewsApiModel.fromJson(e))
//         .toList();
//   } else {
//     throw Exception('Failed to load data');
//   }
// }