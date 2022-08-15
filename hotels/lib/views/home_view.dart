import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hotels/models/hotel.dart';
import 'package:dio/dio.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isListView = true;
  bool isLoading = false;
  bool hasError = false;
  late String errorMassage;
  late List<HotelPreview> users;
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
      final responce = await _dio
          .get('https://run.mocky.io/v3/ac888dc5-d193-4700-b12c-abb43e289301');
      users = responce.data
          .map<HotelPreview>((user) => HotelPreview.fromJson(user))
          .toList();
    } on DioError catch (e) {
      print(e.error);
      errorMassage = e.response!.data['massage'];
      setState(() {
        hasError = true;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  setState(() {
                    isListView = true;
                  });
                },
                icon: Icon(Icons.list)),
            IconButton(
                onPressed: () {
                  setState(() {
                    isListView = false;
                  });
                },
                icon: Icon(Icons.apps))
          ],
        ),
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : hasError
                ? Text('Error')
                : isListView
                    ? ListView(
                        children: users.map((user) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            child: Column(
                              children: [
                                ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    child: Image.asset(
                                        "assets/images/${user.poster}")),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 10),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(user.name),
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/DetailPage');
                                          },
                                          child: Text('Подробнее'))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList())
                    : GridView.count(
                        crossAxisCount: 2,
                        children: users.map((user) {
                          return Padding(
                            padding: EdgeInsets.symmetric(
                                vertical: 5, horizontal: 10),
                            child: Card(
                              margin: const EdgeInsets.symmetric(vertical: 5),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15)),
                                    child: Image.asset(
                                        "assets/images/${user.poster}"),
                                  ),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(15),
                                        bottomLeft: Radius.circular(15),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {},
                                        child: Text('Подробнее'),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        }).toList()));
  }
}
