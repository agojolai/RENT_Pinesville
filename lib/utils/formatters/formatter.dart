import 'package:intl/intl.dart';
// todo wala ka naman ifoformat gaga
class PFormatter{
  static String formatDate(DateTime ? date) {
    date ?? DateTime.now();
    return DateFormat('MMM-dd-yyyy').format(date!);
  } //TAMA BA YUNG NULL SA DATE


}