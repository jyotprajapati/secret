import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:intl/intl.dart';
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
      appBar: AppBar(
        title: Text("Notifications"),
      ),
      body: notifications == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : CustomScrollView(
              slivers: [
                SliverStickyHeader.builder(
                  builder: (context, state) => Container(
                    height: 60.0,
                    color: (state.isPinned ? Colors.white : Colors.white)
                        .withOpacity(1.0 - state.scrollPercentage),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Likes',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundImage: NetworkImage(notifications!
                                .likedNotification![i].otherUser!.photoUrl!),
                          ),
                          trailing: Text(
                              '${DateFormat(DateFormat.ABBR_MONTH_DAY).format(DateTime.parse(notifications!.likedNotification![i].likedOn!))}'),
                          title: Text(
                              '${notifications!.likedNotification![i].otherUser!.name!} liked your video'),
                        ),
                      ),
                      childCount: notifications!.likedNotification!.length,
                    ),
                  ),
                ),
                SliverStickyHeader.builder(
                  builder: (context, state) => Container(
                    height: 60.0,
                    color: (state.isPinned ? Colors.white : Colors.white)
                        .withOpacity(1.0 - state.scrollPercentage),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Comments',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                        (context, i) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListTile(
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(notifications!
                                      .commentNotification![i]
                                      .otherUser!
                                      .photoUrl!),
                                ),
                                trailing: Text(
                                    '${DateFormat(DateFormat.ABBR_MONTH_DAY).format(DateTime.parse(notifications!.commentNotification![i].commentOn!))}'),
                                title: Text(
                                    '${notifications!.commentNotification![i].otherUser!.name} commented on your video}'),
                              ),
                            ),
                        childCount: notifications!.commentNotification!.length),
                  ),
                ),
                SliverStickyHeader.builder(
                  builder: (context, state) => Container(
                    height: 60.0,
                    color: (state.isPinned ? Colors.white : Colors.white)
                        .withOpacity(1.0 - state.scrollPercentage),
                    padding: EdgeInsets.symmetric(horizontal: 16.0),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Follows',
                      style: const TextStyle(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                  ),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, i) {
                        final notif = notifications!.followNotification![i];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(notif.otherUser!.photoUrl!),
                            ),
                            trailing: Text(
                                '${DateFormat(DateFormat.ABBR_MONTH_DAY).format(DateTime.parse(notifications!.followNotification![i].followOn!))}'),
                            title: Text(
                                '${notif.otherUser!.name} started following you'),
                          ),
                        );
                      },
                      childCount: notifications!.followNotification!.length,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
    this.index,
    this.title,
    this.color = Colors.lightBlue,
  }) : super(key: key);

  final String? title;
  final int? index;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: color,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      alignment: Alignment.centerLeft,
      child: Text(
        title ?? 'Header #$index',
        style: const TextStyle(color: Colors.white),
      ),
    );
  }
}
