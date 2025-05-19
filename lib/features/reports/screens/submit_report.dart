import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:untitled/features/reports/controllers/submit_report_controller.dart';
import '../../../utils/constants/colors.dart';
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
        title: const Text(
          'Submit Report',
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
                validator: (value) =>
                    PValidator.validateEmptyText("Name", value),
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
                    prefixIcon: Icon(Iconsax.direct_right), labelText: 'Email'),
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
                          validator: (value) =>
                              PValidator.validateEmptyText('Unit No.', value),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
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
                          items: <String>[
                            fetchcontroller.user.value?.unitNo ?? ''
                          ].map((String value) {
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
                          validator: (value) =>
                              PValidator.validateEmptyText('Category', value),
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: const BorderSide(
                                  width: 1, color: Colors.grey),
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
                          items: <String>[
                            'Maintenance',
                            'Security',
                            'Utilities',
                            'Others'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 20,
                          onChanged: (String? value) {
                            controller.categorySelectedValue.value =
                                value ?? '';
                          },
                        )),
                  ),
                ],
              ),


              const SizedBox(height: 20),

              ///DETAILS
              Container(
                constraints: BoxConstraints(maxHeight: 200),
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
                  validator: (value) =>
                      PValidator.validateEmptyText('Report Description', value),
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      errorBorder: InputBorder.none,
                      focusedErrorBorder: InputBorder.none,
                      hintText: 'Report Description',
                      hintStyle: TextStyle(
                        fontSize: 14,
                        fontFamily: 'Poppins',
                      )),
                  keyboardType: TextInputType.multiline,
                  maxLines: null,
                ),
              ),

              const SizedBox(height: 20),

              /// IMAGE UPLOAD SECTION
              Container(
                width: 400,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Obx(() {
                  final images = controller.reportImages;

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        // Show thumbnails
                        ...images.map((file) {
                          return Container(
                            width: 90,
                            height: 100,
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black26),
                              borderRadius: BorderRadius.circular(8),
                              image: DecorationImage(
                                image: FileImage(file),
                                fit: BoxFit.cover,
                              ),
                            ),
                          );
                        }).toList(),

                        // Add button (only if less than 3 images)
                        if (images.length < 3)
                          GestureDetector(
                            onTap: () => controller.pickImage(),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.add_a_photo, color: Colors.grey),
                                  SizedBox(height: 5),
                                  Text(
                                    "Add Photo",
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  );
                }),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () => controller.submitReport(),
                    child: Text(
                      'Submit',
                      style: TextStyle(
                        color: Color(0xFFFFFFFF),
                      ),
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
