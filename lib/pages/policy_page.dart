import 'package:flutter/material.dart';

class PolicyPage extends StatefulWidget {
  const PolicyPage({super.key});

  @override
  State<PolicyPage> createState() => _PolicyPageState();
}

class _PolicyPageState extends State<PolicyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Điều Khoản & Chính Sách'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: const [
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 16.0,
              color: Colors.black,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'BẢO MẬT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Chúng tôi rất coi trọng việc bảo mật thông tin của bạn. Để bảo vệ các quyền của bạn một cách hiệu quả hơn, chúng tôi đã cung cấp Chính Sách Bảo Mật trên Phần mềm để giải thích chi tiết về các cách thức bảo mật thông tin của chúng tôi. Vui lòng xem Chính Sách Bảo Mật để hiểu được cách thức chúng tôi thu thập và sử dụng thông tin liên kết với Tài Khoản của bạn và/hoặc việc bạn sử dụng Các Dịch Vụ. Bằng việc sử dụng Các Dịch Vụ hoặc đồng ý với các Điều Khoản Dịch Vụ này, bạn đồng ý cho phép chúng tôi thu thập, sử dụng, tiết lộ và/hoặc xử lý Nội Dung và dữ liệu cá nhân của bạn như mô tả trong Chính Sách Bảo Mật của chúng tôi.',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16.0),
                Text(
                  'GIỚI HẠN VỀ QUYỀN SỬ DỤNG',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Chúng tôi cấp cho bạn quyền sử dụng có giới hạn để truy cập và sử dụng Các Dịch Vụ tuân theo các điều khoản và điều kiện của Điều Khoản Dịch Vụ này vì mục đích sử dụng cá nhân. Việc cấp quyền này không cho phép bạn sử dụng vì bất kỳ mục đích thương mại nào hay sử dụng vì mục đích phái sinh đối với Các Dịch Vụ này (bao gồm nhưng không giới hạn ở bất kỳ yếu tố riêng lẻ nào hay Nội Dung của nó).',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16.0),
                Text(
                  'TÀI KHOẢN VÀ BẢO MẬT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Một số chức năng trong Các Dịch Vụ của chúng tôi yêu cầu phải đăng nhập bằng cách chọn số điện thoại định danh người dùng duy nhất (“ID Người Dùng”) và nhập code xác nhận, và bằng cách cung cấp một số thông tin cá nhân nhất định. Bạn có thể sử dụng Tài Khoản của mình để tiếp cận/truy cập các chức năng, Phần mềm hoặc Dịch vụ mà chúng tôi đã cho phép truy cập hoặc chúng tôi đã có liên kết hay hợp tác.',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16.0),
                Text(
                  'LOẠI TRỪ TRÁCH NHIỆM',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Chúng tôi không đảm bảo rằng các dịch vụ, phần mềm này hoặc các chức năng trong phần mềm sẽ luôn khả dụng, có thể truy cập, không bị gián đoạn, an toàn hoặc không bị lỗi. Bạn đồng ý và hiểu rằng tình trạng và chất lượng của Dịch vụ có thể bị ảnh hưởng bởi nhiều yếu tố bên ngoài tác động đến tình trạng mạng và/hoặc thiết bị của bạn.',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16.0),
                Text(
                  'CÁC TRƯỜNG HỢP LOẠI TRỪ VÀ GIỚI HẠN TRÁCH NHIỆM PHÁP LÝ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Trong mọi trường hợp, chúng tôi sẽ không chịu trách nhiệm pháp lý cho bất kỳ thiệt hại gián tiếp, phát sinh hoặc không phát sinh, bao gồm nhưng không giới hạn ở mất lợi nhuận, mất dữ liệu hoặc sự mất mát hoặc thiệt hại khác liên quan đến việc sử dụng hoặc không thể sử dụng Dịch vụ, kể cả nếu chúng tôi đã được thông báo về khả năng thiệt hại đó và dù cho việc giải quyết đó là dựa trên hợp đồng, vô hình hoá, bất công, luật bảo vệ người tiêu dùng, hoặc bất kỳ cơ sở pháp lý nào khác.',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16.0),
                Text(
                  'ĐẢM BẢO VÀ CAM ĐOAN CỦA BẠN',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Bạn đảm bảo và cam đoan rằng: (a) bạn sử dụng Dịch vụ của chúng tôi cho các mục đích cá nhân và không phải mục đích thương mại; (b) bạn đã 18 tuổi hoặc đã đạt độ tuổi mà quyền hạn pháp lý của bạn cho phép bạn sử dụng Dịch vụ của chúng tôi; (c) thông tin bạn cung cấp cho chúng tôi chính xác và đầy đủ; và (d) bạn sẽ tuân theo Điều Khoản Dịch Vụ này và sẽ tuân theo tất cả các luật và quy định áp dụng với việc sử dụng Dịch vụ của chúng tôi.',
                  textAlign: TextAlign.justify,
                ),
                SizedBox(height: 16.0),
                Text(
                  'CÁC QUY ĐỊNH CHUNG',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                SizedBox(height: 8.0),
                Text(
                  'Chúng tôi bảo lưu tất cả các quyền không được cấp rõ trong Điều Khoản Dịch Vụ này. Bạn không được giao dịch, chuyển nhượng, bán hoặc cấp phép bất kỳ quyền hoặc lợi ích nào thu được dưới Điều Khoản Dịch Vụ này mà không có sự đồng ý trước bằng văn bản của chúng tôi, và mọi cố gắng như vậy sẽ không hiệu lực. Nếu bất kỳ điều khoản nào của Điều Khoản Dịch Vụ này bị coi là không hợp pháp, vô hiệu hoặc không thể thực thi, điều khoản đó sẽ được cắt bỏ và không ảnh hưởng đến hiệu lực và tính thực thi của các điều khoản còn lại.',
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
