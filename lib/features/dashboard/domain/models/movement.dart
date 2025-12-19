//el molde de un prestamo o cobro

class Movement {
  final String title;
  final String date;
  final double amount;
  final bool isIncome; //True si es cobro, false si es prestamos

  Movement({
    required this.title,
    required this.date,
    required this.amount,
    required this.isIncome,
  });
}
