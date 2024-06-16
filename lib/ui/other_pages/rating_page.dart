import 'package:fantasy_football/utils/list/rating_list.dart';
import 'package:fantasy_football/widgets/container/rating_conatiner.dart';
import 'package:flutter/material.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildBody(context),
      appBar: AppBar(
      backgroundColor: Colors.white10,
        elevation: 0,
        title: const Text(
          'Reyting',
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  _buildBody(BuildContext context) {
    return Column(
      children: [
        const RatingContainer(
          titleNumber: '#',
          teamNames: 'Jamoalar',
          typeNumber: 'Shu Tur',
          ptsNumber: 'PTS',
          imageName: '',
          isMain: false,
        ),
        _buildRatingContainer(ratingList)
      ],
    );
  }

  _buildRatingContainer(List<Map<String, dynamic>> data) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: data.length,
      itemBuilder: (BuildContext context, int index) {
        return RatingContainer(
          titleNumber: data[index]['titleNumber'],
          teamNames: data[index]['teamNames'],
          typeNumber: data[index]['typeNumber'],
          ptsNumber: data[index]['ptsNumber'],
          imageName: data[index]['imageName'],
          isMain: true,
        );
      },
    );
  }
}
