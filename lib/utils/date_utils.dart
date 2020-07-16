class DateUtils {
  static String verboseDate(DateTime tm, {bool withTime = true}) {
    tm = DateTime(tm.year, tm.month, tm.day, tm.hour, tm.minute, tm.second);
    DateTime today = new DateTime.now();
    Duration oneDay = new Duration(days: 1);
    Duration twoDay = new Duration(days: 2);
    Duration oneWeek = new Duration(days: 7);
    String month;
    switch (tm.month) {
      case 1:
        month = 'janeiro';
        break;
      case 2:
        month = 'fevereiro';
        break;
      case 3:
        month = 'março';
        break;
      case 4:
        month = 'abril';
        break;
      case 5:
        month = 'maio';
        break;
      case 6:
        month = 'junho';
        break;
      case 7:
        month = 'julho';
        break;
      case 8:
        month = 'agosto';
        break;
      case 9:
        month = 'setembro';
        break;
      case 10:
        month = 'outubro';
        break;
      case 11:
        month = 'novembro';
        break;
      case 12:
        month = 'dezembro';
        break;
    }

    Duration difference = today.difference(tm);

    String result = '';

    if (difference.compareTo(oneDay) < 1) {
      result = 'hoje';
    } else if (difference.compareTo(twoDay) < 1) {
      result = 'ontem';
    } else if (difference.compareTo(oneWeek) < 1) {
      switch (tm.weekday) {
        case 1:
          result = 'segunda';
          break;
        case 2:
          result = 'terça';
          break;
        case 3:
          result = 'quarta';
          break;
        case 4:
          result = 'quinta';
          break;
        case 5:
          result = 'sexta';
          break;
        case 6:
          result = 'sábado';
          break;
        case 7:
          result = 'domingo';
          break;
      }
    } else if (tm.year == today.year) {
      result = '${tm.day} de $month';
    } else {
      result = '${tm.day} de $month de ${tm.year}';
    }

    if (withTime) {
      return result + ' às ${tm.hour}:${tm.minute.toString().padLeft(2, '0')}';
    } else {
      return result;
    }
  }
}
