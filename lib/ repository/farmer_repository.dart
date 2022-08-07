import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:untitled3/data/farmer_data.dart';

class FarmerRepo{
  final SharedPreferences sharedPreferences;
  FarmerRepo({required this.sharedPreferences});

  List<String> selectedFarmerList = [];

  void addSelectedFarmer(List<Farmer> selectedFarmerItem){
    selectedFarmerList = [];
    for(var element in selectedFarmerItem){
      selectedFarmerList.add(jsonEncode(element));
    }
    sharedPreferences.setStringList('selectedFarmerList',selectedFarmerList);
  }

  List<Farmer> getSelectedFarmer(){
    List<Farmer> selectedFarmerItem = [];
    if(sharedPreferences.containsKey('selectedFarmerList')){
      selectedFarmerList = sharedPreferences.getStringList('selectedFarmerList')!;
    }
    for(var element in selectedFarmerList){
      selectedFarmerItem.add(Farmer.fromJson(jsonDecode(element)));
    }
    print('selectedFarmerList length is '+selectedFarmerList.length.toString());
    return selectedFarmerItem;
  }

  void remove(){
    selectedFarmerList = [];
    sharedPreferences.remove('selectedFarmerList');
  }
}