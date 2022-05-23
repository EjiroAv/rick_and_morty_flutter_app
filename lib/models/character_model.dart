import 'dart:convert';

CharacterResponse characterResponseFromJson(String str) =>
    CharacterResponse.fromJson(json.decode(str));

String characterResponseToJson(CharacterResponse data) =>
    json.encode(data.toJson());

class CharacterResponse {
  Info info;
  List<Result> results;

  CharacterResponse({
    required this.info,
    required this.results,
  });

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      CharacterResponse(
        info: Info.fromJson(json["info"]),
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  int count;
  int pages;
  String next;
  String? prev;

  Info({
    required this.count,
    required this.pages,
    required this.next,
    this.prev,
  });

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

class Result {
  int id;
  String name;
  String? status;
  String? species;
  String type;
  String? gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  Result({
    required this.id,
    required this.name,
    this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        id: json["id"],
        name: json["name"],
        status: json["status"],
        species: json["species"],
        type: json["type"],
        gender: json["gender"],
        origin: Location.fromJson(json["origin"]),
        location: Location.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "status": status,
        "species": speciesValues.reverse[species],
        "type": type,
        "gender": genderValues.reverse[gender],
        "origin": origin.toJson(),
        "location": location.toJson(),
        "image": image,
        "episode": List<dynamic>.from(episode.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}

enum Gender { male, female, unknown }

final genderValues = EnumValues(
    {"Female": Gender.female, "Male": Gender.male, "Unknown": Gender.unknown});

class Location {
  String name;
  String url;

  Location({
    required this.name,
    required this.url,
  });

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

enum Species { human, alien }

final speciesValues =
    EnumValues({"Alien": Species.alien, "Human": Species.human});

enum Status { alive, unknown, dead }

final statusValues = EnumValues(
    {"Alive": Status.alive, "Dead": Status.dead, "Unknown": Status.unknown});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap;
    return reverseMap;
  }
}
