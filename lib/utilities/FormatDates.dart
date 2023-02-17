
import 'package:intl/intl.dart';

String getDate(String date){

  DateTime dateTime = DateTime.parse(date);

  final now = DateTime.now();
  final today = DateTime(now.year,now.month,now.day);
  final yesterday = DateTime(now.year,now.month,now.day-1);
  final twoDaysAgo = DateTime(now.year,now.month,now.day-2);
  final threeDaysAgo = DateTime(now.year,now.month,now.day-3);
  final fourDaysAgo= DateTime(now.year,now.month,now.day-4);
  final fiveDaysAgo = DateTime(now.year,now.month,now.day-5);
  final sixDaysAgo= DateTime(now.year,now.month,now.day-6);

  final aDate = DateTime(dateTime.year,dateTime.month,dateTime.day);

  if(aDate == today){
    return 'Today';
  }else if(aDate == yesterday){
    return 'Yesterday';
  }else if(aDate == twoDaysAgo){
       var  weekDay = DateFormat('EEEE').format(dateTime);
       var  day = DateFormat('d').format(dateTime);
    return '$weekDay'+', $day';
  }else if(aDate == threeDaysAgo){
    var  weekDay = DateFormat('EEEE').format(dateTime);
    var  day = DateFormat('d').format(dateTime);
    return weekDay+', $day';
  }else if(aDate == fourDaysAgo){
    var  weekDay = DateFormat('EEEE').format(dateTime);
    var  day = DateFormat('d').format(dateTime);
    return weekDay+', $day';
  }else if(aDate == fiveDaysAgo){
    var  weekDay = DateFormat('EEEE').format(dateTime);
    var  day = DateFormat('d').format(dateTime);
    return weekDay+', $day';
  }else if(aDate == sixDaysAgo){
    var  weekDay = DateFormat('EEEE').format(dateTime);
    var  day = DateFormat('d').format(dateTime);
    return weekDay+', $day';
  }else{
    var  monthDay = DateFormat('MMMMd').format(dateTime);
    return monthDay;
  }
}