import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  static const String name = 'infinite_screen';

  const InfiniteScrollScreen({super.key});

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;
  bool isMounted = true;

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;
    setState(() {});

    await Future.delayed(Duration(seconds: 2));
    addFiveImages();
    isLoading = false;

    if (!isMounted) return;
    setState(() {});
    
    moveScrollToBottom();
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 500) >=
          scrollController.position.maxScrollExtent) {
        //load next page
        loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
    isMounted = false;
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(Duration(seconds: 3));
    if (!isMounted) return;

    isLoading = false;
    final lastId = imagesIds.last;
    imagesIds.clear();
    imagesIds.add(lastId + 1);
    addFiveImages();

    setState(() {});
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 100 <=
        scrollController.position.maxScrollExtent) {
      return;
    }

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      duration: Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
    );
  }

  void addFiveImages() {
    final lastId = imagesIds.last;

    // imagesIds.add(lastId + 1);
    // imagesIds.add(lastId + 2);
    // imagesIds.add(lastId + 3);
    // imagesIds.add(lastId + 4);
    // imagesIds.add(lastId + 5);

    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          onRefresh: onRefresh,
          edgeOffset: 10,
          strokeWidth: 2,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
                placeholder: AssetImage('assets/jar-loading.gif'),
                image: NetworkImage(
                  'https://picsum.photos/id/${imagesIds[index]}/500/300',
                ),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child:
            isLoading
                ? SpinPerfect(
                  infinite: true,
                  child: Icon(Icons.refresh_rounded),
                )
                : FadeIn(child: Icon(Icons.arrow_back_ios_rounded)),
      ),
    );
  }
}
