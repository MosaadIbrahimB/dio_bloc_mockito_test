

import 'data_service.dart';

class DataManager{
  DataService dataService=DataService();

  DataManager(this.dataService);

 Future<String> getData() async {
   return await  dataService.fetchData();
  }
}