import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imageUrl;

  SlideInfo(this.title, this.caption, this.imageUrl);
}

final slides = <SlideInfo>[
  SlideInfo('Busca la comida', 'Reprehenderit voluptate...', 'assets/1.png'),
  SlideInfo('Entrega rápida', 'Ea minim do aliquip aute...', 'assets/2.png'),
  SlideInfo('Disfruta la comida', 'Laboris veniam Lorem ci...', 'assets/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const String name = 'tutorial_screen';

  const AppTutorialScreen({super.key});

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReached = false;

  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if (!endReached && page >= (slides.length - 1.5)) {
        setState(() {
          endReached = true;
        });
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageViewController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          PageView(
            controller: pageViewController,
            physics: BouncingScrollPhysics(),
            children:
                slides
                    .map(
                      (slideData) => _Slide(
                        title: slideData.title,
                        caption: slideData.caption,
                        imageUrl: slideData.imageUrl,
                      ),
                    )
                    .toList(),
          ),
          Positioned(
            top: 50,
            right: 20,
            child: TextButton(
              child: Text('Salir'),
              onPressed: () => context.pop(),
            ),
          ),
          endReached
              ? Positioned(
                bottom: 30,
                right: 30,
                child: FadeInRight(
                  from: 15,
                  delay: Duration(milliseconds: 500),
                  child: FilledButton(
                    onPressed: () => context.pop(),
                    child: Text('Comenzar'),
                  ),
                ),
              )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imageUrl;

  const _Slide({
    required this.title,
    required this.caption,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imageUrl),
            SizedBox(height: 30),
            Text(title, style: titleStyle),
            SizedBox(height: 10),
            Text(caption, style: captionStyle),
          ],
        ),
      ),
    );
  }
}
