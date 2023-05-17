class StateArea {
  String? id;
  String? name;

  StateArea({
     this.id,
     this.name,
  });

  factory StateArea.fromJson(Map<String, dynamic> json) => StateArea(
    id: json["id"],
    name: json["name"],
  );
  static List<StateArea> areasFromSnapshot(List areaSnapshot) {
    return areaSnapshot.map((json) {
      return StateArea.fromJson(json);
    }).toList();
  }

}
