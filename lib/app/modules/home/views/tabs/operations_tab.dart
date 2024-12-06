import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ussed_manager/app/data/models/operation_model.dart';
import 'package:ussed_manager/app/modules/home/controllers/home_controller.dart';
import 'package:ussed_manager/app/modules/home/views/components/view_title.dart';
import 'package:ussed_manager/app/shared/components/custom_text.dart';

class OperationsTab extends StatelessWidget {
  OperationsTab({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController _homeController = Get.find();

    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.h, vertical: 10.h),
        child: Column(
          children: [
            ViewTitle(viewTitle: "Opérations"),
            Expanded(
              child: SizedBox(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: _homeController.operations.length,
                  itemBuilder: (context, index) {
                    OperationModel currentOperation =
                        _homeController.operations[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _buildOperationContainer(
                        operationName: currentOperation.operationName,
                        operation: currentOperation.operation,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOperationContainer(
      {required String operationName, required void Function() operation}) {
    return InkWell(
      onTap: operation,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.h),
          color: Colors.grey.shade300,
          boxShadow: [
            // bottom right shadow is darker
            BoxShadow(
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
              color: Colors.grey.shade400,
            ),

            // top left shadow is lighter
            BoxShadow(
              offset: const Offset(-4, -4),
              blurRadius: 15,
              spreadRadius: 1,
              color: Colors.grey.shade50,
            )
          ],
        ),
        child: CustomText(
          text: operationName,
        ),
      ),
    );
  }
}
