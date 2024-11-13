import 'dart:math';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:todo_app/app/home/model/todo_model.dart';

class TodoController extends GetxController {
  final Dio _dio = Dio();
  RxList todolist = <TodoModel>[].obs;
  @override
  void onInit() {
    fetchdata();
    super.onInit();
  }

  void fetchdata() async {
    String url = "https://672f430a229a881691f25daf.mockapi.io/todolist";
    try {
      var response = await _dio.get(url);
      if (response.statusCode == 200) {
        print('Data fetched successfully: ${response.data}');

        for (var item in response.data) {
          todolist.add(TodoModel.fromJson(item));
          print(todolist);
        }
      } else {
        print('Data cant be fetched');
      }
    } on DioException catch (e) {
      print("Exception occured:${e}");
    }
  }

  void postdata(title) async {
    String url = "https://672f430a229a881691f25daf.mockapi.io/todolist";
    try {
      var response = await _dio.post(
        url,
        data: {'title': title}, // Sending the title as data
        options: Options(
          headers: {
            'Content-Type':
                'application/json', // Optional, if required by the API
          },
        ),
      );

      if (response.statusCode == 201) {
        todolist.clear();
        fetchdata();
      }
    } on DioException catch (e) {
      print("exception occured:${e}");
    }
  }
}
