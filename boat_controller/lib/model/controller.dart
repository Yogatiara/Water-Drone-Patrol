import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'package:network_info_plus/network_info_plus.dart';

class Controller {
  final String data;

  Controller({
    required this.data,
  });

  factory Controller.createController(Map<String, dynamic> object) {
    return Controller(
      data: object['data'],
    );
  }

  static Future<Controller> connectToApi(String path) async {
    // final info = NetworkInfo();
    // String? ipAddress = await info.getWifiIP();

    // if (ipAddress == null) {
    //   throw Exception('Failed to get IP address');
    // }

    var apiResult = await http.get(Uri.http('192.168.1.7:80', '/$path'));

    if (apiResult.statusCode == 200) {
      var jsonData = jsonDecode(apiResult.body);
      return Controller.createController(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }
}


// class PostResult {
//   final String id;
//   final String name;
//   final String job;
//   final String created;

//   PostResult(
//       {required this.id,
//       required this.name,
//       required this.job,
//       required this.created});

//   factory PostResult.createPostResult(Map<String, dynamic> object) {
//     return PostResult(
//         id: object['id'],
//         name: object['name'],
//         job: object['job'],
//         created: object['createdAt']);
//   }

//   static Future<PostResult> connectToApi(String name, String job) async {
//     var apiResult = await http.post(Uri.https('reqres.in', '/api/users'),
//         body: {'name': name, 'job': job});
//     var jsonData = jsonDecode(apiResult.body);

//     return PostResult.createPostResult(jsonData);
//   }
// }
