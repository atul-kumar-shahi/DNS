import 'package:dns_intro/pages/sidebar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Developer Network Society'),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white24,
        elevation: 0,
      ),
      drawer: const SideBar(),
      endDrawerEnableOpenDragGesture: true,
      body: const Column(
        children: [Carousel()],
      ),
    );
  }
}

class Carousel extends StatelessWidget {
  const Carousel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: CarouselSlider(
          items: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20)
                ),
                  child: Image.network(
                'https://images.pexels.com/photos/1000445/pexels-photo-1000445.jpeg',
                fit: BoxFit.cover,
              )), 
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                  'https://images.pexels.com/photos/1000445/pexels-photo-1000445.jpeg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                  'https://images.pexels.com/photos/1000445/pexels-photo-1000445.jpeg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                  'https://images.pexels.com/photos/1000445/pexels-photo-1000445.jpeg'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(
                  'https://images.pexels.com/photos/1000445/pexels-photo-1000445.jpeg'),
            ),
          ],
          options: CarouselOptions(
            height: 200,
            aspectRatio: 1,
            autoPlay: true,
            autoPlayAnimationDuration: const Duration(seconds: 1),
            animateToClosest: true,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.zoom,
            pauseAutoPlayOnTouch: true,
          )),
    );
  }
}
