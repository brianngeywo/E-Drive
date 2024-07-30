List<Map<String, dynamic>> parentCars = [
  {'id': 1, 'name': 'Toyota'},
  {'id': 2, 'name': 'Audi'},
  {'id': 3, 'name': 'Subaru'},
  {'id': 4, 'name': 'Mazda'},
  {'id': 5, 'name': 'Nissan'},
  {'id': 6, 'name': 'Mercedes Benz'},
];

List<Map<String, dynamic>> carModels = [
  {
    'id': 1,
    'image': 'assets/images/Land Cruiser Prado.png',
    'parent_car_id': 1,
    'name': 'Land Cruiser Prado',
    'fuel_efficiency': 9.0,
    'fuel_tank_capacity': 87.0
  },
  {
    'id': 2,
    'image': 'assets/images/Hiace.png',
    'parent_car_id': 1,
    'name': 'Hiace',
    'fuel_efficiency': 10.0,
    'fuel_tank_capacity': 70.0
  },
  {
    'id': 3,
    'image': 'assets/images/Vitz.png',
    'parent_car_id': 1,
    'name': 'Vitz',
    'fuel_efficiency': 21.0,
    'fuel_tank_capacity': 45.0
  },
  {
    'id': 4,
    'image': 'assets/images/Hilux.png',
    'parent_car_id': 1,
    'name': 'Hilux',
    'fuel_efficiency': 12.0,
    'fuel_tank_capacity': 80.0
  },
  {
    'id': 5,
    'image': 'assets/images/Mark X.png',
    'parent_car_id': 1,
    'name': 'Mark X',
    'fuel_efficiency': 12.0,
    'fuel_tank_capacity': 70.0
  },
  {
    'id': 6,
    'image': 'assets/images/RAV4.png',
    'parent_car_id': 1,
    'name': 'RAV4',
    'fuel_efficiency': 15.0,
    'fuel_tank_capacity': 55.0
  },
  {
    'id': 7,
    'image': 'assets/images/Audi Q5.png',
    'parent_car_id': 2,
    'name': 'Audi Q5',
    'fuel_efficiency': 13.0,
    'fuel_tank_capacity': 70.0
  },
  {
    'id': 8,
    'image': 'assets/images/Audi Q3.png',
    'parent_car_id': 2,
    'name': 'Audi Q3',
    'fuel_efficiency': 14.0,
    'fuel_tank_capacity': 64.0
  },
  {
    'id': 9,
    'image': 'assets/images/Audi Q7.png',
    'parent_car_id': 2,
    'name': 'Audi Q7',
    'fuel_efficiency': 10.0,
    'fuel_tank_capacity': 85.0
  },
  {
    'id': 10,
    'image': 'assets/images/Audi RS Q8.png',
    'parent_car_id': 2,
    'name': 'Audi RS Q8',
    'fuel_efficiency': 9.0,
    'fuel_tank_capacity': 85.0
  },
  {
    'id': 11,
    'image': 'assets/images/Audi A3.png',
    'parent_car_id': 2,
    'name': 'Audi A3',
    'fuel_efficiency': 17.0,
    'fuel_tank_capacity': 50.0
  },
  {
    'id': 12,
    'image': 'assets/images/Audi TT.png',
    'parent_car_id': 2,
    'name': 'Audi TT',
    'fuel_efficiency': 14.0,
    'fuel_tank_capacity': 55.0
  },
  {
    'id': 13,
    'image': 'assets/images/Forester.png',
    'parent_car_id': 3,
    'name': 'Forester',
    'fuel_efficiency': 13.0,
    'fuel_tank_capacity': 63.0
  },
  {
    'id': 14,
    'image': 'assets/images/Legacy.png',
    'parent_car_id': 3,
    'name': 'Legacy',
    'fuel_efficiency': 12.0,
    'fuel_tank_capacity': 60.0
  },
  {
    'id': 15,
    'image': 'assets/images/Impreza.png',
    'parent_car_id': 3,
    'name': 'Impreza',
    'fuel_efficiency': 14.0,
    'fuel_tank_capacity': 50.0
  },
  {
    'id': 16,
    'image': 'assets/images/Outback.png',
    'parent_car_id': 3,
    'name': 'Outback',
    'fuel_efficiency': 12.0,
    'fuel_tank_capacity': 70.0
  },
  {
    'id': 17,
    'image': 'assets/images/Ascent.png',
    'parent_car_id': 3,
    'name': 'Ascent',
    'fuel_efficiency': 10.0,
    'fuel_tank_capacity': 73.0
  },
  {
    'id': 18,
    'image': 'assets/images/WRX.png',
    'parent_car_id': 3,
    'name': 'WRX',
    'fuel_efficiency': 11.0,
    'fuel_tank_capacity': 60.0
  },
  {
    'id': 19,
    'image': 'assets/images/CX3.png',
    'parent_car_id': 4,
    'name': 'CX-3',
    'fuel_efficiency': 18.0,
    'fuel_tank_capacity': 48.0
  },
  {
    'id': 20,
    'image': 'assets/images/CX5.png',
    'parent_car_id': 4,
    'name': 'CX-5',
    'fuel_efficiency': 15.0,
    'fuel_tank_capacity': 58.0
  },
  {
    'id': 21,
    'image': 'assets/images/Demio.png',
    'parent_car_id': 4,
    'name': 'Demio',
    'fuel_efficiency': 23.0,
    'fuel_tank_capacity': 41.0
  },
  {
    'id': 22,
    'image': 'assets/images/Atenza.png',
    'parent_car_id': 4,
    'name': 'Atenza',
    'fuel_efficiency': 16.0,
    'fuel_tank_capacity': 62.0
  },
  {
    'id': 23,
    'image': 'assets/images/Axela.png',
    'parent_car_id': 4,
    'name': 'Axela',
    'fuel_efficiency': 18.0,
    'fuel_tank_capacity': 51.0
  },
  {
    'id': 24,
    'image': 'assets/images/CX 8.png',
    'parent_car_id': 4,
    'name': 'CX-8',
    'fuel_efficiency': 13.0,
    'fuel_tank_capacity': 72.0
  },
  {
    'id': 25,
    'image': 'assets/images/X-Trail.png',
    'parent_car_id': 5,
    'name': 'X-Trail',
    'fuel_efficiency': 15.0,
    'fuel_tank_capacity': 60.0
  },
  {
    'id': 26,
    'image': 'assets/images/Juke.png',
    'parent_car_id': 5,
    'name': 'Juke',
    'fuel_efficiency': 16.0,
    'fuel_tank_capacity': 46.0
  },
  {
    'id': 27,
    'image': 'assets/images/Note.png',
    'parent_car_id': 5,
    'name': 'Note',
    'fuel_efficiency': 20.0,
    'fuel_tank_capacity': 41.0
  },
  {
    'id': 28,
    'image': 'assets/images/Navara.png',
    'parent_car_id': 5,
    'name': 'Navara',
    'fuel_efficiency': 12.0,
    'fuel_tank_capacity': 80.0
  },
  {
    'id': 29,
    'image': 'assets/images/Wingroad.png',
    'parent_car_id': 5,
    'name': 'Wingroad',
    'fuel_efficiency': 16.0,
    'fuel_tank_capacity': 45.0
  },
  {
    'id': 30,
    'image': 'assets/images/Teana.png',
    'parent_car_id': 5,
    'name': 'Teana',
    'fuel_efficiency': 12.0,
    'fuel_tank_capacity': 70.0
  },
  {
    'id': 31,
    'image': 'assets/images/GLE 350.png',
    'parent_car_id': 6,
    'name': 'GLE 350',
    'fuel_efficiency': 10.0,
    'fuel_tank_capacity': 85.0
  },
  {
    'id': 32,
    'image': 'assets/images/E200.png',
    'parent_car_id': 6,
    'name': 'E200',
    'fuel_efficiency': 16.0,
    'fuel_tank_capacity': 66.0
  },
  {
    'id': 33,
    'image': 'assets/images/C200.png',
    'parent_car_id': 6,
    'name': 'C200',
    'fuel_efficiency': 16.0,
    'fuel_tank_capacity': 66.0
  },
  {
    'id': 34,
    'image': 'assets/images/E400.png',
    'parent_car_id': 6,
    'name': 'E400',
    'fuel_efficiency': 12.0,
    'fuel_tank_capacity': 80.0
  },
  {
    'id': 35,
    'image': 'assets/images/B180.png',
    'parent_car_id': 6,
    'name': 'B180',
    'fuel_efficiency': 19.0,
    'fuel_tank_capacity': 50.0
  },
  {
    'id': 36,
    'image': 'assets/images/GLC 250.png',
    'parent_car_id': 6,
    'name': 'GLC 250',
    'fuel_efficiency': 14.0,
    'fuel_tank_capacity': 66.0
  },
];
