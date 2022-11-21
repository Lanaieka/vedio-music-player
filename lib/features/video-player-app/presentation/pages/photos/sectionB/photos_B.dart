import 'package:flutter/material.dart';

import '../../../widgets/big_custom_appbar.dart';

class PhotosB extends StatefulWidget {
  const PhotosB({Key? key}) : super(key: key);

  @override
  State<PhotosB> createState() => _PhotosBState();
}

class _PhotosBState extends State<PhotosB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: BigCustomAppBar(
          title: "Photos",
          firstIcon: Icons.search,
          secondIcon: Icons.favorite_border,
          color: Colors.black.withOpacity(.6),
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Image.asset('assets/images/home.png'),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Image.asset('assets/images/search.png'),
              ),
              label: 'Sites',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Image.asset('assets/images/video.png'),
              ),
              label: 'Videos',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Image.asset('assets/images/music.png'),
              ),
              label: 'Music',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Image.asset('assets/images/pic.png'),
              ),
              label: 'Photos',
            ),
          ],
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/cam.png"),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset("assets/images/ss.png"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/what.png"),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset("assets/images/insta.png"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/cam.png"),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset("assets/images/ss.png"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/what.png"),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset("assets/images/insta.png"),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/cam.png"),
                      SizedBox(
                        width: 20,
                      ),
                      Image.asset("assets/images/ss.png"),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
