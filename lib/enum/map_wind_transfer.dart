import 'package:mahjong_cal/enum/enum_wind.dart';

const Map<EnumWind, EnumWind> threePlayerWindTransfer = {
  EnumWind.east: EnumWind.south,
  EnumWind.south: EnumWind.west,
  EnumWind.west: EnumWind.east
};

const Map<EnumWind, EnumWind> fourPlayerWindTransfer = {
  EnumWind.east: EnumWind.south,
  EnumWind.south: EnumWind.west,
  EnumWind.west: EnumWind.north,
  EnumWind.north: EnumWind.east
};
