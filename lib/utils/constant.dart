class Constant {
  String userId;
  String loggedInUserUrl;

  Constant(String userId){
    this.userId = userId;
    loggedInUserUrl = serverUrl + "getLoggedInUser.php?username=" + userId;
    print(loggedInUserUrl);
  }
  static String serverUrl = "https://demoprojectjuit.000webhostapp.com/flutter/";
  //static String serverUrl = "https://192.168.0.101/jusms/flutter/";
  
  static String loginUrl = serverUrl + "login.php";
  static String registerUrl = serverUrl + "register.php";
  static String verifyUrl = serverUrl + "verifyUser.php";
  static String studentUrl =serverUrl + "getStudent.php";
  static String facultyUrl =serverUrl + "getFaculty.php";
  static String departmentUrl = serverUrl + "getDepartment.php";
  static String updateStudentUrl = serverUrl + "updateStudent.php";
  static String changePasswordUrl = serverUrl + "changePassword.php";
  
}

/*
UPDATE `students` SET `username`="demo",`fname`="demo",`mname`="demo",`lname`="demo",`email`="demo",`mobile`=1234567890,`password`="demo",`dob`="2018-12-1",`join_date`="2019" WHERE `student_id` = "001511001012"
*/