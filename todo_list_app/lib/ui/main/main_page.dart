import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List<Widget> _pages = [];
  int _currentPage = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _pages = [
      Container(color: Colors.red,),
      Container(color: Colors.green,),
      Container(color: Colors.yellow,),
      Container(color: Colors.blue,),
      Container(color: Colors.purple,)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: _pages.elementAt(_currentPage),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff363636),
        unselectedItemColor: Colors.white,
        selectedItemColor: const Color(0xff8687E7),
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentPage,
        onTap: (index){
          if(index == 2){

          }
          setState(() {
            _currentPage = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              backgroundColor: Colors.transparent,
              icon: Image.asset(
                "assets/images/home2.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
              label: 'Index',
              activeIcon: Image.asset(
                "assets/images/home2.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
                color: const Color(0xff8687E7),
              )),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/calendar.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
              label: 'Calendar',
              activeIcon: Image.asset(
                "assets/images/calendar.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
                color: const Color(0xff8687E7),
              ),
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Container(),
              label: '',
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/clock.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
              label: 'Focuse',
              activeIcon: Image.asset(
                "assets/images/clock.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
                color: const Color(0xff8687E7),
              ),
              backgroundColor: Colors.transparent),
          BottomNavigationBarItem(
              icon: Image.asset(
                "assets/images/user.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
              ),
              label: 'Profile',
              activeIcon: Image.asset(
                "assets/images/user.png",
                width: 24,
                height: 24,
                fit: BoxFit.fill,
                color: const Color(0xff8687E7),
              ),
              backgroundColor: Colors.transparent)
        ],
      ),
      floatingActionButton: Container(
        width: 64,
        height: 64,
        decoration: BoxDecoration(
          color:const Color(0xff8687E7),
          borderRadius: BorderRadius.circular(32)
        ),
        child: IconButton(
          onPressed: (){
            setState(() {
              _currentPage = 2;
            });
          },
          icon: Icon(Icons.add,size: 30,color: Colors.white,),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
