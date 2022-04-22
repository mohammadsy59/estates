import 'package:flutter/material.dart';
import 'package:real_estate/theme/color.dart';
import 'package:real_estate/utils/data.dart';
import 'package:real_estate/widgets/car_item.dart';
import 'package:real_estate/widgets/company_item.dart';
import 'package:real_estate/widgets/custom_textbox.dart';
import 'package:real_estate/widgets/icon_box.dart';
import 'package:real_estate/widgets/recommend_item.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({Key? key}) : super(key: key);

  @override
  _ExplorePageState createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
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
    return Row(
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
    );
  }

  getBody() {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      SizedBox(
        height: 20,
      ),
      Row(
        children: [
          Expanded(
            child: Container(
                width: 220,
                height: 130,
                margin: EdgeInsets.only(right: 15),
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
                child: Image.asset('assets/images/rangerover.jpg')),
          ),
          Expanded(
            child: Container(
                width: 220,
                height: 130,
                margin: EdgeInsets.only(right: 15),
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
                child: Image.asset(
                  'assets/images/veracruiz.jpg',
                  fit: BoxFit.cover,
                )),
          ),
        ],
      ),
      SizedBox(
        height: 20,
      ),
      SizedBox(
        height: 20,
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
        recommended.length, (index) => CarItem(data: recommended[index]));

    return SingleChildScrollView(
      padding: EdgeInsets.only(bottom: 5, left: 15),
      child: Column(children: lists),
    );
  }
}
