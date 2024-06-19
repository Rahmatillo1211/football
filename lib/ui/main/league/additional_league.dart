import 'package:fantasy_football/ui/main/league/add_league.dart';
import 'package:fantasy_football/utils/list/rating_list.dart';
import 'package:fantasy_football/widgets/container/rating_conatiner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AdditionalLeague extends StatefulWidget {
  const AdditionalLeague({super.key});

  @override
  State<AdditionalLeague> createState() => _AdditionalLeagueState();
}

class _AdditionalLeagueState extends State<AdditionalLeague> {
  double rating = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title: const Text(
          "Qo'shimcha Ligalar",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: _buildBody(context),
    );
  }

  _buildBody(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const RatingContainer(
            titleNumber: '#',
            teamNames: 'Jamoalar',
            typeNumber: 'Shu Tur',
            ptsNumber: 'Hammasi',
            imageName: '',
            isMain: true,
            firstFour: true,
            secondTwo: true,
            thirdOne: true,
            isMine: true,
          ),
          _buildRatingContainer(ratingList),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
                Get.to(const AddLeague());
            },
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey.shade300,
                    width: 1,
                  ),
                ),
              ),
              height: 40,
              child: const Row(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Qo'shimcha Liga Ochish",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),

                  Icon(
                        Icons.add_circle,
                        color: Color(0xff1FDE00),
                      )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10),
            child: Text(
              "Liga Nomi",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "Uzb Cup",
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                const Column(
                  children: [
                    Text("Min"),
                    Text("4.5\$",
                        style:
                            TextStyle(color: Color(0xff1FDE00), fontSize: 12)),
                  ],
                ),
                Expanded(
                    child: Container(
                  child: Slider(
                      activeColor: Color(0xff1FDE00),
                      value: rating,
                      onChanged: (newRating) {
                        setState(() {
                          rating = newRating;
                        });
                      }),
                )),
                Column(
                  children: [
                    Text("Max"),
                    Text("9.5\$",
                        style:
                            TextStyle(color: Color(0xff1FDE00), fontSize: 12)),
                  ],
                ),
              ],
            ),
          ),

          GestureDetector(
            onTap: (){

            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade300,
                        width: 1,
                      ),
                    ),
                  ),
                  height: 40,
                  width: 130,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        child: Text(
                          "Upload",
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Icon(
                            CupertinoIcons.upload_circle,
                            color: Color(0xff1FDE00),
                          )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: double.infinity,
                  // height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                      //   Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage(),),);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00B900),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 15,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "61DWKPEX03",
                          style: TextStyle(fontSize: 24, color: Colors.white),
                        ),
                        Icon(
                          Icons.copy,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _buildRatingContainer(List<Map<String, dynamic>> data) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: 8,
      itemBuilder: (BuildContext context, int index) {
        bool isFirstFour = index >= 0 && index <= 3;
        bool isSecondTwo = index == 4 || index == 5;
        bool isThirdOne = index == 6;
        bool isMine = index == 7;
        return RatingContainer(
          titleNumber: data[index]['titleNumber'],
          teamNames: data[index]['teamNames'],
          typeNumber: data[index]['typeNumber'],
          ptsNumber: data[index]['ptsNumber'],
          imageName: data[index]['imageName'],
          isMain: true,
          firstFour: isFirstFour,
          secondTwo: isSecondTwo,
          thirdOne: isThirdOne,
          isMine: isMine,
        );
      },
    );
  }
}
