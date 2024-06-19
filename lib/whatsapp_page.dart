import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsappclone/theme.dart';
import 'package:whatsappclone/widgets/call_view.dart';
import 'package:whatsappclone/widgets/chat_view.dart';
import 'package:whatsappclone/widgets/status_view.dart';

class WhatsAppPage extends StatefulWidget {
  const WhatsAppPage({super.key});

  @override
  State<WhatsAppPage> createState() => _WhatsAppPageState();
}

class _WhatsAppPageState extends State<WhatsAppPage>
    with SingleTickerProviderStateMixin {
  final tabs = [
    Tab(
      icon: Icon(
        Icons.camera_alt,
        size: 20,
      ),
    ),
    Tab(
      text: 'Chats',
    ),
    Tab(
      text: 'Updates',
    ),
    Tab(
      text: 'Calls',
    ),
  ];
  TabController? tabController;
  var fabIcon = Icons.message;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: tabs.length, vsync: this);
    tabController?.index = 1;
    tabController?.addListener(() {
      setState(() {
        switch (tabController?.index) {
          case 0:
            fabIcon = Icons.camera;
            break;
          case 1:
            fabIcon = Icons.message;
            break;
          case 2:
            fabIcon = Icons.camera_alt;
            break;
          case 3:
            fabIcon = Icons.call;
            break;
          default:
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'WhatsApp',
          style: customTextStyle.copyWith(
              color: Color(0xFFFFFFFF),
              fontSize: 26,
              fontWeight: FontWeight.w400),
        ),
        backgroundColor: whatsAppGreen,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(Icons.photo_camera_outlined, color: Color(0xFFFFFFFF)),
          ),
          Icon(
            Icons.search,
            color: Color(0xFFFFFFFF),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Icon(
              Icons.more_vert,
              color: Color(0xFFFFFFFF),
            ),
          ),
        ],
        bottom: TabBar(
          controller: tabController,
          tabs: tabs,
          indicatorColor: Colors.white,
          labelColor: Colors.white,
          unselectedLabelColor: Colors.white.withOpacity(0.5),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Center(
            child: Icon(Icons.camera_alt, size: 100, color: whatsAppGreen),
          ),
          ChatView(),
          StatusView(),
          CallView(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: whatsAppLightGreen,
        onPressed: () {},
        child: Icon(fabIcon, color: Colors.white),
      ),
    );
  }
}
