import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/restaurant_edit_detail_ctrl.dart';

class EddtFormEdit extends StatelessWidget {
final String restaurantId;
const EddtFormEdit({super.key, required this.restaurantId});

@override
Widget build(BuildContext context) {
final EditRestaurantDetailsController editRestaurantController =
  Get.find<EditRestaurantDetailsController>(tag: restaurantId);
return Column(
children: [
_buildTextFieldWithLabel(
'ชื่อร้าน',
editRestaurantController
.restaurantNameController,
),
 _buildTextFieldWithLabel(
'คำอธิบาย',
editRestaurantController
.descriptionController,

maxLines: 5),
 _buildTextFieldWithLabel(
'เวลาเปิด-ปิด',
editRestaurantController
.openingHoursController,
),
 _buildTextFieldWithLabel(
'เบอร์โทรศัพท์',
editRestaurantController
.phoneNumberController,
),
 _buildTextFieldWithLabel(
'ที่ตั้ง',
editRestaurantController.locationController,

maxLines: 3),
_buildImagePicker(
 
label: 'รูปเมนู',
imageList: editRestaurantController.menuImages,
onAdd: () => editRestaurantController.addMenuImages(),
onRemove: (index) => editRestaurantController.removeMenuImage(index),
 ),
 Text(
'จัดการโปรโมชั่น',
style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.grey[800]),
 ),
 Obx(() => Row(
children: [
Expanded(
child: RadioListTile<BannerType>(
title: const Text('รูปภาพ'),
value: BannerType.image,
groupValue: editRestaurantController.selectedBannerType.value,
onChanged: (value) => editRestaurantController.setBannerType(value!),
),
),
Expanded(
child: RadioListTile<BannerType>(
title: const Text('ข้อความ'),
value: BannerType.text,
groupValue: editRestaurantController.selectedBannerType.value,
onChanged: (value) => editRestaurantController.setBannerType(value!),
),
),
],
 )),

 // --- 2. แสดง UI ตามประเภทที่เลือก ---
 Obx(() {
if (editRestaurantController.selectedBannerType.value == BannerType.image) {
return _buildImagePicker(
label: 'รูปโปรโมชั่น',
imageList: editRestaurantController.bannerImagePaths,
onAdd: () => editRestaurantController.addPromotion(),
onRemove: (index) => editRestaurantController.removeBannerImage(index),
);
} else {
return _buildBannerTextEditor(
label: 'ข้อความโปรโมชั่น',
controller: editRestaurantController,
);
}
 }),
 const Divider(height: 30, thickness: 1),

 _buildTextFieldWithLabel('ประเภทอาหาร', editRestaurantController.typeController, ),
 // เว้นที่สำหรับปุ่มด้านล่าง
 
],
);
}
}
 Widget _buildTextFieldWithLabel(
String label,
TextEditingController controller,
 {
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

Widget _buildImagePicker({
required String label,
required RxList<String> imageList,
required VoidCallback onAdd,
required Function(int) onRemove,
}) {
return Padding(
padding: const EdgeInsets.only(bottom: 16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[700])),
const SizedBox(height: 8),
Container(
padding: const EdgeInsets.all(8.0),
decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8.0)),
height: 120, // ให้ความสูงคงที่
child: Row(
children: [
Expanded(
child: Obx(() => imageList.isEmpty
? const Center(child: Text('ยังไม่มีรูปภาพ', style: TextStyle(color: Colors.grey)))
: ListView.builder(
scrollDirection: Axis.horizontal,
itemCount: imageList.length,
itemBuilder: (context, index) {
final imagePath = imageList[index];
return Padding(
 padding: const EdgeInsets.only(right: 8.0),
 child: Stack(
 alignment: Alignment.topRight,
 children: [
ClipRRect(
borderRadius: BorderRadius.circular(8.0),
child: imagePath.startsWith('assets/')
? Image.asset(imagePath, width: 100, height: 100, fit: BoxFit.cover)
: Image.file(File(imagePath), width: 100, height: 100, fit: BoxFit.cover),
),
InkWell(
onTap: () => onRemove(index),
child: Container(
padding: const EdgeInsets.all(2),
decoration: const BoxDecoration(color: Colors.red, shape: BoxShape.circle),
child: const Icon(Icons.close, color: Colors.white, size: 14),
),
),
 ],
 ),
);
},
)),
),
const SizedBox(width: 8),
InkWell(
onTap: onAdd,
child: Container(
width: 100,
height: 100,
decoration: BoxDecoration(
color: Colors.grey[200],
borderRadius: BorderRadius.circular(8.0),
border: Border.all(color: Colors.grey.shade400, style: BorderStyle.solid),
),
child: Icon(Icons.add_a_photo_outlined, color: Colors.grey[600], size: 40),
),
),
],
),
),
],
),
);
}
Widget _buildBannerTextEditor({
required String label,
required EditRestaurantDetailsController controller,
}) {
return Padding(
padding: const EdgeInsets.only(bottom: 16.0),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey[700])),
IconButton(
icon: const Icon(Icons.add_circle, color: Colors.green),
onPressed: () => controller.addBannerField(),
)
],
),
const SizedBox(height: 8),
Container(
padding: const EdgeInsets.all(8.0),
decoration: BoxDecoration(color: Colors.grey[100], borderRadius: BorderRadius.circular(8.0)),
child: Obx(() {
if (controller.bannerTextControllers.isEmpty) {
return const SizedBox(
height: 50,
child: Center(child: Text('กด "+" เพื่อเพิ่มข้อความโปรโมชั่น', style: TextStyle(color: Colors.grey)))
);
}
// ใช้ Column แทน ListView เพื่อให้แสดงผลทั้งหมดใน Container เดียว
return Column(
children: controller.bannerTextControllers.map((textController) {
 final index = controller.bannerTextControllers.indexOf(textController);
 return Padding(
padding: const EdgeInsets.only(bottom: 8.0),
child: Row(
children: [
Expanded(
child: TextField(
controller: textController,
decoration: InputDecoration(
 hintText: 'โปรโมชั่นที่ ${index + 1}',
 border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0), borderSide: BorderSide.none),
 filled: true,
 fillColor: Colors.white,
 contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
),
),
),
IconButton(
icon: const Icon(Icons.remove_circle, color: Colors.red),
onPressed: () => controller.removeBannerField(index),
)
],
),
);
}).toList(),
);
}),
),
],
),
);
}