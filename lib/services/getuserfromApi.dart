import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:qr_code/models/attendee.dart';



class GetUserFromApi{
  Future getUser({required String id}) async {
    const url = 'https://ieee-bub.org/API/API/v1/event_attendee/flutter-2023/check_member';
    http.Response res = await http.post(Uri.parse(url),body:jsonEncode({
      "data": {
        "attendee_code":id,
      }}), headers: {
      'Content-Type': 'application/json',
    } );
    http.Response res1 =await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (res.statusCode == 200) {
      var data = jsonDecode(res.body);
      return Attendee.fromJson(data['data'][0]);
    }
  }

}





