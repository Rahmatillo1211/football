import 'package:fantasy_football/ui/main/league/additional_league.dart';
import 'package:fantasy_football/utils/list/rating_list.dart';
import 'package:fantasy_football/widgets/container/rating_conatiner.dart';
import 'package:flutter/material.dart';

class LeagueRound extends StatelessWidget {
  const LeagueRound({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white10,
        elevation: 0,
        title: const Text(
          '1 - 3 Tur',
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
        children: [
          const RatingContainer(
            titleNumber: '#',
            teamNames: 'Jamoalar',
            typeNumber: 'Shu Tur',
            ptsNumber: 'Hammasi',
            imageName: '',
            isMain: false,
            firstFour: false,
            secondTwo: false,
            thirdOne: false,
            isMine: false,
          ),
          _buildRatingContainer(ratingList),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0,),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [

                SizedBox(height: 20,),
                SizedBox(
                  width: double.infinity,
                  // height: 52,
                  child: ElevatedButton(
                    onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>const AdditionalLeague(),),);
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
                    child: const Text(
                      "Qo'shimcha Ligalar",
                      style: TextStyle(fontSize: 24, color: Colors.white),
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
      itemCount: data.length,
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
          thirdOne: isThirdOne, isMine: isMine,
        );
      },
    );
  }
}