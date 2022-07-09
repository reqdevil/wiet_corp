class Weight {
  Weight({
    this.imperial,
    this.metric,
  });

  String? imperial;
  String? metric;

  factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json["imperial"],
        metric: json["metric"],
      );
}
