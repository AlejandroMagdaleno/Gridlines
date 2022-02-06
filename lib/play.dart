class Play {
  String PlayCategory = '';
  String PlayFormation = '';
  String PlayName = '';
  String PlayNotes = '';
  String PlayPakGroupID = '';
  String PlayPhoto = '';
  String PlayStyleofPlay = '';
  String PlayType = '';
  String PlayUniqueID = '';
  int PlayRanking = 0;
  int PlaySortnumber = 0;

  Play createPlay(record) {
    Map<String, dynamic> attributes = {
      'PlayCategory': '',
      'PlayFormation': '',
      'PlayName': '',
      'PlayNotes': '',
      'PlayPakGroupID': '',
      'PlayPhoto': '',
      'PlayStyleofPlay': '',
      'PlayType': '',
      'PlayUniqueID': '',
      'PlayRanking': '',
      'PlaySortnumber': '',
    };

    record.forEach((key, value) => {attributes[key] = value});
    Play play = new Play();

    play.PlayCategory = attributes['PlayCategory'];
    play.PlayFormation = attributes['PlayFormation'];
    play.PlayName = attributes['PlayName'];
    play.PlayNotes = attributes['PlayNotes'];
    play.PlayPakGroupID = attributes['PlayPakGroupID'];
    play.PlayPhoto = attributes['PlayPhoto'];
    play.PlayStyleofPlay = attributes['PlayStyleofPlay'];
    play.PlayType = attributes['PlayType'];
    play.PlayUniqueID = attributes['PlayUniqueID'];
    play.PlayRanking = attributes['PlayRanking'];
    play.PlaySortnumber = attributes['PlaySortnumber'];

    return play;
  }

  Map<String, dynamic> toJson() {
    return {
      'PlayCategory': this.PlayCategory,
      'PlayFormation': this.PlayFormation,
      'PlayName': this.PlayName,
      'PlayNotes': this.PlayNotes,
      'PlayPakGroupID': this.PlayPakGroupID,
      'PlayPhoto': this.PlayPhoto,
      'PlayStyleofPlay': this.PlayStyleofPlay,
      'PlayType': this.PlayType,
      'PlayUniqueID': this.PlayUniqueID,
      'PlayRanking': this.PlayRanking,
      'PlaySortnumber': this.PlaySortnumber,
    };
  }
}
