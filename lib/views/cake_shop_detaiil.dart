// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_kin_cake_kun_app/models/cake_shop.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CakeShopDetailUi extends StatefulWidget {
  // สร้างตัวแปรรับค่าที่ส่งมา
  CakeShop? cakeShop;

  // ตัวแปรที่สร้างมารับค่าที่ส่งมา
  CakeShopDetailUi({super.key, this.cakeShop});

  @override
  State<CakeShopDetailUi> createState() => _CakeShopDetailUiState();
}

class _CakeShopDetailUiState extends State<CakeShopDetailUi> {
  // method call
  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  // method open browser (web, facebook, google map)
  Future<void> _launchInBrowser(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.cakeShop!.name!,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
        ),
      ),
      // ส่วนของแสดงรายละเอียดร้าน
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(40.0),
          child: Center(
            child: Column(
              children: [
                // ส่วนแสดงรูปร้าน
                ClipRRect(
                  child: Image.asset(
                    'assets/images/${widget.cakeShop!.image1!}',
                    width: 120.0,
                    height: 85.0,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      child: Image.asset(
                        'assets/images/${widget.cakeShop!.image2!}',
                        width: 120.0,
                        height: 85.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(width: 20.0),
                    ClipRRect(
                      child: Image.asset(
                        'assets/images/${widget.cakeShop!.image3!}',
                        width: 120.0,
                        height: 85.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                // ส่วนแสดงรายละเอียดร้าน
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    // widget.cakeShop!.name!,
                    '${widget.cakeShop!.name!} 🏡',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                // รายละเอียดของร้าน
                Text(
                  widget.cakeShop!.description!,
                  style: TextStyle(
                    color: Colors.grey[800],
                  ),
                ),
                SizedBox(height: 10.0),
                // เวลาเปิด-ปิด
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'เวลาเปิดปิด',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.openCloseTime!,
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),
                // ที่อยู่ร้าน
                SizedBox(height: 20.0),
                // เวลาเปิด-ปิด
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ที่อยู่ร้าน',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    widget.cakeShop!.address!,
                    style: TextStyle(
                      color: Colors.grey[800],
                    ),
                  ),
                ),

                SizedBox(height: 20.0),
                //เบอร์โทรร้าน
                ElevatedButton(
                  onPressed: () {
                    _makePhoneCall(widget.cakeShop!.phone!);
                  },
                  child: Text(
                    '📞 ${widget.cakeShop!.phone!}',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50.0,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                //เว็บไซต์ร้าน
                ListTile(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.cakeShop!.website!),
                    );
                  },
                  leading: Icon(
                    FontAwesomeIcons.globe,
                    color: Colors.pink,
                    size: 40.0,
                  ),
                  title: Text(
                    widget.cakeShop!.website!,
                    style: TextStyle(
                      color: Colors.pink,
                    ),
                  ),
                  trailing: Icon(
                    FontAwesomeIcons.link,
                    color: Colors.grey[600],
                  ),
                ),
                SizedBox(height: 20.0),
                // Facebook
                InkWell(
                  onTap: () {
                    _launchInBrowser(
                      Uri.parse(widget.cakeShop!.facebook!),
                    );
                  },
                  child: Icon(
                    FontAwesomeIcons.facebook,
                    color: Colors.blue,
                    size: 50.0,
                  ),
                ),
                SizedBox(height: 20.0),
                // Map
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  child: FlutterMap(
                    //กำหนดตำแหน่งของแผนที่
                    options: MapOptions(
                      initialCenter: LatLng(
                        double.parse(widget.cakeShop!.latitude!),
                        double.parse(widget.cakeShop!.longitude!),
                      ),
                      initialZoom: 15.0,
                    ),
                    //วาดแผนที่
                    children: [
                      TileLayer(
                        urlTemplate:
                            'https://{s}.google.com/vt/lyrs=m,h&x={x}&y={y}&z={z}&hl=ar-MA&gl=MA',
                        subdomains: const ['mt0', 'mt1', 'mt2', 'mt3'],
                        userAgentPackageName: 'com.example.app',
                      ),
                      RichAttributionWidget(
                        attributions: [
                          TextSourceAttribution(
                            'OpenStreetMap contributors',
                            onTap: () {
                              launchUrl(
                                Uri.parse(
                                    'https://openstreetmap.org/copyright'),
                              );
                            },
                          ),
                        ],
                      ),
                      // กำหนด Marker (สามารถแสดงได้มากกว่า 1 marker)
                      MarkerLayer(
                        markers: [
                          Marker(
                            point: LatLng(
                              double.parse(widget.cakeShop!.latitude!),
                              double.parse(widget.cakeShop!.longitude!),
                            ),
                            child: InkWell(
                              onTap: () {
                                //เปิด Google Maps ด้วยพิกัดที่กำหนด
                                String googleMapsUrl =
                                    'https://www.google.com/maps/search/?api=1&query=${widget.cakeShop!.latitude!},${widget.cakeShop!.longitude!}';
                                _launchInBrowser(Uri.parse(googleMapsUrl));
                              },
                              child: Icon(
                                // FontAwesomeIcons.locationArrow,
                                Icons.location_pin,
                                color: Colors.red,
                                size: 40.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
