import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/widgets/customNavBar.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = "/aboutScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_rounded,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "Điều khoản và dịch vụ",
                          style: Helper.getTheme(context).headline5,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      AboutCard(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(
              menu: true,
            ),
          ),
        ],
      ),
    );
  }
}

class AboutCard extends StatelessWidget {
  const AboutCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 5,
            backgroundColor: AppColor.orange,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: Text(
              "DeFood bảo lưu quyền điều chỉnh, thay thế, sửa đổi và bổ sung Điều Kiện Vận Chuyển hoặc bất kỳ chính sách nào trong Điều Kiện Vận Chuyển này tại bất kỳ thời điểm nào khi xét thấy phù hợp với quy định của pháp luật. Các điều chỉnh, thay thế, sửa đổi và bổ sung của Điều Kiện Vận Chuyển hoặc các chính sách được quy định trong Điều Kiện Sử Dụng sẽ có hiệu lực ngay khi được đă ng trên DEFOOD.VN hoặc ứng dụng DEFOOD.",
              style: TextStyle(
                color: AppColor.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
