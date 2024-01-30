import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/add_book_controller.dart';

class AddBookView extends GetView<AddBookController> {
  const AddBookView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AddBookView'),
        centerTitle: true,
      ),
      body: Form(
          key: controller.formKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.judulController,
                decoration: InputDecoration(
                  hintText: "Masukan Judul",
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Judul tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                // obscureText: true,
                controller: controller.penulisController,
                decoration: InputDecoration(
                  hintText: "Masukan Penulis",
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Penulis tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: controller.penerbitController,
                decoration: InputDecoration(
                  hintText: "Masukan Penerbit",
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return "Nama Penerbit tidak boleh kosong";
                  }
                  return null;
                },
              ),
              TextFormField(
                // obscureText: true,
                controller: controller.tahun_terbitController,
                decoration: InputDecoration(
                  hintText: "Masukan Tahun Terbit",
                ),
                validator: (value) {
                  if (value!.length < 2) {
                    return " Tahun Terbit tidak boleh kosong";
                  }
                  return null;
                },
              ),
              Obx(() => controller.loading.value
                  ? CircularProgressIndicator()
                  : ElevatedButton(
                  onPressed: () {
                    controller.addbook();
                  },
                  child: Text('Tambah'))),
            ],
          ))
    );
  }
}
