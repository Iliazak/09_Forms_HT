import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:dio/dio.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DetailPage extends StatefulWidget {
  String? uuid;
  DetailPage({Key? key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = false;
  bool hasError = false;
  var itemDetail;
  late List<ItemDetail> details;
  Dio _dio = Dio();

  var uuid;

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
      details = responce.data
          .map<ItemDetail>((detail) => ItemDetail.fromJson(detail))
          .toList();
      print(responce);
    } on DioError catch (e) {
      throw Exception(e);
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
                        items: details.map((detail) {
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
