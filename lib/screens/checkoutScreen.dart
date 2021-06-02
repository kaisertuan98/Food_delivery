import 'package:flutter/material.dart';
import 'package:monkey_app_demo/const/colors.dart';
import 'package:monkey_app_demo/screens/changeAddressScreen.dart';
import 'package:monkey_app_demo/screens/homeScreen.dart';
import 'package:monkey_app_demo/utils/helper.dart';
import 'package:monkey_app_demo/widgets/customNavBar.dart';
import 'package:monkey_app_demo/widgets/customTextInput.dart';

class CheckoutScreen extends StatelessWidget {
  static const routeName = "/checkoutScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                        "Thanh toán",
                        style: Helper.getTheme(context).headline5,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text("Địa chỉ giao hàng"),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Helper.getScreenWidth(context) * 0.4,
                        child: Text(
                          "Hoà Quý, Ngũ Hành Sơn, Đà Nẵng",
                          style: Helper.getTheme(context).headline3,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context)
                              .pushNamed(ChangeAddressScreen.routeName);
                        },
                        child: Text(
                          "Thay đổi",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 10,
                  width: double.infinity,
                  color: AppColor.placeholderBg,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Phương thức thanh toán"),
                      TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              isScrollControlled: true,
                              isDismissible: false,
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: Helper.getScreenHeight(context) * 0.7,
                                  child: Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: Icon(
                                              Icons.clear,
                                            ),
                                          )
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          children: [
                                            Text(
                                              "Thêm thẻ Credit/Debit",
                                              style: Helper.getTheme(context)
                                                  .headline3,
                                            )
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Divider(
                                          color: AppColor.placeholder
                                              .withOpacity(0.5),
                                          thickness: 1.5,
                                          height: 40,
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child:
                                            CustomTextInput(hintText: "Số thẻ"),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text("Hết hạn"),
                                            SizedBox(
                                              height: 50,
                                              width: 100,
                                              child: CustomTextInput(
                                                hintText: "MM",
                                                padding: const EdgeInsets.only(
                                                    left: 35),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 50,
                                              width: 100,
                                              child: CustomTextInput(
                                                hintText: "YY",
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: CustomTextInput(
                                            hintText: "Mã bảo mật"),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: CustomTextInput(hintText: "Họ"),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: CustomTextInput(hintText: "Tên"),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: Helper.getScreenWidth(
                                                      context) *
                                                  0.4,
                                              child: Text(
                                                  "Bạn có thể xóa thẻ này bất cứ lúc nào"),
                                            ),
                                            Switch(
                                              value: false,
                                              onChanged: (_) {},
                                              thumbColor:
                                                  MaterialStateProperty.all(
                                                AppColor.secondary,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 30,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20.0),
                                        child: SizedBox(
                                          height: 50,
                                          child: ElevatedButton(
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Icon(
                                                    Icons.add,
                                                  ),
                                                  SizedBox(width: 40),
                                                  Text("Thêm thẻ"),
                                                  SizedBox(width: 40),
                                                ],
                                              )),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Row(
                          children: [
                            Icon(Icons.add),
                            Text(
                              "Thêm thẻ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                PaymentCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Thanh toán khi giao hàng"),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(color: AppColor.orange),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                PaymentCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: Image.asset(
                              Helper.getAssetName(
                                "visa2.png",
                                "real",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("**** **** **** 2187"),
                        ],
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(color: AppColor.orange),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                PaymentCard(
                  widget: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 40,
                            height: 30,
                            child: Image.asset(
                              Helper.getAssetName(
                                "paypal.png",
                                "real",
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text("tuan@email.com"),
                        ],
                      ),
                      Container(
                        width: 15,
                        height: 15,
                        decoration: ShapeDecoration(
                          shape: CircleBorder(
                            side: BorderSide(color: AppColor.orange),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 10,
                  width: double.infinity,
                  color: AppColor.placeholderBg,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tổng tiền món ăn"),
                          Text(
                            "\$68",
                            style: Helper.getTheme(context).headline3,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Phí giao hàng"),
                          Text(
                            "\$2",
                            style: Helper.getTheme(context).headline3,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Giảm giá"),
                          Text(
                            "-\$4",
                            style: Helper.getTheme(context).headline3,
                          )
                        ],
                      ),
                      Divider(
                        height: 40,
                        color: AppColor.placeholder.withOpacity(0.25),
                        thickness: 2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tất cả"),
                          Text(
                            "\$66",
                            style: Helper.getTheme(context).headline3,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 10,
                  width: double.infinity,
                  color: AppColor.placeholderBg,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            isScrollControlled: true,
                            isDismissible: false,
                            context: context,
                            builder: (context) {
                              return Container(
                                height: Helper.getScreenHeight(context) * 0.7,
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          icon: Icon(Icons.clear),
                                        ),
                                      ],
                                    ),
                                    Image.asset(
                                      Helper.getAssetName(
                                        "vector4.png",
                                        "virtual",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Thank You!",
                                      style: TextStyle(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 30,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "bạn đã đặt hàng",
                                      style: Helper.getTheme(context)
                                          .headline4
                                          .copyWith(color: AppColor.primary),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20.0),
                                      child: Text(
                                          "Đơn đặt hàng của bạn hiện đang được xử lý. Chúng tôi sẽ cho bạn biết sau khi đơn hàng được chọn từ cửa hàng. kiểm tra tình trạng đơn hàng của bạn"),
                                    ),
                                    SizedBox(
                                      height: 60,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: SizedBox(
                                        height: 50,
                                        width: double.infinity,
                                        child: ElevatedButton(
                                          onPressed: () {},
                                          child: Text("Theo dõi đơn hàng"),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                      ),
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushReplacementNamed(
                                                  HomeScreen.routeName);
                                        },
                                        child: Text(
                                          "Trở về trang chủ",
                                          style: TextStyle(
                                            color: AppColor.primary,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            });
                      },
                      child: Text("Thanh toán"),
                    ),
                  ),
                )
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: CustomNavBar(),
          ),
        ],
      ),
    );
  }
}

class PaymentCard extends StatelessWidget {
  const PaymentCard({
    Key key,
    Widget widget,
  })  : _widget = widget,
        super(key: key);

  final Widget _widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
          height: 50,
          width: double.infinity,
          padding: const EdgeInsets.only(
            left: 30,
            right: 20,
          ),
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: AppColor.placeholder.withOpacity(0.25),
              ),
            ),
            color: AppColor.placeholderBg,
          ),
          child: _widget),
    );
  }
}
