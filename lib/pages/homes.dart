import 'package:flutter/material.dart';
import 'package:real_estate/widgets/property_item.dart';
import '../utils/api_service.dart';
import '../utils/home.dart';

class Homes extends StatefulWidget {
  const Homes({Key? key}) : super(key: key);

  @override
  State<Homes> createState() => _HomesState();
}

class _HomesState extends State<Homes> {
  late List<Home>? _homes = [];
  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _homes = (await ApiService().getHomes())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('REST API Example'),
      ),
      body: _homes == null || _homes!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _homes!.length,
              itemBuilder: (context, index) {
                return PropertyItem(
                    home: Home(
                        id: _homes![index].id,
                        estDescription: _homes![index].estDescription,
                        estFloor: _homes![index].estFloor,
                        estImage: _homes![index].estImage,
                        estLocation: _homes![index].estLocation,
                        estPrice: _homes![index].estPrice,
                        estRating: _homes![index].estRating,
                        estRooms: _homes![index].estRooms,
                        estStatus: _homes![index].estStatus,
                        estType: _homes![index].estType,
                        estTimestamp: _homes![index].estTimestamp,
                        isFavorited: _homes![index].isFavorited));
              },
            ),
    );
  }
}
