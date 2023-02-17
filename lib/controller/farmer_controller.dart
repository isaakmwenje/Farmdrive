import 'dart:convert';

import 'package:get/get.dart';
import 'package:Farmdrive/%20repository/farmer_repository.dart';
import 'package:Farmdrive/data/crop_data.dart';
import 'package:Farmdrive/data/farmer_model.dart';
import 'package:Farmdrive/data/model/crop_pricing.dart';
import 'package:Farmdrive/data/vegetable_data.dart';

import '../data/cart_model.dart';
import '../data/model/response_model.dart';
import '../data/product_model.dart';

class FarmerController extends GetxController{

  FarmerRepo farmerRepo;
  FarmerController({required this.farmerRepo});

  Map _vegetableFarmers = {};
  Map<int,FarmerModel> _selectedFarmer = {};
  Map<int,FarmerModel> get selectedFarmer => _selectedFarmer;

  List<FarmerModel> storageItems = [];
  set setStorageItems (List<FarmerModel> selectedFarmerItems){
    storageItems  = selectedFarmerItems;
   for(var i=0;i<storageItems.length;i++){
   _selectedFarmer.putIfAbsent(storageItems[i].cropId!,() => storageItems[i]);
   //update();
   }
  }

  get getFarmerData{
    print('inside getFarmerData');
    setStorageItems = farmerRepo.getSelectedFarmer();
    return storageItems;
  }

 void setFarmer(FarmerModel farmerModel , {required ProductModel crop}) {
   if(_selectedFarmer.containsKey(crop.id)) {
     _selectedFarmer.update(crop.id!,(value){print(value.name);return farmerModel;});
   }else{
     _selectedFarmer.putIfAbsent(crop.id!,(){print('farmer'+farmerModel.name!);return farmerModel;});
   }
   farmerRepo.addSelectedFarmer(getSelectedFarmer());
   update();
  }

  List<FarmerModel> getSelectedFarmer(){
   return _selectedFarmer.entries.map((e){
      return e.value;
    }).toList();
  }

  FarmerModel? getFarmer(ProductModel crop){
   FarmerModel? farmerModel;
   _selectedFarmer.forEach((key,value){
     if(key == crop.id){
       farmerModel = value;
     }
   });
   return farmerModel;
  }

  bool checkFarmer(FarmerModel farmerModel){
   return  _selectedFarmer.containsValue(farmerModel);
  }


  void addVegetableFarmer(ProductModel crop){
    _vegetableFarmers = {};
    for(var farmer in _farmersList) {
      if(farmer.cropId == crop.id){
        _vegetableFarmers.putIfAbsent(farmer.id,(){
          return farmer;
        });
      }
     }
    }

  List  getFarmerList(ProductModel crop){
    addVegetableFarmer(crop);
    return _vegetableFarmers.entries.map((e){return e.value;}).toList();
  }

 void  remove(Cart cart){
  farmerRepo.remove();
    _selectedFarmer.remove(cart.type);
    update();
  }

  clearFarmerList(){
    _selectedFarmer = {};
    selectedCropList = [];
    farmerRepo.remove();
    update();
  }

  List<FarmerModel> _farmersList = [];
  List<FarmerModel>  get farmersList => _farmersList;

 // Future<void> getFarmers() async{
 //   Response response = await farmerRepo.getFarmers();
 //   if(response.statusCode == 200){
 //     _farmersList.addAll(Farmer.fromJson(response.body).farmers);
 //     update();
 //   }else{
 //     print('farmer error status'+ response.status.toString());
 //   }
 // }
  Future<void> getCropFarmers() async{
    Response response = await farmerRepo.getCropFarmers();
    if(response.statusCode == 200){
      _farmersList.addAll(Farmer.fromJson(response.body).farmers);
      update();
    }else{
      print('farmer error status'+ response.status.toString());
    }
  }

 List<String> selectedCropList = [];
 void addToSelectedCropList (String value){
    if(!selectedCropList.contains(value)) {
      selectedCropList.add(value);
    }
    farmerRepo.addToSelectedCropList(selectedCropList);
   update();
 }

 void removeFromSelectedCropList(String value){
   if(selectedCropList.contains(value)){
     selectedCropList.remove(value);
   };
   farmerRepo.addToSelectedCropList(selectedCropList);
   update();
  }


  void getSelectedCropList(){
    selectedCropList = farmerRepo.getSelectedCropList();
  }

  bool _isLoading = false;
  bool get  isLoading => _isLoading;
  Future<ResponseModel>editCropPricing(CropPricing cropPricing) async{
    _isLoading = true;
    update();
    Response response = await  farmerRepo.editCropPricing(cropPricing.toJson());
    late ResponseModel responseModel;
    if(response.statusCode == 200){

      print('farmer controller'+response.body.toString());
      responseModel = ResponseModel(true,'Successfully edited data');
    }else{
      print('farmer controller '+response.body.toString());
      responseModel = ResponseModel(false,response.statusText!);
    }

    _isLoading = false;
    update();

    return  responseModel;
  }

  List<CropPricing> _pricingList = [];
  List<CropPricing> get pricingList => _pricingList;

  Future<void> geCropPricing() async{
    _isLoading = true;
    update();
    Response response   = await farmerRepo.getCropPricing();
    if(response.statusCode == 200)
    {
      _pricingList = [];
      //print('farmer controller response body'+response.body);
      _pricingList.addAll(CropPricingModel.fromJson(response.body).cropPricing);
      update();
    }else{
      print(response.body);
    }
    _isLoading = false;
    update();



  }
  int? findCropPriceId({required String size,required int id}){
    if(findCropCategory(id).isEmpty) return null;
    List resultList =  findCropCategory(id).where((element)=>element.size!.toLowerCase().contains(size.toLowerCase())).toList();
    List list = resultList.map((element){
      return element.id;
    }).toList();
    if(list.isEmpty) return null;
    return list[0];

  }

  int? findCropPrice({required String size,required int id}){
    if(findCropCategory(id).isEmpty) return null;
    List resultList =  findCropCategory(id).where((element)=>element.size!.toLowerCase().contains(size.toLowerCase())).toList();
    List list = resultList.map((element){
      return element.cost;
    }).toList();
    if(list.isEmpty) return null;
    return list[0];
  }

   List  findCropCategory(int id){
     //int("element.Category id");
     List<CropPricing> list = [];

     for (CropPricing  pricing in _pricingList) {
       if (pricing.categoryId == id) {
         list.add(pricing);
       }
     }
     return list;
  }

  Map<int ,CropPricing>  _cropPricingItems = {};
  void addCropPricing({
  required CropPricing cropPricing
}) {
    print(cropPricing.toString());

      if (_cropPricingItems.containsKey(cropPricing.id)) {
        _cropPricingItems.update(cropPricing.id!, (value) {
          return CropPricing(
            id:cropPricing.id,
            cost:cropPricing.cost,
            photoOne: cropPricing.photoOne,
            photoTwo: cropPricing.photoTwo,
            photoThree: cropPricing.photoThree,
            inStock:cropPricing.inStock,
          );
      });
      }else {
        _cropPricingItems.putIfAbsent(cropPricing.id!, () {
           return CropPricing(
            id:cropPricing.id,
            cost:cropPricing.cost,
            photoOne: cropPricing.photoOne,
            photoTwo: cropPricing.photoTwo,
            photoThree: cropPricing.photoThree,
            inStock:cropPricing.inStock,
          );
        });
      }
      farmerRepo.addToCropPricingList(getItems);
    }

  List<CropPricing> get getItems {
    return  _cropPricingItems.entries.map((e){
      return  e.value;
    }).toList().reversed.toList();
  }

  List<CropPricing>  pricingStorageItems = [];
  set setPricingStorageItems (List<CropPricing> pricingItems){
    pricingStorageItems = pricingItems;
    for(var i= 0;i<pricingStorageItems.length;i++){
      // print(jsonEncode(pricingStorageItems[i]));
      _cropPricingItems.putIfAbsent(pricingStorageItems[i].id!, () => pricingStorageItems[i]);
    }
  }

  get getCropPricingData{
    setPricingStorageItems = farmerRepo.getCropPricingList();
    return pricingStorageItems;
  }

  CropPricing? findCropPricing({required String size,required int id}){
    if(findCropCategory(id).isEmpty) return null;
    List resultList =  findCropCategory(id).where((element)=>element.size!.toLowerCase().contains(size.toLowerCase())).toList();
    List list = resultList.map((element){
      return element;
    }).toList();

    if(list.isEmpty) return null;
    return list[0];
  }



}