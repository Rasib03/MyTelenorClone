class Package {
  static final Package _package = Package._internal();
  Package._internal();
  factory Package() {
    return _package;
  }

  int internet = 0;
  int offnetmins = 0;
  int onnetmins = 0;
  bool payment = false;

  void addInternet(int internet) {
    this.internet += internet;
  }

  void addOffnet(int mins) {
    offnetmins += mins;
  }

  void addOnnet(int mins) {
    onnetmins += mins;
  }
}
