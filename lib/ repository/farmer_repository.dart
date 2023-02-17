import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';
import 'package:Farmdrive/data/crop_data.dart';
import '../data/api/api_client.dart';
import '../data/farmer_model.dart';
import '../data/model/crop_pricing.dart';
import '../utilities/AppConstants.dart';

class FarmerRepo{
  final SharedPreferences sharedPreferences;
  ApiClient apiClient;
  FarmerRepo({required this.sharedPreferences,required this.apiClient});

  List<String> selectedFarmerList = [];
  void addSelectedFarmer(List<FarmerModel> selectedFarmerItem){
    selectedFarmerList = [];
    for(var element in selectedFarmerItem){
      selectedFarmerList.add(jsonEncode(element));
      print('farmer repo'+jsonEncode(element));
    }
    sharedPreferences.setStringList('selectedFarmerList',selectedFarmerList);
  }

  List<FarmerModel> getSelectedFarmer(){
    List<FarmerModel> selectedFarmerItem = [];
    if(sharedPreferences.containsKey('selectedFarmerList')){
      //remove();

      selectedFarmerList = sharedPreferences.getStringList('selectedFarmerList')!;
    }
    for(var element in selectedFarmerList){
      print('farmer repo'+jsonEncode(element));
      selectedFarmerItem.add(FarmerModel.fromJson(jsonDecode(element)));
    }
    print('selectedFarmerList length is '+selectedFarmerList.length.toString());
    return selectedFarmerItem;
  }

  void remove(){
    selectedFarmerList = [];
    selectedCropList = [];
    sharedPreferences.remove('selectedFarmerList');
    sharedPreferences.remove('selectedCropList');
  }

  Future<Response>  getFarmers() async{
    return await apiClient.getData(AppConstants.FARMERS_URI);
  }

  Future<Response>  getCropFarmers() async{
    return await apiClient.getData(AppConstants.GET_FARMERS_URI);
  }

  Future<Response> editCropPricing(dynamic body) async{
    return await apiClient.postData(AppConstants.EDIT_CROP_PRICING,body);
  }

  Future<Response> getCropPricing() async{
    return await apiClient.getData(AppConstants.GET_CROP_PRICING);
  }

  addToSelectedCropList(List<String> selectedCropList){
    sharedPreferences.setStringList('selectedCropList', selectedCropList);
  }

  List<String> selectedCropList = [];
  List<String> getSelectedCropList(){

    if(sharedPreferences.containsKey('selectedCropList')){
      selectedCropList = sharedPreferences.getStringList('selectedCropList')!;
    };
    return selectedCropList;
  }

  List<String>  cropPricingList = [];

  void addToCropPricingList(List<CropPricing> cropPricingItems ){
    cropPricingList = [];
    for (var element in cropPricingItems) {
      cropPricingList.add(jsonEncode(element));
    }
    sharedPreferences.setStringList('cropPricingList',cropPricingList);
  }

  List<CropPricing> getCropPricingList(){
    List<CropPricing> cropPricingItems = [];

    if(sharedPreferences.containsKey('cropPricingList')){
      cropPricingList = sharedPreferences.getStringList('cropPricingList')!;
    }
    for(var element in cropPricingList) {
      cropPricingItems.add(CropPricing.fromJson(jsonDecode(element)));
    }
    return cropPricingItems;
  }




}