import 'package:flutter/material.dart';

import '../../widgets/big_custom_appbar.dart';

class All_themes extends StatefulWidget {
  const All_themes({Key? key}) : super(key: key);

  @override
  State<All_themes> createState() => _All_themesState();
}

class _All_themesState extends State<All_themes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BigCustomAppBar(
        title: "Themes",
        firstIcon: null,
        secondIcon: null,
        color: Colors.black.withOpacity(.6),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: ListView(
          children: [
            Container(
              height: 132,
              decoration: BoxDecoration(

                image: DecorationImage(
                  image: AssetImage('assets/images/playertheme.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(10),

              ),

              child: Padding(
                padding: const EdgeInsets.only(top: 50,),
                child: Column(

                  children: [
                    Expanded(

                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [


                            Text('Player Theme',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text('5+ Music player Theme',
                              style: TextStyle(

                                color: Colors.white,

                              ),
                            ),


                          ],
                        ),

                      ),
                    ),
                    Expanded(child: Container(

                    ),
                    ),
                  ],
                ),
              ),

            ),


          ],
        ),
      ),

    );
  }
}
