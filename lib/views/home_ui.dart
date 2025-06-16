import 'package:flutter/material.dart';
import 'package:food_near_me_app/views/widgets/%E0%B9%89homewid/formsearch.dart';

import 'login_ui.dart';
import 'widgets/้homewid/item.dart';
import 'widgets/้homewid/slideim.dart';

class HomeUi extends StatelessWidget {
  const HomeUi({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.pink[200],

        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              "assets/imgs/logoHome.png",
              height: 8 * 10,
              fit: BoxFit.contain,
            ),
          ),
          toolbarHeight: 8 * 12,
          automaticallyImplyLeading: false,
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (context) => LoginUi()));
              },
              child: const Text(
                "ล็อคอิน",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(width: 10),
          ],
        ),

        floatingActionButton: Padding(
          padding: const EdgeInsets.only(top: 8 * 3),
          child: Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border(
                top: BorderSide(
                  color: const Color.fromARGB(255, 255, 175, 201),
                  width: 2,
                ),
              ),

              // borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: FloatingActionButton(
              onPressed: () {
                print('Profile FAB pressed!');
              },
              backgroundColor: const Color.fromARGB(255, 204, 187, 255),
              shape: const CircleBorder(),
              elevation: 0,
              child: const Icon(Icons.person, color: Colors.white, size: 35),
            ),
          ),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,

        bottomNavigationBar: BottomAppBar(
          color: Colors.pink[200],
          shape: const CircularNotchedRectangle(),
          notchMargin: 18.0,
          height: 70.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        print('Favorite button pressed');
                      },
                      icon: const Icon(
                        Icons.star_border,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Favorite",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        print('Home button pressed');
                      },
                      icon: const Icon(
                        Icons.home,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30.0),
                    topRight: Radius.circular(30.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Formsearch(),
                        Slideim(),
                        SizedBox(height: 8),
                        RestaurantCard(
                          imageUrl:
                              'assets/imgs/pama.png', // เปลี่ยนเป็น path รูปของคุณ
                          restaurantName: 'Pasta AMA',
                          description:
                              'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
                          rating: 5, // 5 ดาว
                          isOpen: false, // ปิด
                          showMotorcycleIcon: false, // ไม่แสดงไอคอนหมวกกันน็อก
                        ),
                         RestaurantCard(
                          imageUrl:
                              'assets/imgs/pama.png', // เปลี่ยนเป็น path รูปของคุณ
                          restaurantName: 'Pasta AMA',
                          description:
                              'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
                          rating: 3.5, // 5 ดาว
                          isOpen: true, // ปิด
                          showMotorcycleIcon: true, // ไม่แสดงไอคอนหมวกกันน็อก
                        ),
                        RestaurantCard(
                          imageUrl:
                              'assets/imgs/pama.png', // เปลี่ยนเป็น path รูปของคุณ
                          restaurantName: 'Pasta AMA',
                          description:
                              'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
                          rating: 1.5, // 5 ดาว
                          isOpen: true, // ปิด
                          showMotorcycleIcon: true, // ไม่แสดงไอคอนหมวกกันน็อก
                        ),
                        RestaurantCard(
                          imageUrl:
                              'assets/imgs/pama.png', // เปลี่ยนเป็น path รูปของคุณ
                          restaurantName: 'Pasta AMA',
                          description:
                              'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
                          rating: 0.5, // 5 ดาว
                          isOpen: true, // ปิด
                          showMotorcycleIcon: false, // ไม่แสดงไอคอนหมวกกันน็อก
                        ),
                        RestaurantCard(
                          imageUrl:
                              'assets/imgs/pama.png', // เปลี่ยนเป็น path รูปของคุณ
                          restaurantName: 'Pasta AMA',
                          description:
                              'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
                          rating: 4.5, // 5 ดาว
                          isOpen: false, // ปิด
                          showMotorcycleIcon: true, // ไม่แสดงไอคอนหมวกกันน็อก
                        ),
                        RestaurantCard(
                          imageUrl:
                              'assets/imgs/pama.png', // เปลี่ยนเป็น path รูปของคุณ
                          restaurantName: 'Pasta AMA',
                          description:
                              'ร้านพาสต้าสไตล์อิตาลีแท้ๆ ราคาไม่แพง ที่อยู่ กรุงเทพฯ รายละเอียดเพิ่มเติม คลิกได้เลย',
                          rating: 0.1, // 5 ดาว
                          isOpen: true, // ปิด
                          showMotorcycleIcon: false, // ไม่แสดงไอคอนหมวกกันน็อก
                        ),
                        
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
