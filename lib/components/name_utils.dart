
class NameUtils {
  /// Tách họ đệm từ tên đầy đủ
  static String getMiddleName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    if (nameParts.length > 1) {
      return nameParts.sublist(0, nameParts.length - 1).join(' ');
    } else {
      return '';
    }
  }

  /// Tách tên riêng từ tên đầy đủ
  static String getLastName(String fullName) {
    List<String> nameParts = fullName.split(' ');
    return nameParts.isNotEmpty ? nameParts.last : '';
  }
}