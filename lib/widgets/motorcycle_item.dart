import 'package:flutter/material.dart';
import 'package:real_estate/pages/motor_product.dart';
import 'package:real_estate/theme/color.dart';

import '../utils/Motor.dart';
import 'custom_image.dart';

class MotorcycleItem extends StatelessWidget {
  MotorcycleItem({Key? key, required this.motor}) : super(key: key);
  final Motor motor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: ((context) => MotorProduct(motor))));
      },
      child: Container(
          width: 400,
          height: 200,
          margin: EdgeInsets.only(right: 15, bottom: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: shadowColor.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 1,
                offset: Offset(0, 1), // changes position of shadow
              ),
            ],
          ),
          child: Stack(
            children: [
              CustomImage(
                motor.image_url,
                radius: 20,
                width: double.infinity,
                height: double.infinity,
              ),
              Container(
                width: double.infinity,
                height: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(.8),
                          Colors.white.withOpacity(.01),
                        ])),
              ),
              Positioned(
                bottom: 12,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      motor.brand,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.place_outlined,
                          color: Colors.white,
                          size: 13,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          motor.price,
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      motor.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
