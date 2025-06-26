// lib/widgets/homewid/LocationFilterBar.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/filterctrl.dart';
import 'localist.dart'; // <<< เพิ่มบรรทัดนี้เข้ามา

class LocationFilterBar extends StatelessWidget {
  const LocationFilterBar({super.key});

  // ลบรายการ provinces, districtsByProvince, foodTypes ออกจากตรงนี้
  // เพราะเราจะไปดึงมาจาก Localist.provinces, Localist.districtsByProvince, Localist.foodTypes แทน

  @override
  Widget build(BuildContext context) {
    final FilterController filterController = Get.find<FilterController>();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SingleChildScrollView(
  scrollDirection: Axis.horizontal,
  child: Row(
    children: [
      Obx(() => _buildProvinceDropdown(filterController)),
      const SizedBox(width: 8),
      Obx(() => _buildDistrictDropdown(filterController)),
      const SizedBox(width: 8),
       _buildLocationButton(),

      
    ],
  ),
),
  const SizedBox(height: 8),

SizedBox(width: double.infinity, child: Obx(() => _buildCategoryDropdown(filterController))),
        ],
      ),
    );
  }

  Widget _buildProvinceDropdown(FilterController filterController) {
    return _buildContainer(
      SizedBox(
        width: 130,
        child: DropdownButton<String>(
          isExpanded: true,
          value: filterController.selectedProvince.value.isEmpty
              ? null
              : filterController.selectedProvince.value,
          hint: const Text('เลือกจังหวัด', style: TextStyle(color: Colors.white)),
          // dropdownColor: Colors.purple[200],
          dropdownColor: Colors.purple[200],
          iconEnabledColor: Colors.white,
          menuMaxHeight: 400,
        menuWidth: 200,
          style: const TextStyle(color: Colors.white),
          items: [
            const DropdownMenuItem<String>(
              value: '',
              child: Text('ทั้งหมด', style: TextStyle(color: Colors.white)),
            ),
            // ใช้ Localist.provinces ตรงนี้
            ...Localist.provinces.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color: Colors.white)),
              );
            }).toList(),
          ],
          onChanged: (newValue) {
            filterController.setSelectedProvince(newValue ?? '');
          },
        ),
      ),
    );
  }

  Widget _buildDistrictDropdown(FilterController filterController) {
    // ใช้ Localist.districtsByProvince ตรงนี้
    final List<String> districts = Localist.districtsByProvince[filterController.selectedProvince.value] ?? [];
    return _buildContainer(
      SizedBox(
        width: 143,
        child: DropdownButton<String>(
          isExpanded: true,
          value: filterController.selectedDistrict.value.isEmpty
              ? null
              : filterController.selectedDistrict.value,
          hint: const Text('เลือกเขต/อำเภอ', style: TextStyle(color: Colors.white)),
          dropdownColor: Colors.purple[200],
          iconEnabledColor: Colors.white,
          menuMaxHeight: 400,
        menuWidth: 200,
          style: const TextStyle(color: Colors.white),
          items: [
            const DropdownMenuItem<String>(
              value: '',
              child: Text('ทั้งหมด', style: TextStyle(color: Colors.white)),
            ),
            ...districts.map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value, style: const TextStyle(color: Colors.white)),
              );
            }).toList(),
          ],
          onChanged: (newValue) {
            filterController.setSelectedDistrict(newValue ?? '');
          },
        ),
      ),
    );
  }

  Widget _buildCategoryDropdown(FilterController filterController) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        // color: Colors.pink[300],
        gradient: LinearGradient(colors: [Colors.pink[300]!, Colors.blue[300]!]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        value: filterController.selectedCategory.value.isEmpty
            ? null
            : filterController.selectedCategory.value,
        hint: const Text('ตัวกรองประเภทอาหาร', style: TextStyle(color: Colors.white)),
        dropdownColor: Colors.purple[200],
        style: const TextStyle(color: Colors.white),
        iconEnabledColor: Colors.white,
        menuMaxHeight: 400,
        menuWidth: 200,
        // alignment: Alignment.bottomCenter,
        items: [
          const DropdownMenuItem<String>(
            value: '',
            child: Text('ทั้งหมด', style: TextStyle(color: Colors.white)),
          ),
          // ใช้ Localist.foodTypes ตรงนี้
          ...Localist.foodTypes.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: const TextStyle(color: Colors.white)),
            );
          }).toList(),
        ],
        onChanged: (newValue) {
          filterController.setSelectedCategory(newValue ?? '');
        },
      ),
    );
  }

  // ... (ส่วน _buildLocationButton และ _buildContainer เหมือนเดิม)
  Widget _buildLocationButton() {
    const double iconSize = 20.0;
    const double buttonPadding = 8.0; // Padding รอบไอคอนด้านใน

    return Container( // ใช้ Container เองสำหรับปุ่มนี้
      height: iconSize + buttonPadding * 2, // ขนาดความสูงของพื้นหลัง
      width: iconSize + buttonPadding * 2,  // ขนาดความกว้างของพื้นหลัง (ทำให้เป็นสี่เหลี่ยมจัตุรัส)
      decoration: BoxDecoration(
        // color: Colors.pink[300], // สีพื้นหลังของปุ่ม
        gradient: LinearGradient(colors: [Colors.pink[300]!, Colors.blue[300]!]),
        borderRadius: BorderRadius.circular((iconSize + buttonPadding * 2) / 2), // ทำให้เป็นวงกลม
      ),
      child: IconButton(
        iconSize: iconSize,
        padding: EdgeInsets.zero, // ลบ padding เริ่มต้นของ IconButton
        alignment: Alignment.center, // จัดไอคอนให้อยู่ตรงกลางของพื้นที่ที่ Container ให้มา
        onPressed: () {
          Get.snackbar(
            'ตำแหน่งปัจจุบัน',
            'ฟังก์ชันนี้ยังไม่ได้ถูกพัฒนา',
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.blueAccent,
            colorText: Colors.white,
          );
        },
        icon: const Icon(Icons.my_location, color: Colors.white),
      ),
    );
  }

  Widget _buildContainer(Widget child) {
    return Container(
      height: 35,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        // color: Colors.blue[300],
        gradient: LinearGradient(colors: [Colors.pink[300]!, Colors.blue[300]!]),
        borderRadius: BorderRadius.circular(20),
      ),
      child: child,
    );
  }
}