import 'dart:io';

import 'package:flutter/material.dart';
import 'package:real_estate/utils/Motor.dart';
import 'package:url_launcher/url_launcher.dart';

class MotorProduct extends StatefulWidget {
  const MotorProduct(this.motor);
  final Motor motor;

  @override
  State<MotorProduct> createState() => _MotorProductState();
}

class _MotorProductState extends State<MotorProduct> {
  Widget buildHeader() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      spreadRadius: 3,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    )
                  ],
                  borderRadius: BorderRadius.circular(15)),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back_ios),
                color: Colors.blueAccent,
              ))
        ],
      ),
    );
  }

  Widget MotorImage() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Color.fromARGB(255, 179, 180, 180),
                spreadRadius: 1,
                blurRadius: 0,
                offset: Offset(0, 1))
          ],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50))),
      padding: EdgeInsets.all(10),
      child: Column(
        children: [Image.network(widget.motor.image_url)],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: ListView(
          children: [
            Container(
              child: buildHeader(),
            ),
            MotorImage(),
            Container(
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.motor.brand,
                    style: TextStyle(fontSize: 30),
                  ),
                  Padding(padding: EdgeInsets.only(bottom: 10)),
                  Text(
                    widget.motor.description,
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 75,
        decoration: BoxDecoration(
            color: Colors.blueGrey,
            boxShadow: [
              BoxShadow(
                  color: Color.fromARGB(255, 179, 180, 180),
                  spreadRadius: 7,
                  blurRadius: 4,
                  offset: Offset(0, 3))
            ],
            borderRadius: BorderRadius.circular(50)),
        padding: EdgeInsets.only(left: 50, right: 30),
        child: Row(
          children: [
            Text(
              "${widget.motor.price} \$",
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(child: Text('')),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.blueGrey,
                  boxShadow: [
                    BoxShadow(
                        color: Color.fromARGB(255, 179, 180, 180),
                        spreadRadius: 1,
                        blurRadius: 1,
                        offset: Offset(0, 1))
                  ],
                  borderRadius: BorderRadius.circular(50)),
              child: Row(
                children: [
                  Text(" واتساب",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: Colors.white)),
                  SizedBox(width: 15),
                  IconButton(
                    icon: Icon(Icons.whatsapp_outlined),
                    color: Colors.white,
                    onPressed: () {
                      launchWhatsApp(
                          phone: widget.motor.phone.toString(),
                          message: "مرحبا هذه الرسالة موجهة من تطبيق أفاق");
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void launchWhatsApp({
    required String phone,
    required String message,
  }) async {
    String url() {
      if (Platform.isAndroid) {
        // add the [https]
        return "https://wa.me/$phone/?text=${Uri.parse(message)}"; // new line
      } else {
        // add the [https]
        return "https://api.whatsapp.com/send?phone=$phone=${Uri.parse(message)}"; // new line
      }
    }

    if (await canLaunch(url())) {
      await launch(url());
    } else {
      throw 'Could not launch ${url()}';
    }
  }
}
