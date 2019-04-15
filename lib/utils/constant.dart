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
  static String getSubjects = serverUrl + "getSubject.php";
  static String updateAttendance = serverUrl + "updateAttendance.php";
  static String getYear = serverUrl + "getYear.php";
  static String getSemester = serverUrl + "getSemester.php";
  static String getAttendanceSheet = serverUrl + "getAttendanceSheet.php";
  static String getAttendanceSheetId = serverUrl + "getAttendanceSheetId.php";
  static String getStudentForAttendanceUrl = serverUrl + "getStudentForAttendance.php";
  static String takeAttendanceOnAvailableUrl = serverUrl + "takeAttendanceOnAvailable.php";
  static String createAttendanceUrl = serverUrl + "createAttendance.php";
  
}
