
class Validations {
  
  bool isDateValid(String date) {
  RegExp regex =
      RegExp(r'^(19\d{2}|20\d{2}|2100)/(0[1-9]|1[0-2])/([1-9]|[12][0-9]|3[01])$');
  return regex.hasMatch(date);
}
 

}