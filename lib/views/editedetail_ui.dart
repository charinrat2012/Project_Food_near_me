import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../controllers/editedetailctrl.dart';
import '../controllers/scrollctrl.dart';
import '../widgets/matwid/back3_bt.dart';
import '../widgets/matwid/back_bt.dart';
import '../widgets/matwid/scrolltotop_bt.dart';

class EditRestaurantDetailsUi extends StatelessWidget {
  final String restaurantId;
  const EditRestaurantDetailsUi({super.key, required this.restaurantId});

  @override
  Widget build(BuildContext context) {
    // *** จุดแก้ไขที่ 1: เปลี่ยนจาก Get.put เป็น Get.find ***
    // เราจะใช้ Controller ที่ถูกสร้างไว้แล้วจากตอนที่กดปุ่ม ไม่สร้างใหม่ที่นี่
    final EditRestaurantDetailsController editRestaurantController =
        Get.find<EditRestaurantDetailsController>(tag: restaurantId);
    final ScrollpageController scrollpageController =
        Get.find<ScrollpageController>(tag: 'edit_details_scroll_$restaurantId');

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink[200],
          title: Align(
            alignment: Alignment.centerLeft,
            child: Back3Bt(),
          ),
          toolbarHeight: 80,
          automaticallyImplyLeading: false,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.pink[200]!, Colors.blue[200]!],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                transform: const GradientRotation(3.0),
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.pink[200]!, Colors.blue[200]!],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  transform: const GradientRotation(3.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.pink[200]!, Colors.blue[200]!],
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        transform: const GradientRotation(3.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      child: Obx(() {
                        if (editRestaurantController.restaurantToEdit.value ==
                            null) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        final restaurant =
                            editRestaurantController.restaurantToEdit.value!;

                        return Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: SingleChildScrollView(
                            controller: scrollpageController.scrollController,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SizedBox(height: 20),
                                Text(
                                  "แก้ไขข้อมูลร้าน: ${restaurant.restaurantName}",
                                  style: GoogleFonts.poppins(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey[800],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 20),
                                _buildTextFieldWithLabel(
                                    'ชื่อร้าน',
                                    editRestaurantController
                                        .restaurantNameController,
                                    false),
                                _buildTextFieldWithLabel(
                                    'คำอธิบาย',
                                    editRestaurantController
                                        .descriptionController,
                                    false,
                                    maxLines: 5),
                                _buildTextFieldWithLabel(
                                    'เวลาเปิด-ปิด',
                                    editRestaurantController
                                        .openingHoursController,
                                    false),
                                _buildTextFieldWithLabel(
                                    'เบอร์โทรศัพท์',
                                    editRestaurantController
                                        .phoneNumberController,
                                    false),
                                _buildTextFieldWithLabel(
                                    'ที่ตั้ง',
                                    editRestaurantController.locationController,
                                    false,
                                    maxLines: 3),
                                _buildTextFieldWithLabel(
                                    'ลิงก์รูปเมนู (Path)',
                                    editRestaurantController
                                        .menuImageController,
                                    false),
                                _buildTextFieldWithLabel(
                                    'ลิงก์รูปโปรโมชั่น (Path)',
                                    editRestaurantController
                                        .bannerImageController,
                                    false),
                                _buildTextFieldWithLabel(
                                    'ประเภทอาหาร',
                                    editRestaurantController.typeController,
                                    false),
                                const SizedBox(height: 30),
                                SizedBox(
                                  width: double.infinity,
                                  child: Obx(() => ElevatedButton(
                                        onPressed: editRestaurantController
                                                .isLoading.value
                                            ? null
                                            : () => editRestaurantController
                                                .saveChanges(),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.pink[400],
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 12.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                        ),
                                        child: editRestaurantController
                                                .isLoading.value
                                            ? const CircularProgressIndicator(
                                                color: Colors.white)
                                            : const Text(
                                                'บันทึกการเปลี่ยนแปลง',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.white),
                                              ),
                                      )),
                                ),
                                const SizedBox(height: 30),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => scrollpageController.showScrollToTopButton.value
                  ? Positioned(
                      right: 20.0,
                      bottom: MediaQuery.of(context).padding.bottom + 16.0,
                      child: ScrollToTopButton(
                        onPressed: scrollpageController.scrollToTop,
                      ),
                    )
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextFieldWithLabel(
    String label,
    TextEditingController controller,
    bool isObscure, {
    int maxLines = 1,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 8),
          TextField(
            controller: controller,
            obscureText: isObscure,
            maxLines: maxLines,
            decoration: InputDecoration(
              hintText: 'กรอก $label',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              filled: true,
              fillColor: Colors.grey[100],
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}
