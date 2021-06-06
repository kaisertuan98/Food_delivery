import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/widgets/customNavBar.dart';

class InboxScreen extends StatelessWidget {
  static const routeName = "/inboxScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.arrow_back_ios_rounded),
                      ),
                      Expanded(
                        child: Text(
                          "Tin nhắn",
                          style: Helper.getTheme(context).headline5,
                        ),
                      ),
                      Icon(
                        Icons.event_available,
                        size: 30,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                MailCard(
                  title: "Khuyến mãi 50%",
                  description:
                      "Tận Hưởng Món Ngon Tại Nhà. Tặng Mã Giảm Giá 25K ",
                  time: "05 tháng 6",
                ),
                MailCard(
                  title: "Deal DeFood",
                  description:
                      "Ăn Ngon Tại Nhà Đã Có Mã Giảm Giá Freeship 40K ",
                  time: "04 tháng 6",
                  color: AppColor.placeholderBg,
                ),
                MailCard(
                  title: "Ưu đãi từ 19h-21h",
                  description:
                      "DeFood Khuyến Mãi Đồng Giá 29K Cho Bạn Ăn Khuya Chẳng Ngại",
                  time: "03 tháng 6",
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              more: true,
            ),
          ),
        ],
      ),
    );
  }
}

class MailCard extends StatelessWidget {
  const MailCard({
    Key key,
    String time,
    String title,
    String description,
    Color color = Colors.white,
  })  : _time = time,
        _title = title,
        _description = description,
        _color = color,
        super(key: key);

  final String _time;
  final String _title;
  final String _description;
  final Color _color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: double.infinity,
      decoration: BoxDecoration(
        color: _color,
        border: Border(
          bottom: BorderSide(
            color: AppColor.placeholder,
            width: 0.5,
          ),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundColor: AppColor.orange,
            radius: 5,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  _title,
                  style: TextStyle(
                    color: AppColor.primary,
                  ),
                ),
                SizedBox(height: 5),
                Text(_description),
              ],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _time,
                style: TextStyle(
                  fontSize: 10,
                ),
              ),
              Image.asset(Helper.getAssetName("star.png", "virtual"))
            ],
          ),
        ],
      ),
    );
  }
}
