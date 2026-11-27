import 'package:flutter/material.dart';

class HotlineItem {
  final String name;
  final String phone;
  final IconData icon;
  final String imageAsset;

  const HotlineItem({
    required this.name,
    required this.phone,
    required this.icon,
    required this.imageAsset,
  });
}

class HotlineCategory {
  final String title;
  final String subtitle;
  final String folder;
  final String prefix;
  final List<HotlineItem> items;

  const HotlineCategory({
    required this.title,
    required this.subtitle,
    required this.folder,
    required this.prefix,
    required this.items,
  });
}

const travelCategory = HotlineCategory(
  title: 'การเดินทาง',
  subtitle: 'สอบถามข้อมูลการเดินทาง',
  folder: 'travel',
  prefix: 'travel',
  items: [
    HotlineItem(
      name: 'กรมทางหลวงชนบท',
      phone: '1146',
      icon: Icons.directions,
      imageAsset: 'assets/images/travel/travel_1.png',
    ),
    HotlineItem(
      name: 'ตำรวจท่องเที่ยว',
      phone: '1155',
      icon: Icons.security,
      imageAsset: 'assets/images/travel/travel_2.png',
    ),
    HotlineItem(
      name: 'ตำรวจทางหลวง',
      phone: '1193',
      icon: Icons.local_police,
      imageAsset: 'assets/images/travel/travel_3.png',
    ),
    HotlineItem(
      name: 'ข้อมูลจราจร',
      phone: '1197',
      icon: Icons.traffic,
      imageAsset: 'assets/images/travel/travel_4.png',
    ),
    HotlineItem(
      name: 'ขสมก.',
      phone: '1348',
      icon: Icons.directions_bus,
      imageAsset: 'assets/images/travel/travel_5.png',
    ),
    HotlineItem(
      name: 'บขส.',
      phone: '1490',
      icon: Icons.directions_bus_filled,
      imageAsset: 'assets/images/travel/travel_6.png',
    ),
    HotlineItem(
      name: 'เส้นทางบนทางด่วน',
      phone: '1543',
      icon: Icons.add_road,
      imageAsset: 'assets/images/travel/travel_7.png',
    ),
    HotlineItem(
      name: 'กรมทางหลวง',
      phone: '1586',
      icon: Icons.directions_car,
      imageAsset: 'assets/images/travel/travel_8.png',
    ),
    HotlineItem(
      name: 'การรถไฟแห่งประเทศไทย',
      phone: '1690',
      icon: Icons.train,
      imageAsset: 'assets/images/travel/travel_9.png',
    ),
  ],
);

const emgCategory = HotlineCategory(
  title: 'อุบัติเหตุ-เหตุฉุกเฉิน',
  subtitle: 'แจ้งอุบัติเหตุและเหตุฉุกเฉิน',
  folder: 'emergency',
  prefix: 'emg',
  items: [
    HotlineItem(
      name: 'เหตุด่วนเหตุร้าย',
      phone: '191',
      icon: Icons.warning,
      imageAsset: 'assets/images/emergency/emg_1.png',
    ),
    HotlineItem(
      name: 'แจ้งไฟไหม้ สัตว์เข้าบ้าน',
      phone: '199',
      icon: Icons.local_fire_department,
      imageAsset: 'assets/images/emergency/emg_2.png',
    ),
    HotlineItem(
      name: 'สายด่วนรถหาย (ตำรวจแห่งชาติ)',
      phone: '1192',
      icon: Icons.car_crash,
      imageAsset: 'assets/images/emergency/emg_3.png',
    ),
    HotlineItem(
      name: 'อุบัติเหตุทางน้ำ',
      phone: '1196',
      icon: Icons.sailing,
      imageAsset: 'assets/images/emergency/emg_4.png',
    ),
    HotlineItem(
      name: 'แจ้งคนหาย',
      phone: '1300',
      icon: Icons.person_search,
      imageAsset: 'assets/images/emergency/emg_5.png',
    ),
    HotlineItem(
      name: 'ศูนย์ปลอดภัยคมนาคม',
      phone: '1356',
      icon: Icons.health_and_safety,
      imageAsset: 'assets/images/emergency/emg_6.png',
    ),
    HotlineItem(
      name: 'หน่วยแพทย์กู้ชีพ',
      phone: '1554',
      icon: Icons.medical_services,
      imageAsset: 'assets/images/emergency/emg_7.png',
    ),
    HotlineItem(
      name: 'ศูนย์เอราวัณ',
      phone: '1646',
      icon: Icons.local_hospital,
      imageAsset: 'assets/images/emergency/emg_8.png',
    ),
    HotlineItem(
      name: 'เจ็บป่วยฉุกเฉิน',
      phone: '1669',
      icon: Icons.emergency,
      imageAsset: 'assets/images/emergency/emg_9.png',
    ),
  ],
);

const bankCategory = HotlineCategory(
  title: 'ธนาคาร',
  subtitle: 'สอบถามข้อมูลและติดต่อธนาคาร',
  folder: 'bank',
  prefix: 'bank',
  items: [
    HotlineItem(
      name: 'ธนาคารกรุงเทพ',
      phone: '1333',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_1.png',
    ),
    HotlineItem(
      name: 'ธนาคารออมสิน',
      phone: '1115',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_2.png',
    ),
    HotlineItem(
      name: 'ธนาคารกสิกรไทย',
      phone: '02-888-8888',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_3.png',
    ),
    HotlineItem(
      name: 'ธนาคารกรุงไทย',
      phone: '02-111-1111',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_4.png',
    ),
    HotlineItem(
      name: 'ธนาคารกรุงศรีอยุธยา',
      phone: '1572',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_5.png',
    ),
    HotlineItem(
      name: 'ธนาคารทหารไทยธนชาต',
      phone: '1428',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_6.png',
    ),
    HotlineItem(
      name: 'ธนาคารซิตี้แบงก์',
      phone: '1588',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_7.png',
    ),
    HotlineItem(
      name: 'ธนาคารแลนด์ แอนด์ เฮ้าส์',
      phone: '1327',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_8.png',
    ),
    HotlineItem(
      name: 'ธนาคารอาคารสงเคราะห์',
      phone: '02-645-9000',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_9.png',
    ),
    HotlineItem(
      name: 'ธนาคารไทยพาณิชย์',
      phone: '02-777-7777',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_10.png',
    ),
    HotlineItem(
      name: 'ธนาคารเกียรตินาคินภัทร',
      phone: '02-165-5555',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_11.png',
    ),
    HotlineItem(
      name: 'ธนาคารไทยเครดิต',
      phone: '02-697-5454',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_12.png',
    ),
    HotlineItem(
      name: 'ธนาคารยูโอบี',
      phone: '02-285-1555',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_13.png',
    ),
    HotlineItem(
      name: 'ธนาคารทิสโก้',
      phone: '02-633-6000',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_14.png',
    ),
    HotlineItem(
      name: 'ธนาคารอิสลามแห่งประเทศไทย',
      phone: '02-204-2766',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_15.png',
    ),
    HotlineItem(
      name: 'ธนาคารซีไอเอ็มบี ไทย',
      phone: '02-626-7777',
      icon: Icons.account_balance,
      imageAsset: 'assets/images/bank/bank_16.png',
    ),
  ],
);

const pubCategory = HotlineCategory(
  title: 'สาธารณูปโภค',
  subtitle: 'ติดต่อหน่วยงานสาธารณูปโภค',
  folder: 'pubutil',
  prefix: 'pub',
  items: [
    HotlineItem(
      name: 'การไฟฟ้านครหลวง',
      phone: '1130',
      icon: Icons.electrical_services,
      imageAsset: 'assets/images/pubutil/pub_1.png',
    ),
    HotlineItem(
      name: 'การไฟฟ้าส่วนภูมิภาค',
      phone: '1129',
      icon: Icons.electrical_services,
      imageAsset: 'assets/images/pubutil/pub_2.png',
    ),
    HotlineItem(
      name: 'การไฟฟ้าฝ่ายผลิต',
      phone: '1416',
      icon: Icons.bolt,
      imageAsset: 'assets/images/pubutil/pub_3.png',
    ),
    HotlineItem(
      name: 'การประปานครหลวง',
      phone: '1125',
      icon: Icons.water_drop,
      imageAsset: 'assets/images/pubutil/pub_4.png',
    ),
    HotlineItem(
      name: 'การประปาส่วนภูมิภาค',
      phone: '1662',
      icon: Icons.water,
      imageAsset: 'assets/images/pubutil/pub_5.png',
    ),
    HotlineItem(
      name: 'ทรู',
      phone: '1242',
      icon: Icons.phone,
      imageAsset: 'assets/images/pubutil/pub_6.png',
    ),
    HotlineItem(
      name: 'ดีแทค',
      phone: '1678',
      icon: Icons.phone,
      imageAsset: 'assets/images/pubutil/pub_7.png',
    ),
    HotlineItem(
      name: 'เอไอเอส',
      phone: '1175',
      icon: Icons.phone,
      imageAsset: 'assets/images/pubutil/pub_8.png',
    ),
    HotlineItem(
      name: 'ทีโอที',
      phone: '1100',
      icon: Icons.phone,
      imageAsset: 'assets/images/pubutil/pub_9.png',
    ),
  ],
);

// ชื่อสำรองสำหรับไฟล์หน้า UI ที่เรียกใช้
const travelData = travelCategory;
const emergencyCategory = emgCategory;
const emergencyData = emgCategory;
const bankData = bankCategory;
const publicUtilityCategory = pubCategory;
const publicUtilityData = pubCategory;

const publicCategory = pubCategory;
