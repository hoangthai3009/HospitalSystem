class SplitNameUtils {
  static String splitFirstName(String fullName) {
    List<String> nameParts = fullName.trim().split(' ');
    if (nameParts.length > 1) {
      return nameParts.sublist(0, nameParts.length - 1).join(' ');
    } else {
      return fullName;
    }
  }

  static String splitLastName(String fullName) {
    List<String> nameParts = fullName.trim().split(' ');
    if (nameParts.length > 1) {
      return nameParts.last;
    } else {
      return '';
    }
  }
}
