import 'package:flutter/material.dart';
import 'package:notifications/comman/webservice.dart';
import 'package:notifications/comman/webserviceResponse.dart';
import 'package:notifications/features/notification/notification_modal.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  NotificationModal? notifications;

  fetchNotifications() async {
    WebserviceManager wsm = WebserviceManager();

    WebserviceResponse response = await wsm.makeGetRequest("notification");
    if (response.isError) {
      return;
    }
    notifications = NotificationModal.fromJson(response.responseBody);
    setState(() {});
  }

  @override
  void initState() {
    fetchNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: notifications == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: 2,
              itemBuilder: (context, index) => Card(
                child: Row(
                  children: [
                    Text(
                        "${notifications!.likedNotification![0].otherUser!.name!} liked your video ")
                  ],
                ),
              ),
            ),
    );
  }
}
