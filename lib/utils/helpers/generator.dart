abstract class CGenerator {
  // for generation
  static List<String> getYears(int startYear) {
    int currentYear = DateTime.now().year;
    List<String> years = [];
    // years descending order
    while (currentYear >= startYear) {
      years.add(currentYear.toString());
      currentYear--;
    }
    return years;
  }

  static List<String> getDays() {
    List<String> days = [];
    // years descending order
    for (int i = 1; i <= 31; i++) {
      days.add(i.toString());
    }
    return days;
  }

  static List<String> getMonths() {
    List<String> months = [];
    // years descending order
    for (int i = 1; i <= 12; i++) {
      months.add(i.toString());
    }
    return months;
  }

  static List<String> getPhoneCodes(){
    return [
      '+1', '+7', '+20', '+27', '+30', '+31', '+32', '+33', '+34', '+36','+39', '+40', '+41', '+43', '+44', '+45'
    ];
  }
}
