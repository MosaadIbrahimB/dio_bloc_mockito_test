import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'data_manager.dart';
import 'data_service.dart';
import 'test_data.mocks.dart';
/*
1-عمل توليد لكلاس mockDataServic
من خلال النوتشن واعطائه اسم الكلاس المراد عمل منه موك

2-اختبار الدالة fetch
من خلال دالة
when().thenansewer
3-نعمل داتا مانجير

4-اختبار دالة getdata
5-مقارنة الداتا اللى جات من المانجير مع الدانا اللى جات من الفيتش
5-التاكد من عمل الدالة مرة واحدة
 */
@GenerateMocks([DataService])
void main() {
  test(
    "getData mock",
        () async {
      //2-انشاء الكلاس الوهمى من داتا سيرفس
      MockDataService mockDataService = MockDataService();
//3-تحديد سوك الوهمى لل fetchData
      when(mockDataService.fetchData()).thenAnswer((_) async => 'x Data');

      // 4-هنعرف داتا ماندير و نباصى ليه داتا سيرفر الوهمى
      DataManager dataManager = DataManager(mockDataService);

      //5-هستعدى getData
      var data = await dataManager.getData();
      print("sssssssssssssss $data");
      //6-التحقق من التيجة
      //actual الفعلى  //matcher مطابق
      expect(data, 'x Data');

//7-التحقق ان تم استدعاءه مرة واحده
      verify(mockDataService.fetchData()).called(1);
    },
  );
}

/*

 */