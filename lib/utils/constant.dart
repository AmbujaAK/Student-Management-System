class Constant {
  String userId;
  String loggedInUserUrl;

  Constant(String userId){
    this.userId = userId;
    loggedInUserUrl = url + "getLoggedInUser.php?username=" + userId;
    print(loggedInUserUrl);
  }
  static String url = "https://demoprojectjuit.000webhostapp.com/flutter/";
  
  static String loginUrl = url + "login.php";
  static String registerUrl = url + "register.php";
  static String verifyUrl = url + "verifyUser.php";
  static String studentUrl =url + "getStudent.php";
  static String facultyUrl =url + "getFaculty.php";
}