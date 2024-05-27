import 'package:flutter/material.dart';

class IntroductionPage extends StatefulWidget {
  const IntroductionPage({super.key});

  @override
  State<IntroductionPage> createState() => _IntroductionPageState();
}

class _IntroductionPageState extends State<IntroductionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Giới Thiệu'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: RichText(
          textAlign: TextAlign.justify,
          text: const TextSpan(
            style: TextStyle(
              fontSize: 16.0,
            ),
            children: [
              TextSpan(
                text: 'Chào mừng bạn đến với ',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text:
                    'Chương trình phần mềm BVCTCH_care của Bệnh viện Chấn thương Chỉnh hình ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: '(gọi chung là "Phần mềm"). Vui lòng đọc kỹ các ',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: 'ĐIỀU KHOẢN DỊCH VỤ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text:
                    ' sau đây trước khi tiếp tục truy cập hoặc sử dụng các dịch vụ của Phần mềm, để bạn biết được các quyền lợi và nghĩa vụ hợp pháp của mình liên quan đến Bệnh viện Chấn thương Chỉnh hình và các bên thứ ba có liên kết (gọi chung là “chúng tôi” hoặc “của chúng tôi”).',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text:
                    '\n\n“Các Dịch Vụ” chúng tôi cung cấp hoặc phát hành bao gồm:',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text: '\n- Phần mềm này.',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text:
                    '\n- Các tính năng hoặc tiện ích được cung cấp trên Phần mềm.',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text:
                    '\n- Mọi thông tin, các Phần mềm được liên kết, các tính năng, dữ liệu, văn bản, hình ảnh, hình chụp, đồ họa, nhạc, âm thanh, video, thông báo, tag, nội dung, lập trình, phần mềm, các dịch vụ ứng dụng (bao gồm nhưng không giới hạn ở bất kỳ dịch vụ ứng dụng di động nào) hoặc các tài liệu khác được cung cấp thông qua Phần mềm hoặc các dịch vụ liên quan của nó (gọi chung là “Nội Dung”). Bất kỳ tính năng mới nào được thêm vào hoặc để tăng cường Các Dịch Vụ đều phải tuân thủ các Điều Khoản Dịch Vụ này.',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text:
                    '\n\nBẰNG VIỆC SỬ DỤNG CÁC DỊCH VỤ HOẶC TIẾP TỤC TRUY CẬP TRANG WEB, BẠN CHO BIẾT RẰNG BẠN CHẤP NHẬN, KHÔNG RÚT LẠI, CÁC ĐIỀU KHOẢN DỊCH VỤ NÀY. NẾU BẠN KHÔNG ĐỒNG Ý VỚI CÁC ĐIỀU KHOẢN NÀY, VUI LÒNG KHÔNG SỬ DỤNG CÁC DỊCH VỤ CỦA CHÚNG TÔI HAY TIẾP TỤC TRUY CẬP PHẦN MỀM.',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              TextSpan(
                text:
                    '\n\nChúng tôi có quyền chỉnh sửa các Điều Khoản Dịch Vụ này vào bất kỳ lúc nào mà không cần thông báo cho người dùng. Việc bạn tiếp tục sử dụng Các Dịch Vụ, Phần mềm, hoặc Tài Khoản Của Bạn sẽ được xem là sự chấp nhận, không rút lại đối với các điều khoản chỉnh sửa đó.',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text:
                    '\n\nChúng tôi có quyền thay đổi, điều chỉnh, đình chỉ hoặc ngưng bất kỳ phần nào của Phần mềm này hoặc Các Dịch Vụ vào bất kỳ lúc nào. Chúng tôi có thể ra mắt Các Dịch Vụ nhất định hoặc các tính năng của chúng trong một phiên bản beta, phiên bản này có thể không hoạt động chính xác hoặc theo cùng cách như phiên bản cuối cùng, và chúng tôi sẽ không chịu trách nhiệm pháp lý trong các trường hợp đó. Chúng tôi cũng có thể toàn quyền áp dụng giới hạn đối với các tính năng nhất định hoặc hạn chế quyền truy cập của bạn đối với một phần hoặc toàn bộ Phần mềm hoặc Các Dịch Vụ mà không cần thông báo hoặc phải chịu trách nhiệm pháp lý.',
                style: TextStyle(color: Colors.black),
              ),
              TextSpan(
                text:
                    '\n\nChúng tôi có quyền từ chối cho phép bạn truy cập Phần mềm hoặc Các Dịch Vụ vì bất kỳ lý do gì.',
                style: TextStyle(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
