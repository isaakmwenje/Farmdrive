import 'package:get/get.dart';
import 'package:untitled3/%20repository/farmer_repository.dart';
import 'package:untitled3/data/crop_data.dart';
import 'package:untitled3/data/farmer_data.dart';
import 'package:untitled3/data/vegetable_data.dart';

class FarmerController extends GetxController{

  FarmerRepo farmerRepo;
  FarmerController({required this.farmerRepo});

  Map _vegetableFarmers = {};

  final Map<String,Farmer> _selectedFarmer = {};
  Map<String,Farmer> get selectedFarmer => _selectedFarmer;

  List<Farmer> storageItems = [];
  set setStorageItems (List<Farmer> selectedFarmerItems){
    storageItems  = selectedFarmerItems;
   for(var i=0;i<storageItems.length;i++){
   _selectedFarmer.putIfAbsent(storageItems[i].crop, () => storageItems[i]);
   }
  }

  get getFarmerData{
    print('inside getFarmerData');
    setStorageItems = farmerRepo.getSelectedFarmer();
    return storageItems;
  }
 void setFarmer(Farmer farmer , {required Crop crop}) {
   if(_selectedFarmer.containsKey(crop.type)) {
     _selectedFarmer.update(crop.type,(value){print(value.name);return farmer;});
   }else{
     _selectedFarmer.putIfAbsent(crop.type,(){print('farmer'+farmer.name);return farmer;});
   }
   farmerRepo.addSelectedFarmer(getSelectedFarmer());
   update();
  }

  List<Farmer> getSelectedFarmer(){
   return _selectedFarmer.entries.map((e){
      return e.value;
    }).toList();
  }
  Farmer? getFarmer(Crop crop){
   Farmer? farmer;
   _selectedFarmer.forEach((key,value){
     if(key == crop.type){
       farmer = value;
     }
   });
   return farmer;
  }

  bool checkFarmer(Farmer farmer){
   return  _selectedFarmer.containsValue(farmer);
  }


  void addVegetableFarmer(Crop? crop){

    _vegetableFarmers = {};
    for(var farmer in farmers) {
      if(farmer.crop == crop!.type){
        _vegetableFarmers.putIfAbsent(farmer.farmerId,(){
          return farmer;
        });
      }
     }
    }

  List  getFarmerList(Crop crop){
    addVegetableFarmer(crop);
    return _vegetableFarmers.entries.map((e){return e.value;}).toList();
  }


  remove(Crop crop){
    farmerRepo.remove();
    _selectedFarmer.remove(crop.type);
  }
}