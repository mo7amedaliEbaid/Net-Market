class CountryState {
  String? id;
  String? name;

  CountryState({
     this.id,
     this.name,
  });

  factory CountryState.fromJson(Map<String, dynamic> json) => CountryState(
    id: json["id"]??"",
    name: json["name"]??"",
  );
  static List<CountryState> statsFromSnapshot(List stateSnapshot) {
    return stateSnapshot.map((json) {
      return CountryState.fromJson(json);
    }).toList();
  }
}
