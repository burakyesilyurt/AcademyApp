class Notes {
  static int count = 1;
  String baslik;
  String note;
  int id = 1;
  Notes(this.baslik, this.note) {
    count++;
    id = count;
  }
}
