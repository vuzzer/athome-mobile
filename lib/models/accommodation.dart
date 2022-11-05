class Accommodation {
  final String id;
  final String nomResidence;
  final String cuisineDisp;
  final String typeProp;
  final String climDisp;
  final String prixSejour;
  final String quartier;
  final String tvDisp;
  final String villeResidence;
  final String wifiDisp;

  const Accommodation({
    this.id,
    this.nomResidence,
    this.cuisineDisp,
    this.typeProp,
    this.climDisp,
    this.prixSejour,
    this.quartier,
    this.tvDisp,
    this.villeResidence,
    this.wifiDisp,
  });

  factory Accommodation.fromJson(Map<String, dynamic> json) {
    return Accommodation(
      id: json['id'],
      nomResidence: json['nomResidence'],
      cuisineDisp: json['cuisineDisp'],
      typeProp: json['typeProp'],
      climDisp: json['climDisp'],
      prixSejour: json['prixSejour'],
      quartier: json['quartier'],
      tvDisp: json['tvDisp'],
      villeResidence: json['villeResidence'],
      wifiDisp: json['wifiDisp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomResidence': nomResidence,
      'cuisineDisp': cuisineDisp,
      'typeProp': typeProp,
      'climDisp': climDisp,
      'prixSejour': prixSejour,
      'quartier': quartier,
      'tvDisp': tvDisp,
      'villeResidence': villeResidence,
      'wifiDisp': wifiDisp,
    };
  }
}
