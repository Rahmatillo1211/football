class PlayersModel {
  int? playerNumber;
  int? id;
  String? name;
  String? position;

  PlayersModel({this.playerNumber, this.id, this.name, this.position});

  PlayersModel.fromJson(Map<String, dynamic> json) {
    playerNumber = json['player_number'];
    id = json['id'];
    name = json['name'];
    position = json['position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['player_number'] = this.playerNumber;
    data['id'] = this.id;
    data['name'] = this.name;
    data['position'] = this.position;
    return data;
  }
}
