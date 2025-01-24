import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled/features/reports/controllers/submit_report_controller.dart';
import '../../../utils/validators/validations.dart';
import '../../personalization/controllers/user_controller.dart';

class SubmitReport extends StatelessWidget {
  const SubmitReport({super.key});


  @override
  Widget build(BuildContext context) {
    final fetchcontroller = Get.put(UserController());
    final controller = Get.put(SubmitReportController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Submit Report',
          style: TextStyle(
            fontSize: 16,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.normal,
            color: Color(0xFF333333),
          ),
        ),
        centerTitle: true,
      ),

      body: Form(
        key: controller.submitReportFormKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              ///NAME
            TextFormField(
              validator: (value) => PValidator.validateEmptyText( "Name", value),
              controller: controller.name,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.user), labelText: 'Name'),
            ),

              const SizedBox(height: 20),

              ///EMAIL ADDRESS
              TextFormField(
                validator: (value) => PValidator.validateEmail(value),
                controller: controller.email,
                expands: false,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.direct_right),
                    labelText: 'Email'),
              ),

              const SizedBox(height: 20),

              ///CONTACT NUMBER
              TextFormField(
                validator: (value) => PValidator.validatePhoneNumber(value),
                controller: controller.phoneNo,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Iconsax.call), labelText: 'Phone Number'),
              ),

              const SizedBox(height: 20),
              ///UNIT NUMBER

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Obx(() => DropdownButtonFormField<String>(
            validator: (value) => PValidator.validateEmptyText('Unit No.', value),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    hint: const Text(
                      'Unit No.',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                    value: controller.unitSelectedValue.value.isEmpty
                        ? null
                        : controller.unitSelectedValue.value,
                    items: <String>[fetchcontroller.user.value?.unitNo ?? ''].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    onChanged: (String? value) {
                      controller.unitSelectedValue.value = value ?? '';
                    },
                  )),
                ),
                const SizedBox(width: 20),

                // CATEGORY
                Expanded(
                  child: Obx(() => DropdownButtonFormField<String>(
    validator: (value) => PValidator.validateEmptyText('Category', value),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.0),
                        borderSide: const BorderSide(width: 1, color: Colors.grey),
                      ),
                    ),
                    hint: const Text(
                      'Category',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                    value: controller.categorySelectedValue.value.isEmpty
                        ? null
                        : controller.categorySelectedValue.value,
                    items: <String>['Maintenance', 'Security', 'Utilities', 'Others'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 20,
                    onChanged: (String? value) {
                      controller.categorySelectedValue.value = value ?? '';
                    },
                  )),
                ),
              ],
            ),

              const SizedBox(height: 20),

              ///DETAILS
              Container(
                height: 200,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                  border: Border.all(
                    color: Colors.grey,
                    width: 1.0,
                  ),
                ),

                child: TextFormField(
                  controller: controller.reportDesc,
                    validator: (value) => PValidator.validateEmptyText('Report Description', value),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                    hintText: 'Report Description',
                    hintStyle: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Poppins',
                    )
                  ),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => controller.submitReport() ,
                    child: Text('Submit',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),)),
              )
            ],
          ),

        ),
      ),

    );
  }

}