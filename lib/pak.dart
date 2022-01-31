class Pak {
  String PlayPakUniqueID = '';
  String PlayPakName = '';
  String PlayPakGroupID = '';
  String PlayPakPhoto1 = '';
  String PlayPakPrice = '';
  String PlayPakDescription = '';
  String PlayPakLevel = '';
  String PlayPakArea = '';
  String PlayPakNumofPlays = '';
  String PlayPakFormation = '';
  String PlayPakLineUp = '';
  String PlayPakDivision = '';
  String PlayPakActive = '';

  Pak createPak(record) {
    Map<String, dynamic> attributes = {
      'PlayPakUniqueID': '',
      'PlayPakName': '',
      'PlayPakGroupID': '',
      'PlayPakPhoto1': '',
      'PlayPakPrice': '',
      'PlayPakDescription': '',
      'PlayPakLevel': '',
      'PlayPakArea': '',
      'PlayPakNumofPlays': '',
      'PlayPakFormation': '',
      'PlayPakLineUp': '',
      'PlayPakDivision': '',
      'PlayPakActive': '',
    };

    record.forEach((key, value) => {attributes[key] = value});
    Pak pak = new Pak();
    pak.PlayPakUniqueID = attributes['PlayPakUniqueID'];
    pak.PlayPakName = attributes['PlayPakName'];
    pak.PlayPakGroupID = attributes['PlayPakGroupID'];
    pak.PlayPakPhoto1 = attributes['PlayPakPhoto1'];
    pak.PlayPakPrice = attributes['PlayPakPrice'];
    pak.PlayPakDescription = attributes['PlayPakDescription'];
    pak.PlayPakLevel = attributes['PlayPakLevel'];
    pak.PlayPakArea = attributes['PlayPakArea'];
    pak.PlayPakNumofPlays = attributes['PlayPakNumofPlays'];
    pak.PlayPakFormation = attributes['PlayPakFormation'];
    pak.PlayPakDivision = attributes['PlayPakDivision'];
    pak.PlayPakActive = attributes['PlayPakActive'];

    return pak;
  }

  Map<String, dynamic> toJson() {
    return {
      'PlayPakUniqueID': this.PlayPakUniqueID,
      'PlayPakName': this.PlayPakName,
      'PlayPakGroupID': this.PlayPakGroupID,
      'PlayPakPhoto1': this.PlayPakPhoto1,
      'PlayPakPrice': this.PlayPakPrice,
      'PlayPakDescription': this.PlayPakDescription,
      'PlayPakLevel': this.PlayPakLevel,
      'PlayPakArea': this.PlayPakArea,
      'PlayPakNumofPlays': this.PlayPakNumofPlays,
      'PlayPakFormation': this.PlayPakFormation,
      'PlayPakDivision': this.PlayPakDivision,
      'PlayPakActive': this.PlayPakActive,
    };
  }

  Map<String, dynamic> saveID() {
    return {
      'PlayPakUniqueID': this.PlayPakUniqueID,
      'PlayPakGroupID': this.PlayPakGroupID,
    };
  }
}
