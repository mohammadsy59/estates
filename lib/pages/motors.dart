import 'dart:io';

import 'package:real_estate/utils/Motor.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';
import 'package:real_estate/utils/data.dart';
import 'package:real_estate/widgets/company_item.dart';
import 'package:real_estate/widgets/custom_textbox.dart';
import 'package:real_estate/widgets/icon_box.dart';
import 'package:real_estate/widgets/motorcycle_item.dart';
import 'package:real_estate/widgets/recommend_item.dart';

class MotorsPage extends StatefulWidget {
  const MotorsPage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<MotorsPage> {
  final List<Item> _data = generateItems(1);
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: appBgColor,
          pinned: true,
          snap: true,
          floating: true,
          title: getHeader(),
        ),
        SliverToBoxAdapter(child: getBody())
      ],
    );
  }

  getHeader() {
    return Column(
      children: [
        SizedBox(
          height: 25,
        ),
        Row(
          children: [
            Expanded(
                child: CustomTextBox(
              hint: "Search",
              prefix: Icon(Icons.search, color: Colors.grey),
            )),
            SizedBox(
              width: 10,
            ),
            IconBox(
              child: Icon(Icons.filter_list_rounded, color: Colors.white),
              bgColor: secondary,
              radius: 10,
            )
          ],
        ),
      ],
    );
  }

  getBody() {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 20,
      ),
      _buildPanel(),
      Row(
        children: [
          Expanded(
              child: Container(
            child: Image.asset('assets/images/loncin.png'),
          )),
          Expanded(child: Image.asset("assets/images/cgHonda.jpg"))
        ],
      ),
      SizedBox(
        height: 20,
      ),
      listBrokers(),
      SizedBox(
        height: 100,
      ),
    ]));
  }

  listRecommended() {
    List<Widget> lists = List.generate(
        recommended.length, (index) => RecommendItem(data: recommended[index]));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = !isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        bool isActive = true;
        VoidCallback function;
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text('Filter'),
            );
          },
          body: ListTile(
            title: Text('Search for ...'),
            subtitle: Row(
              children: [
                Column(
                  children: [
                    Checkbox(
                        value: isActive,
                        onChanged: (value) {
                          setState(() {
                            isActive = value!;
                          });
                        })
                  ],
                )
              ],
            ),
          ),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }

  int selectedCategory = 0;
  listCompanies() {
    List<Widget> lists = List.generate(
        companies.length,
        (index) => CompanyItem(
              data: companies[index],
              color: listColors[index % 10],
              selected: index == selectedCategory,
              onTap: () {
                setState(() {
                  selectedCategory = index;
                });
              },
            ));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Row(children: lists),
    );
  }

  listBrokers() {
    List<Widget> lists = List.generate(
        recents.length,
        (index) => MotorcycleItem(
            motor: Motor(
                recents[index]['motor_id'],
                recents[index]['motor_brand'],
                recents[index]['motor_price'],
                recents[index]['motor_description'],
                recents[index]['motor_image'],
                recents[index]["motor_phone"])));

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Column(children: lists),
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

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel $index',
      expandedValue: 'This is item number $index',
    );
  });
}
