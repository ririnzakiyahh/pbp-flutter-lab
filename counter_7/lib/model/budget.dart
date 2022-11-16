class Budget {
  static List<Budget> budgets = [];
  String judul;
  int nominal;
  String jenis;
  DateTime date;

  Budget({required this.judul, required this.nominal, required this.jenis, required this.date,
  });

  static void addBudget({required judul, required nominal, required jenis, required date,
  }) {
    budgets.add(Budget(
      judul: judul,
      nominal: nominal,
      jenis: jenis,
      date: date,
    ));
  }
}