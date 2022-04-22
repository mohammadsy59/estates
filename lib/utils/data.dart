import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:real_estate/utils/home.dart';

var profile = "https://avatars.githubusercontent.com/u/86506519?v=4";

Future<Home> fetchHome() async {
  final response = await http
      .get(Uri.parse('https://625f6a2053a42eaa07f4956f.mockapi.io/home'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Home.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

List populars = [
  {
    "id": 1,
    "est_type": "home",
    "est_rating": 2,
    "est_image":
        "https://images.unsplash.com/photo-1592595896616-c37162298647?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "est_location": "idlib,salqin",
    "est_description": "منزل في شارع النفاخ 4 غرف آجار 50",
    "est_timestamp": "2022-02-22 15:33:20",
    "est_price": "50",
    "est_rooms": 2,
    "est_floor": 3,
    "est_status": "buy",
    "is_favorited": false
  },
  {
    "id": 2,
    "est_type": "منزل",
    "est_rating": 3,
    "est_image":
        "https://images.unsplash.com/photo-1592595896616-c37162298647?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "est_location": "azaaz,jarablus",
    "est_description": "4 غرف ومنتفعات",
    "est_timestamp": "2022-02-22 15:30:30",
    "est_price": "100",
    "est_rooms": 4,
    "est_floor": 4,
    "est_status": "rent",
    "is_favorited": true
  }
];

List recommended = [
  {
    "car_id": 1,
    "car_brand": "BMW",
    "car_model": "2005 m3",
    "car_price": "3000",
    "car_description": "خالي العلام برا جوة فخدات دهب فتحة سقف ",
    "car_image":
        "https://www.bmw.nl/content/dam/bmw/common/all-models/m-series/m3-sedan/2020/overview/bmw-3-series-sedan-m-automobiles-sp-desktop.jpg"
  },
  {
    "car_id": 2,
    "car_brand": "Mercedes",
    "car_model": "AMG",
    "car_price": "2500",
    "car_description": "دواليب 50 % فخدات دهب بطارية جديدة دوزان دهب",
    "car_image":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLg8BDz8idU9msDwTxczDWHs2y5NFm-_PcDR64LAcF3_g0MP13xIUi55UV9Zes3mgsJwU&usqp=CAU"
  }
];

List recents = [
  {
    "motor_id": 1,
    "motor_brand": "kawasaki",
    "motor_price": "2500",
    "motor_description": "kdfk;shfjdhf;ksdjfkbs",
    "motor_image":
        "https://motorrai.nl/wp-content/uploads/2020/12/2021-Kawasaki-Versys-650-FOTO-01-1600x1201.jpg",
    "motor_phone": 00963997212234
  },
  {
    "motor_id": 2,
    "motor_brand": "honda",
    "motor_price": "3000",
    "motor_description": "kjsfhkjs;fsdb.kvjbcxvjhbxjchvb",
    "motor_image":
        "https://www.honda2wheelersindia.com/assets/images/latest-product/CD110_new_Launch.jpg",
    "motor_phone": 00963997212234
  }
];

List categories = [
  {"name": "All", "icon": FontAwesomeIcons.boxes},
  {"name": "Villa", "icon": FontAwesomeIcons.university},
  {"name": "Shop", "icon": FontAwesomeIcons.storeAlt},
  {"name": "Building", "icon": FontAwesomeIcons.building},
  {"name": "House", "icon": FontAwesomeIcons.home},
];

var brokers = [
  {
    "image":
        "https://images.unsplash.com/photo-1544005313-94ddf0286df2?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MjV8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "John Siphron",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTF8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Corey Aminoff",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1617069470302-9b5592c80f66?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z2lybHxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Siriya Aminoff",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
  {
    "image":
        "https://images.unsplash.com/photo-1545167622-3a6ac756afa4?ixid=MXwxMjA3fDB8MHxzZWFyY2h8MTB8fHByb2ZpbGV8ZW58MHx8MHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Rubin Joe",
    "type": "Broker",
    "description":
        "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
    "rate": 4,
  },
];

List companies = [
  {
    "image":
        "https://images.unsplash.com/photo-1549517045-bc93de075e53?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "TS Home",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": false,
    "icon": Icons.domain_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1618221469555-7f3ad97540d6?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Century 21",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.house_siding_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Dabest Pro",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.home_work_rounded
  },
  {
    "image":
        "https://images.unsplash.com/photo-1625602812206-5ec545ca1231?ixid=MXwxMjA3fDB8MHxzZWFyY2h8NHx8Zm9vZHxlbnwwfHwwfA%3D%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=60",
    "name": "Cam Reality",
    "location": "Phnom Penh, Cambodia",
    "type": "Broker",
    "is_favorited": true,
    "icon": Icons.location_city_rounded
  },
];
