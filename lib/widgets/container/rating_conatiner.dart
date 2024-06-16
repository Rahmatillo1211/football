import 'package:flutter/material.dart';

class RatingContainer extends StatelessWidget {
  final bool isMain;
  final String titleNumber;
  final String teamNames;
  final String typeNumber;
  final String ptsNumber;
  final String imageName;
  const RatingContainer({
    super.key,
    required this.titleNumber,
    required this.teamNames,
    required this.typeNumber,
    required this.ptsNumber,
    required this.imageName,
    required this.isMain,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.shade600,
                  width: 0.5,
                ),
              ),
            ),
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Row(
                children: [
                  Text(
                    titleNumber,
                    style: TextStyle(
                      fontSize: 16,
                      color: isMain ? Colors.black : Colors.grey,
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  isMain
                      ? Image.asset(
                          imageName,
                        )
                      : const SizedBox(),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(teamNames,
                      style: TextStyle(
                        fontSize: 16,
                        color: isMain ? Colors.black : Colors.grey,
                      )),
                  isMain
                      ? const SizedBox(
                          width: 200,
                        )
                      : const SizedBox(
                          width: 170,
                        ),
                  Text(typeNumber,
                      style: TextStyle(
                        fontSize: 16,
                        color: isMain ? Colors.black : Colors.grey,
                      )),
                  const Spacer(),
                  Text(
                    ptsNumber,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
