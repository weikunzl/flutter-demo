class UserInfo {
  UserInfo();

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    final UserInfo userInfo = UserInfo();
    userInfo.avatarPic = json['avatar_pic'];
    userInfo.id = json['id'];
    userInfo.username = json['name'];
    userInfo.themeColor = json['theme_color'];
    userInfo.urlName = json['url_name'];
    return userInfo;
  }

  String username;
  int id;
  String avatarPic;
  String themeColor;
  String urlName;
}
