class Pak {
  String id = '';
  String name = '';
  String type = '';
  String url = '';

  Pak createPak(record) {
    Map<String, dynamic> attributes = {
      'id': '',
      'name': '',
      'type': '',
      'url': '',
    };

    record.forEach((key, value) => {attributes[key] = value});
    Pak pak = new Pak();
    pak.id = attributes['id'];
    pak.name = attributes['name'];
    pak.type = attributes['type'];
    pak.url = attributes['url'];

    return pak;
  }
}
