import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailPage extends StatefulWidget {
  String? uuid;

  DetailPage({
    Key? key,
    this.uuid,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = false;
  bool hasError = false;
  var itemDetail;
  late List<ItemDetail> list;
  Dio _dio = Dio();

  @override
  void initState() {
    super.initState();
    getDataDio();
  }

  getDataDio() async {
    setState(() {
      isLoading = true;
    });
    try {
      final responce = await _dio.get('https://run.mocky.io/v3/${widget.uuid}');
      if (responce.statusCode == 200) {
        final Map<String, dynamic> list = responce.data
            .map<ItemDetail>((detail) => ItemDetail.fromJson(detail))
            .toList();
        print(list);
      } else {
        hasError = true;
      }
    } on DioError catch (e) {
      throw Exception(e);
      // hasError = true;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : hasError
              ? Center(
                  child: Text('Контент временно недоступен'),
                )
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(height: 200),
                        items: list.map((detail) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  color: Colors.grey,
                                  child: Image.asset(
                                    "assets/images/${detail.poster}",
                                    fit: BoxFit.cover,
                                  ));
                            },
                          );
                        }).toList(),
                      )
                    ],
                  ),
                ),
    );
  }
}
