import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:carousel_slider/carousel_slider.dart';

//ignore: must_be_immutable, camel_case_types
class Detail_Page extends StatefulWidget {
  String? uuid;

  Detail_Page({
    Key? key,
    this.uuid,
  }) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<Detail_Page> {
  bool isLoading = false;
  bool hasError = false;
  var itemDetail;
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
      // print(responce.data);
      if (responce.statusCode == 200) {
        final Map<String, dynamic> jsonMap = responce.data;
        itemDetail = ItemDetail.fromJson(jsonMap);
        inspect(itemDetail);
      } else {
        hasError = true;
      }
    } on DioError catch (e) {
      hasError = true;
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${itemDetail.name}")),
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
                        items: itemDetail.photos.map<Widget>((photos) {
                          return Builder(
                            builder: (BuildContext context) {
                              return Container(
                                  child: Text("${itemDetail.photos}"));
                            },
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(10, 5, 0, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child:
                                  Text('Страна: ${itemDetail.address.country}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text('Город: ${itemDetail.address.city}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child:
                                  Text('Улица: ${itemDetail.address.street}'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 5),
                              child: Text('Рейтинг: ${itemDetail.rating}'),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Text(
                                'Сервисы',
                                style: TextStyle(fontSize: 22),
                              ),
                            ),
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Text(
                                          'Платные',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            (itemDetail.services.paid as List)
                                                .length,
                                        itemBuilder: (context, index) {
                                          return Text(
                                              itemDetail.services.paid[index]);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8),
                                        child: Text(
                                          'Бесплатные',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      ListView.builder(
                                        shrinkWrap: true,
                                        itemCount:
                                            (itemDetail.services.free as List)
                                                .length,
                                        itemBuilder: (context, index) {
                                          return Text(
                                              itemDetail.services.free[index]);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
