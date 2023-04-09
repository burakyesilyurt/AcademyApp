class Quiz {
  int id = 0;
  static int count = 0;

  String soru;
  String dogruCevap;
  String yanlisCevap1;
  String yanlisCevap2;

  Quiz(this.soru, this.dogruCevap, this.yanlisCevap1, this.yanlisCevap2) {
    count++;
    id = count;
  }
}
