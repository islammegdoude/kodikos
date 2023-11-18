import 'package:flutter/material.dart';
import 'package:kodikos/shared/components/constants.dart';

import '../../shared/components/components.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key? key}) : super(key: key);
  var search_controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(
            top: 30,
            right: 25,
            left: 25,
          ),
          child: Column(
            children: [
              // App Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Message',
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  // notification button
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: primaryColor,
                        width: 1,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon:
                          const Icon(Icons.more_horiz,color: primaryColor, ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 25,
              ),
              // search bar
              defultFormField(
                controller: search_controller,
                keyboardType: TextInputType.text,
                validator: (value) {},
                textlabel: 'Search',
                prefixIcon: Icons.search,
              ),
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => chatItem(),
                    separatorBuilder: (context, index) =>
                        const SizedBox(height: 30),
                    itemCount: 20,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget chatItem() => const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('assets/images/islam.jpg'),
            radius: 30,
          ),
          SizedBox(width: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Islam Megdoude',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 8,),
                Text(
                  'Hello ya khra',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const  [
              Text(
                '17:50',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
              CircleAvatar(
                radius: 10,
                backgroundColor: Colors.blue,
                child: Text(
                  '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ],
      );
}
