import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:presidente/app/modules/add_process/controllers/add_process_controller.dart';

class AddProcessView extends GetView<AddProcessController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddProcessView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddProcessView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
