import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:petugas_perpustakaan_kelas_c/app/modules/book/controllers/book_controller.dart';

import '../../../data/contant/endpoint.dart';
import '../../../data/provider/api_provider.dart';
import '../../../data/provider/storage_provider.dart';
import '../../../routes/app_pages.dart';

class AddBookController extends GetxController {
  //TODO: Implement AddBookController
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController judulController = TextEditingController();
  final TextEditingController penulisController = TextEditingController();
  final TextEditingController penerbitController = TextEditingController();
  final TextEditingController tahun_terbitController = TextEditingController();
  final loading = false.obs;

  final count = 0.obs;
  final BookController _bookController = Get.find(); // untuk reload get data book

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  addbook() async {
    loading(true);
    try {
      FocusScope.of(Get.context!).unfocus(); //nge close keyboard
      formKey.currentState?.save();
      if (formKey.currentState!.validate()) {
        final response = await ApiProvider.instance().post(Endpoint.book,
            data: {
              'judul': judulController.text.toString(),
              'penulis': penulisController.text.toString(),
              'penerbit': penerbitController.text.toString(),
              'tahun_terbit': int.parse(tahun_terbitController.text.toString()),
            });
        if (response.statusCode == 201) {
          _bookController.getData(); //untuk reload get data book
          // await StorageProvider.write(StorageKey.status, 'success');
          // Get.offAllNamed(Routes.BOOK);
          // Get.snackbar('Berhasil', 'Buku telah disimpan', backgroundColor: Colors.green);
          Get.back();
        } else {
          Get.snackbar('Sorry', 'Login Gagal', backgroundColor: Colors.orange);
        }
      }
      loading(false);
    } on dio.DioException catch (e) {
      loading(false);
      if (e.response != null) {
        if (e.response?.data != null) {
          Get.snackbar('Sorry', '${e.response?.data['message']}',
              backgroundColor: Colors.orange);
        }
      } else {
        Get.snackbar('Sorry', e.message ?? '', backgroundColor: Colors.red);
      }
    } catch (e) {
      loading(false);
      Get.snackbar('Error', e.toString(), backgroundColor: Colors.red);
    }
  }

  void increment() => count.value++;
}
