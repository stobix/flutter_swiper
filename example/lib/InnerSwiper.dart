import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: new InnerSwiper(),
    );
  }
}

class InnerSwiper extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _InnerSwiperState();
  }
}

class _InnerSwiperState extends State<InnerSwiper> {
  late SwiperController controller;
  late List<bool> autoplays;
  late List<SwiperController> controllers;

  @override
  void initState() {
    controller = SwiperController();

    autoplays = []
      ..length = 10
      ..fillRange(0, 10, false);
    controllers = []
      ..length = 10
      ..fillRange(0, 10, SwiperController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Swiper(
        loop: false,
        itemCount: 10,
        controller: controller,
        pagination: SwiperPagination(),
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: <Widget>[
              SizedBox(
                child: Swiper(
                  controller: controllers[index],
                  pagination: SwiperPagination(),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      color: Colors.greenAccent,
                      child: Text("jkfjkldsfjd"),
                    );
                  },
                  autoplay: autoplays[index],
                ),
                height: 300.0,
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    autoplays[index] = true;
                  });
                },
                child: Text("Start autoplay"),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    autoplays[index] = false;
                  });
                },
                child: Text("End autoplay"),
              ),
              Text("is autoplay: ${autoplays[index]}")
            ],
          );
        },
      ),
    );
  }
}
