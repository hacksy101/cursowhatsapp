import 'package:flutter/material.dart';
import 'package:whatsapp/screens/chat_list_widget.dart';
import 'package:whatsapp/screens/placeholder_widget.dart';

class WhatsApp extends StatefulWidget {
  @override
  _WhatsAppState createState() => _WhatsAppState();
}

class _WhatsAppState extends State<WhatsApp>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, initialIndex: 1, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              icon: Icon(Icons.camera_alt)
            ),
            Tab(child: Text("CHATS")),
            Tab(child: Text("STATUS")),
            Tab(child: Text("CALLS")),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        child: Icon(
          Icons.description,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          PlaceHolderWidget(),
          ChatListWidget(),
          PlaceHolderWidget(),
          PlaceHolderWidget(),
        ],
      ),
    );
  }
}
