class Localist {
  static const List<String> provinces = const [
   
    "กรุงเทพมหานคร", "กระบี่", "กาญจนบุรี", "กาฬสินธุ์", "กำแพงเพชร", "ขอนแก่น",
    "จันทบุรี", "ฉะเชิงเทรา", "ชลบุรี", "ชัยนาท", "ชัยภูมิ", "ชุมพร", "เชียงราย",
    "เชียงใหม่", "ตรัง", "ตราด", "ตาก", "นครนายก", "นครปฐม", "นครพนม", "นครราชสีมา",
    "นครศรีธรรมราช", "นครสวรรค์", "นนทบุรี", "นราธิวาส", "น่าน", "บึงกาฬ", "บุรีรัมย์",
    "ปทุมธานี", "ประจวบคีรีขันธ์", "ปราจีนบุรี", "ปัตตานี", "พระนครศรีอยุธยา", "พะเยา",
    "พังงา", "พัทลุง", "พิจิตร", "พิษณุโลก", "เพชรบุรี", "เพชรบูรณ์", "แพร่", "ภูเก็ต",
    "มหาสารคาม", "มุกดาหาร", "แม่ฮ่องสอน", "ยโสธร", "ยะลา", "ร้อยเอ็ด", "ระนอง", "ระยอง",
    "ราชบุรี", "ลพบุรี", "ลำปาง", "ลำพูน", "เลย", "ศรีสะเกษ", "สกลนคร", "สงขลา",
    "สตูล", "สมุทรปราการ", "สมุทรสงคราม", "สมุทรสาคร", "สระแก้ว", "สระบุรี", "สิงห์บุรี",
    "สุโขทัย", "สุพรรณบุรี", "สุราษฎร์ธานี", "สุรินทร์", "หนองคาย", "หนองบัวลำภู",
    "อ่างทอง", "อำนาจเจริญ", "อุดรธานี", "อุตรดิตถ์", "อุทัยธานี", "อุบลราชธานี",
  ];

  static const Map<String, List<String>> districtsByProvince =  {
   
    'กรุงเทพมหานคร': [
      'พระนคร', 'ดุสิต', 'หนองจอก', 'บางรัก', 'บางเขน', 'บางกะปิ',
      'ปทุมวัน', 'ป้อมปราบศัตรูพ่าย', 'พระโขนง', 'มีนบุรี', 'ลาดกระบัง',
      'ยานนาวา', 'สัมพันธวงศ์', 'พญาไท', 'ธนบุรี', 'บางกอกใหญ่',
      'ห้วยขวาง', 'คลองสาน', 'ตลิ่งชัน', 'บางกอกน้อย', 'บางขุนเทียน',
      'ภาษีเจริญ', 'หนองแขม', 'ราษฎร์บูรณะ', 'บางพลัด', 'ดินแดง',
      'บึงกุ่ม', 'สาทร', 'บางซื่อ', 'จตุจักร', 'บางคอแหลม', 'ประเวศ',
      'คลองเตย', 'สวนหลวง', 'จอมทอง', 'ดอนเมือง', 'ราชเทวี',
      'ลาดพร้าว', 'วัฒนา', 'บางแค', 'หลักสี่', 'สายไหม', 'คันนายาว',
      'สะพานสูง', 'วังทองหลาง', 'คลองสามวา', 'บางนา', 'ทวีวัฒนา',
      'ทุ่งครุ', 'บางบอน',
    ],
    'กระบี่': ['เมืองกระบี่', 'อ่าวลึก', 'คลองท่อม'],
    'กาญจนบุรี': [
      'เมืองกาญจนบุรี', 'ไทรโยค', 'บ่อพลอย', 'ป่าไม้อุมง', 'ศรีสวัสดิ์', 'ท่ามะกา',
      'ท่าม่วง', 'ทองผาภูมิ', 'สังขละบุรี', 'พนมทวน', 'เลาขวัญ', 'ด่านมะขามเตี้ย',
      'หนองปรือ', 'ห้วยกระเจา',
    ],
    'กาฬสินธุ์': ['เมืองกาฬสินธุ์', 'ยางตลาด', 'กมลาไสย'],
    'กำแพงเพชร': ['เมืองกำแพงเพชร', 'พรานกระต่าย', 'ขาณุวรลักษบุรี'],
    'ขอนแก่น': ['เมืองขอนแก่น', 'บ้านไผ่', 'ชุมแพ'],
    'จันทบุรี': ['เมืองจันทบุรี', 'ท่าใหม่', 'ขลุง'],
    'ฉะเชิงเทรา': ['เมืองฉะเชิงเทรา', 'บางปะกง', 'พนมสารคาม'],
    'ชลบุรี': ['เมืองชลบุรี', 'บางละมุง', 'ศรีราชา'],
    'ชัยนาท': [
      'เมืองชัยนาท', 'มโนรมย์', 'วัดสิงห์', 'สรรพยา', 'สรรคบุรี', 'หันคา',
      'หนองมะโมง', 'เนินขาม',
    ],
    'ชัยภูมิ': ['เมืองชัยภูมิ', 'ภูเขียว', 'เกษตรสมบูรณ์'],
    'ชุมพร': ['เมืองชุมพร', 'หลังสวน', 'ทุ่งตะโก'],
    'เชียงราย': ['เมืองเชียงราย', 'แม่สาย', 'เชียงของ'],
    'เชียงใหม่': ['เมืองเชียงใหม่', 'แม่ริม', 'สันทราย','หางดง'],
    'ตรัง': ['เมืองตรัง', 'กันตัง', 'ห้วยยอด'],
    'ตราด': ['เมืองตราด', 'คลองใหญ่', 'เกาะช้าง'],
    'ตาก': ['เมืองตาก', 'แม่สอด', 'อุ้มผาง' ,'แม่ท้อ','วังเจ้า'],
    'นครนายก': ['เมืองนครนายก', 'ปากพลี', 'องครักษ์', 'บ้านนา'],
    'นครปฐม': [
      'เมืองนครปฐม', 'กำแพงแสน', 'นครชัยศรี', 'ดอนตูม', 'บางเลน', 'สามพราน',
      'พุทธมณฑล',
    ],
    'นครพนม': ['เมืองนครพนม', 'ท่าอุเทน', 'ธาตุพนม'],
    'นครราชสีมา': ['เมืองนครราชสีมา', 'ปากช่อง', 'พิมาย'],
    'นครศรีธรรมราช': ['เมืองนครศรีธรรมราช', 'ทุ่งสง', 'ปากพนัง'],
    'นครสวรรค์': ['เมืองนครสวรรค์', 'ตาคลี', 'พยุหะคีรี'],
    'นนทบุรี': ['เมืองนนทบุรี', 'ปากเกร็ด', 'บางบัวทอง'],
    'นราธิวาส': ['เมืองนราธิวาส', 'สุไหงโก-ลก', 'ตากใบ'],
    'น่าน': ['เมืองน่าน', 'ปัว', 'ท่าวังผา'],
    'บึงกาฬ': ['เมืองบึงกาฬ', 'ปากคาด', 'พรเจริญ'],
    'บุรีรัมย์': ['เมืองบุรีรัมย์', 'พุทไธสง', 'ประโคนชัย'],
    'ปทุมธานี': ['เมืองปทุมธานี', 'ธัญบุรี', 'คลองหลวง'],
    'ประจวบคีรีขันธ์': ['เมืองประจวบคีรีขันธ์', 'หัวหิน', 'ปราณบุรี'],
    'ปราจีนบุรี': ['เมืองปราจีนบุรี', 'กบินทร์บุรี', 'ศรีมหาโพธิ'],
    'ปัตตานี': ['เมืองปัตตานี', 'โคกโพธิ์', 'ยะหริ่ง'],
    'พระนครศรีอยุธยา': ['พระนครศรีอยุธยา', 'บางปะอิน', 'วังน้อย'],
    'พะเยา': ['เมืองพะเยา', 'เชียงคำ', 'ดอกคำใต้'],
    'พังงา': ['เมืองพังงา', 'ตะกั่วป่า', 'คุระบุรี'],
    'พัทลุง': ['เมืองพัทลุง', 'ควนขนุน', 'ปากพะยูน'],
    'พิจิตร': ['เมืองพิจิตร', 'ตะพานหิน', 'บางมูลนาก'],
    'พิษณุโลก': ['เมืองพิษณุโลก', 'วังทอง', 'บางระกำ'],
    'เพชรบุรี': ['เมืองเพชรบุรี', 'ชะอำ', 'ท่ายาง'],
    'เพชรบูรณ์': ['เมืองเพชรบูรณ์', 'หล่มสัก', 'เขาค้อ'],
    'แพร่': ['เมืองแพร่', 'สูงเม่น', 'ลอง'],
    'ภูเก็ต': ['เมืองภูเก็ต', 'กะทู้', 'ถลาง'],
    'มหาสารคาม': ['เมืองมหาสารคาม', 'บรบือ', 'โกสุมพิสัย'],
    'มุกดาหาร': ['เมืองมุกดาหาร', 'คำชะอี', 'ดอนตาล'],
    'แม่ฮ่องสอน': ['เมืองแม่ฮ่องสอน', 'ปาย', 'แม่สะเรียง'],
    'ยโสธร': ['เมืองยโสธร', 'คำเขื่อนแก้ว', 'เลิงนกทา'],
    'ยะลา': ['เมืองยะลา', 'เบตง', 'รามัน'],
    'ร้อยเอ็ด': ['เมืองร้อยเอ็ด', 'ธวัชบุรี', 'สุวรรณภูมิ'],
    'ระนอง': ['เมืองระนอง', 'กระบุรี', 'กะเปอร์'],
    'ระยอง': ['เมืองระยอง', 'บ้านฉาง', 'ปลวกแดง'],
    'ราชบุรี': ['เมืองราชบุรี', 'โพธาราม', 'บ้านโป่ง'],
    'ลพบุรี': ['เมืองลพบุรี', 'บ้านหมี่', 'โคกสำโรง'],
    'ลำปาง': ['เมืองลำปาง', 'เกาะคา', 'เถิน'],
    'ลำพูน': ['เมืองลำพูน', 'ป่าซาง', 'บ้านโฮ่ง'],
    'เลย': ['เมืองเลย', 'เชียงคาน', 'วังสะพุง'],
    'ศรีสะเกษ': ['เมืองศรีสะเกษ', 'กันทรลักษ์', 'ขุขันธ์'],
    'สกลนคร': ['เมืองสกลนคร', 'สว่างแดนดิน', 'พรรณานิคม'],
    'สงขลา': ['เมืองสงขลา', 'หาดใหญ่', 'สะเดา'],
    'สตูล': ['เมืองสตูล', 'ละงู', 'ควนกาหลง'],
    'สมุทรปราการ': ['เมืองสมุทรปราการ', 'บางพลี', 'พระประแดง'],
    'สมุทรสงคราม': ['เมืองสมุทรสงคราม', 'อัมพวา', 'บางคนที'],
    'สมุทรสาคร': ['เมืองสมุทรสาคร', 'กระทุ่มแบน', 'บ้านแพ้ว'],
    'สระแก้ว': ['เมืองสระแก้ว', 'อรัญประเทศ', 'วัฒนานคร'],
    'สระบุรี': ['เมืองสระบุรี', 'แก่งคอย', 'มวกเหล็ก'],
    'สิงห์บุรี': ['เมืองสิงห์บุรี', 'บางระจัน', 'พรหมบุรี'],
    'สุโขทัย': ['เมืองสุโขทัย', 'สวรรคโลก', 'ศรีสำโรง'],
    'สุพรรณบุรี': ['เมืองสุพรรณบุรี', 'สองพี่น้อง', 'อู่ทอง'],
    'สุราษฎร์ธานี': ['เมืองสุราษฎร์ธานี', 'เกาะสมุย', 'กาญจนดิษฐ์'],
    'สุรินทร์': ['เมืองสุรินทร์', 'ท่าตูม', 'จอมพระ'],
    'หนองคาย': ['เมืองหนองคาย', 'ท่าบ่อ', 'โพนพิสัย'],
    'หนองบัวลำภู': ['เมืองหนองบัวลำภู', 'นากลาง', 'สุวรรณคูหา'],
    'อ่างทอง': ['เมืองอ่างทอง', 'วิเศษชัยชาญ', 'ป่าโมกข์'],
    'อำนาจเจริญ': ['เมืองอำนาจเจริญ', 'ชานุมาน', 'ปทุมราชวงศา'],
    'อุดรธานี': ['เมืองอุดรธานี', 'กุมภวาปี', 'หนองหาน'],
    'อุตรดิตถ์': ['เมืองอุตรดิตถ์', 'ลับแล', 'พิชัย'],
    'อุทัยธานี': ['เมืองอุทัยธานี', 'ทัพทัน', 'บ้านไร่'],
    'อุบลราชธานี': ['เมืองอุบลราชธานี', 'วารินชำราบ', 'เดชอุดม'],
  };

   static const List<String> foodTypes = const [
   
    "อาหารไทย", "อาหารตามสั่ง", "อาหารอีสาน", "อาหารญี่ปุ่น", "อาหารเกาหลี",
    "อาหารจีน", "อาหารใต้", "อาหารยุโรป", "อาหารอิตาเลียน", "อาหารอินเดีย", "อาหารเจ/มังสวิรัติ",
    "อาหารทะเล","ก๋วยเตี๋ยว","สุกี้/ชาบู","หมูกระทะ" ,"คาเฟ่/ของหวาน", "ของทานเล่น/ขนม", "อื่นๆ",
  ];

}