

import 'package:dart_ipify/dart_ipify.dart';

class IpAddressInfo{

  static Future<String> getIpAddressV4() async {
    final ipv4 = await Ipify.ipv4();
    return ipv4; // 98.207.254.136

  }

  static getIpAddressV6() async {
    final ipv6 = await Ipify.ipv64();
    return ipv6; // 98.207.254.136 or 2a00:1450:400f:80d::200e

  }



}