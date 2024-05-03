class Barang {
  int id;
  String kodebarang;
  String namabarang;

  Barang(this.id, this.kodebarang, this.namabarang);

  factory Barang.fromJson(Map<String, dynamic> json) => Barang(
    json["id"],
    json["kodebarang"],
    json["namabarang"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "kodebarang": kodebarang,
    "namabarang": namabarang
  };
}
