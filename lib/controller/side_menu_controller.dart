import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SideMenuController extends GetxController {
  RxInt index = 0.obs;

  void selectIndex(int index) {
    this.index.value = index;
    update();
  }

  var pages = [
    TodayScreen(),
    Container(
      color: Colors.green,
      child: Text(
        "Tes 2",
        textAlign: TextAlign.center,
      ),
    )
  ];
}

class TodayScreen extends StatelessWidget {
  const TodayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final formatter = DateFormat('EEEE, d MMMM');
    final todayDateInString = formatter.format(now);

    return Container(
      color: Color(0xffe3e3e3),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 10,
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.sunny),
                              SizedBox(
                                width: 12,
                              ),
                              Text("Today", style: TextStyle(
                                fontSize: 24,
                              ),)
                            ],
                          ),
                          SizedBox(height: 8,),
                          Text(todayDateInString),
                        ],
                      ),
                    )),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        IconButton(
                          icon: Icon(Icons.sort),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.group),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.lightbulb),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            TextField(
              decoration: InputDecoration(
                hintText: 'Add a task',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
