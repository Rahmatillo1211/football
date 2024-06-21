import 'package:fantasy_football/ui/main/calendar/calendar.dart';
import 'package:fantasy_football/ui/main/my_team/my_team.dart';
import 'package:fantasy_football/ui/main/transfer/transfer.dart';
import 'package:fantasy_football/ui/other_pages/rating_page.dart';

import '../../ui/main/league/league_round.dart';
import '../../ui/main/points/points.dart';

List<Map<String, dynamic>> buttomData = [
  {
    'image': 'assets/images/achko.png',
    'text': 'Ochko\'lar',
    'navigation':  const Points(),
    'text2': ''

  },
  {
    'image': 'assets/images/team.png',
    'text': 'Mening Jamoam',
    'navigation': const MyTeam(),
    'text2': ''

  },
  {
    'image': 'assets/images/calendar.png',
    'text': 'Taqvim',
    'navigation': const CalendarPage(),
    'text2': ''
  },
  {
    'image': 'assets/images/ecschange.png',
    'text': 'Transfer',
    'navigation': const Transfer(),
    'text2': ''

  },
  {
    'image': 'assets/images/liga.png',
    'text': 'Ligalar',
    'navigation': const LeagueRound(),
    'text2': ''

  },
  {
    'image': 'assets/images/rating.png',
    'text': 'Reyting',
    'navigation': const RatingPage(),
    'text2': ''

  },
];
