import 'package:fantasy_football/service/url_launcher_service.dart';
import 'package:fantasy_football/utils/list/buttom_list3.dart';
import 'package:fantasy_football/widgets/buttoms/buttom_widget.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const Text(
          "Sozlamalar",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {

            },
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.black,
              size: 34,
            ),
          )
        ],
      ),
    );
  }

  _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            _buildButton(buttomData3),
            const SizedBox(
              height: 31,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () async{
                  await  LaunchUrl.facebookCall();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/images/facebook.png'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async{
                    await  LaunchUrl.twitterCall();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/images/twitter.png'),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                GestureDetector(
                  onTap: () async{
                    await  LaunchUrl.instagramCall();
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 60,
                    width: 60,
                    child: Image.asset('assets/images/instagram.png'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildButton(List<Map<String, dynamic>> data) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return ButtomWidget(
          text: data[index]['text'],
          image: data[index]['image'],
          pressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => data[index]['navigation'],
              ),
            );
          },
        );
      },
    );
  }
}
