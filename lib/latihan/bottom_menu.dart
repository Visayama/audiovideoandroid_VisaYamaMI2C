import 'package:flutter/material.dart';
import 'session_manager.dart';
import 'latihan audio.dart';
import 'package:audiovideoandroid/latihan/latihan audio.dart';

class PageBottomNavigationBar extends StatefulWidget {
  const PageBottomNavigationBar({Key? key});

  @override
  State<PageBottomNavigationBar> createState() =>
      _PageBottomNavigationBarState();
}

class _PageBottomNavigationBarState extends State<PageBottomNavigationBar>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  Color? containerColor;
  late SessionManager sessionManager;

  @override
  void initState() {
    super.initState();
    sessionManager = SessionManager();
    sessionManager.getSession();
    tabController = TabController(length: 4, vsync: this);
    containerColor = Colors.transparent;
    tabController.addListener(_handleTabSelection);
  }

  void _handleTabSelection() {
    setState(() {
      containerColor = Colors.blue;
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            containerColor = Colors.blue;
          });
        },
        child: TabBarView(
          controller: tabController,
          children: [
            // content
            PageBeranda(),
          ],
        ),
      ),
      bottomNavigationBar:
      BottomAppBar(
        color: Colors.orange,
        child: SingleChildScrollView(
          child: Container(
            height: 50.5,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: TabBar(
              indicatorColor: Colors.white,
              controller: tabController,
              labelColor: Colors.blue,
              tabs: const [
                Tab(
                  icon: Icon(Icons.search,
                  color: Colors.white,),
                ),
                Tab(
                  icon: Icon(Icons.music_note,
                    color: Colors.white,),
                ),
                Tab(
                  icon: Icon(Icons.favorite,
                    color: Colors.white,),
                ),
                Tab(
                  icon: Icon(Icons.person,
                    color: Colors.white,),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}