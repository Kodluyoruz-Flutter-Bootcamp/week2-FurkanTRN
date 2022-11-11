import 'package:date_format/date_format.dart';

String DateFormat(DateTime? date){
  return formatDate(date!, [dd, '.', mm, '.', yyyy, ' ', HH, ':', nn]);
}