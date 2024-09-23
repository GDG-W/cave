extension UserInitials on String {

  String get getUserInitials => getInitials(this);

  String getInitials(String fullName) {
    String initials = '';
    fullName.split(' ').forEach((item) => initials = initials + item[0]);
    return initials;
  }
}
