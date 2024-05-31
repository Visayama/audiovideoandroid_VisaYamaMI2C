import 'package:audiovideoandroid/latihan/bottom_menu.dart';
import 'package:flutter/material.dart';

class SplashCoba extends StatefulWidget {
  const SplashCoba({super.key});

  @override
  State<SplashCoba> createState() => _SplashCobaState();
}

class _SplashCobaState extends State<SplashCoba> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 8,),
                // const Image(
                //   image: NetworkImage('https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                //   fit: BoxFit.contain,
                //   height: 150,
                //   width: 150,
                // ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Add Your'),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Music',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10,),
                Image.asset('gambar/spotify.png',
                    fit: BoxFit.contain,
                    height: 210,
                    width: 210,),
                const SizedBox(height: 20,),
                Align(
                  alignment: Alignment.centerRight,
                  child: MaterialButton(
                    onPressed: (){
                      //code untuk pindah pager
                      Navigator.push(context, MaterialPageRoute(builder: (context)
                      => const PageBottomNavigationBar()
                      ));
                    },
                    child: const Text(
                      'Skip',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 12
                      ),
                    ),
                    color: Colors.white,
                    textColor: Colors.black38,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
