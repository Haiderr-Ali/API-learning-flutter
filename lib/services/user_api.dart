import 'dart:convert';
import 'package:api_tutorial_learning/model/user.dart';
import 'package:api_tutorial_learning/model/user_dob.dart';
import 'package:api_tutorial_learning/model/user_location.dart';
import 'package:api_tutorial_learning/model/user_name.dart';

import 'package:http/http.dart' as http;

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const url = 'https://randomuser.me/api/?results=20';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final users = results.map((e) {
      final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last'],
      );

      final date = e['dob']['date'];
      final dob = UserDob(
        age: e['dob']['age'],
        date: DateTime.parse(date),
      );

    
      final location =UserLocation(
        city: e['location']['city'],
        coordinates: LocationCoordinates(latitude: e['location']['coordinates']['latitude'], longitude: e['location']['coordinates']['longitude']),
        country: e['location']['country'],
        postcode: e['location']['postcode'].toString(),
        state: e['location']['state'],
        street: LocationStreet(number: e['location']['street']['number'], name:  e['location']['street']['name'] ),
        timezones: LocationTimezoneCoordinates(offset: e['location']['timezone']['offset'] , description: e['location']['timezone']['description'])
        
        );
      return User(
        cell: e['cell'],
        email: e['email'],
        gender: e['gender'],
        nat: e['nat'],
        phone: e['phone'],
        name: name,
        dob: dob,
        location: location,
      );
    }).toList();
    return users;
  }
}
