import 'package:get/get.dart';
import 'package:myapp/utils/strings.dart';
import 'package:myapp/localizations/english.dart';
import 'package:myapp/localizations/hindi.dart';

class Languages extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
    'hi_IN': {
      Strings.appName : Hindi.appName,
      Strings.homescreen : Hindi.homescreen,
      Strings.confirmbtn : Hindi.confirmbtn,
      Strings.cancelbtn : Hindi.cancelbtn,
      Strings.backpress : Hindi.backpress,
      Strings.changepin : Hindi.changepin,
      Strings.rateus : Hindi.rateus,
      Strings.logout : Hindi.logout,
      Strings.logoutcfrm : Hindi.logoutcfrm,
      Strings.yesbtn : Hindi.yesbtn,
      Strings.nobtn : Hindi.nobtn,
      Strings.chooselanguage : Hindi.chooselanguage,

      //----- Login Screen ------
      Strings.userid : Hindi.userid,
      Strings.pin : Hindi.pin,
      Strings.login : Hindi.login,
      Strings.svcred : Hindi.svcred,
      Strings.emailvalidation : Hindi.emailvalidation,
      Strings.pinvalidation : Hindi.pinvalidation,
      Strings.enablelogin : Hindi.enablelogin,
      Strings.resetpin : Hindi.resetpin,

      //--------------OTP Screen---------
      Strings.otpveri : Hindi.otpveri,
      Strings.veriftitle : Hindi.veriftitle,
      Strings.validotp : Hindi.validotp,
      Strings.verifybtn : Hindi.verifybtn,
      Strings.didntrcv : Hindi.didntrcv,
      Strings.resend : Hindi.resend,

      //----- Home Screen ------
      Strings.nonstkdmd : Hindi.nonstkdmd,
      Strings.reports : Hindi.reports,
      Strings.monitoring : Hindi.monitoring,
      Strings.mappingdept : Hindi.mappingdept,
      Strings.crismmis : Hindi.crismmis,
      Strings.deptmapping : Hindi.deptmapping,
      Strings.lightmode : Hindi.lightmode,
      Strings.nightmode : Hindi.nightmode,

      //---- No Internet Screen ----
      Strings.errortitle : Hindi.errortitle,
      Strings.errordesc : Hindi.errordesc,
      Strings.tryagainbtn : Hindi.tryagainbtn,
    },
    'en_US': {
      Strings.appName : English.appName,
      Strings.homescreen : English.homescreen,
      Strings.confirmbtn : English.confirmbtn,
      Strings.cancelbtn : English.cancelbtn,
      Strings.backpress : English.backpress,
      Strings.changepin : English.changepin,
      Strings.rateus : English.rateus,
      Strings.logoutcfrm : English.logoutcfrm,
      Strings.logout : English.logout,
      Strings.yesbtn : English.yesbtn,
      Strings.nobtn : English.nobtn,
      Strings.chooselanguage : English.chooselanguage,

      //----- Login Screen ------
      Strings.userid : English.userid,
      Strings.pin : English.pin,
      Strings.login : English.login,
      Strings.svcred : English.svcred,
      Strings.emailvalidation : English.emailvalidation,
      Strings.pinvalidation : English.pinvalidation,
      Strings.enablelogin : English.enablelogin,
      Strings.resetpin : English.resetpin,

      //--------------OTP Screen---------
      Strings.otpveri : English.otpveri,
      Strings.veriftitle : English.veriftitle,
      Strings.validotp : English.validotp,
      Strings.verifybtn : English.verifybtn,
      Strings.didntrcv : English.didntrcv,
      Strings.resend : English.resend,

      //----- Home Screen ------
      Strings.nonstkdmd : English.nonstkdmd,
      Strings.reports : English.reports,
      Strings.monitoring : English.monitoring,
      Strings.mappingdept : English.mappingdept,
      Strings.crismmis : English.crismmis,
      Strings.deptmapping : English.deptmapping,
      Strings.lightmode : English.lightmode,
      Strings.nightmode : English.nightmode,

      //---- No Internet Screen ----
      Strings.errortitle : English.errortitle,
      Strings.errordesc : English.errordesc,
      Strings.tryagainbtn : English.tryagainbtn,
    },
  };
}