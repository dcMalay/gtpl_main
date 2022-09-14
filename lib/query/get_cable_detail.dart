import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:gtpl/query/global_handler.dart';

Future<GetUserDetailsModel?> getUserDetails(
  BuildContext context,
) async {
  // try {
  var response =
      await GlobalHandler.requestPost("/secure/cable/user/details", {});
  var js = json.decode(response.body);

  GetUserDetailsModel res = GetUserDetailsModel.fromJson(js);
  return res;
  // } catch (e) {
  //   GlobalHandler.snackBar(
  //       context: context, message: e.toString(), isError: true);
  //   return null;
  // }
}

class GetUserDetailsModel {
  int? status;
  CableResult? cableResult;

  GetUserDetailsModel({this.status, this.cableResult});

  GetUserDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    cableResult = json['cable_result'] != null
        ? CableResult.fromJson(json['cable_result'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (cableResult != null) {
      data['cable_result'] = cableResult!.toJson();
    }
    return data;
  }
}

class CableResult {
  String? cUSTOMERNO;
  String? cUSTOMERTYPE;
  String? cUSTOMERTYPEDESC;
  String? cATEGORY;
  String? cATEGORYDESC;
  String? iNDIVIDUAL;
  String? tITLE;
  String? fIRSTNAME;
  String? mIDDLENAME;
  String? lASTNAME;
  String? oPENTITY;
  String? oPENTITYNAME;
  String? cURRENCYCODE;
  String? cURRENCYDESC;
  String? cOMPANYNAME;
  String? bILLINGMEDIA;
  String? pARENT;
  String? gROUPID;
  String? nATIONALITY;
  String? uINTYPE;
  String? uIN;
  String? nOTES;
  CONTACTINFO? cONTACTINFO;
  List<ADDRESSINFO>? aDDRESSINFO;
  FLEXATTRIBUTEINFO? fLEXATTRIBUTEINFO;
  List<CONTRACTINFO>? cONTRACTINFO;
  String? pROFILES;
  String? eQUIPMENTS;

  CableResult(
      {this.cUSTOMERNO,
      this.cUSTOMERTYPE,
      this.cUSTOMERTYPEDESC,
      this.cATEGORY,
      this.cATEGORYDESC,
      this.iNDIVIDUAL,
      this.tITLE,
      this.fIRSTNAME,
      this.mIDDLENAME,
      this.lASTNAME,
      this.oPENTITY,
      this.oPENTITYNAME,
      this.cURRENCYCODE,
      this.cURRENCYDESC,
      this.cOMPANYNAME,
      this.bILLINGMEDIA,
      this.pARENT,
      this.gROUPID,
      this.nATIONALITY,
      this.uINTYPE,
      this.uIN,
      this.nOTES,
      this.cONTACTINFO,
      this.aDDRESSINFO,
      this.fLEXATTRIBUTEINFO,
      this.cONTRACTINFO,
      this.pROFILES,
      this.eQUIPMENTS});

  CableResult.fromJson(Map<String, dynamic> json) {
    cUSTOMERNO = json['CUSTOMERNO'];
    cUSTOMERTYPE = json['CUSTOMERTYPE'];
    cUSTOMERTYPEDESC = json['CUSTOMERTYPEDESC'];
    cATEGORY = json['CATEGORY'];
    cATEGORYDESC = json['CATEGORYDESC'];
    iNDIVIDUAL = json['INDIVIDUAL'];
    tITLE = json['TITLE'];
    fIRSTNAME = json['FIRSTNAME'];
    mIDDLENAME = json['MIDDLENAME'];
    lASTNAME = json['LASTNAME'];
    oPENTITY = json['OPENTITY'];
    oPENTITYNAME = json['OPENTITYNAME'];
    cURRENCYCODE = json['CURRENCYCODE'];
    cURRENCYDESC = json['CURRENCYDESC'];
    cOMPANYNAME = json['COMPANYNAME'];
    bILLINGMEDIA = json['BILLINGMEDIA'];
    pARENT = json['PARENT'];
    gROUPID = json['GROUPID'];
    nATIONALITY = json['NATIONALITY'];
    uINTYPE = json['UINTYPE'];
    uIN = json['UIN'];
    nOTES = json['NOTES'];
    cONTACTINFO = json['CONTACTINFO'] != null
        ? CONTACTINFO.fromJson(json['CONTACTINFO'])
        : null;
    if (json['ADDRESSINFO'] != null) {
      aDDRESSINFO = <ADDRESSINFO>[];
      json['ADDRESSINFO'].forEach((v) {
        aDDRESSINFO!.add(ADDRESSINFO.fromJson(v));
      });
    }
    fLEXATTRIBUTEINFO = json['FLEX-ATTRIBUTE-INFO'] != null
        ? FLEXATTRIBUTEINFO.fromJson(json['FLEX-ATTRIBUTE-INFO'])
        : null;
    if (json['CONTRACTINFO'] != null) {
      cONTRACTINFO = <CONTRACTINFO>[];
      json['CONTRACTINFO'].forEach((v) {
        cONTRACTINFO!.add(CONTRACTINFO.fromJson(v));
      });
    }
    pROFILES = json['PROFILES'];
    eQUIPMENTS = json['EQUIPMENTS'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CUSTOMERNO'] = cUSTOMERNO;
    data['CUSTOMERTYPE'] = cUSTOMERTYPE;
    data['CUSTOMERTYPEDESC'] = cUSTOMERTYPEDESC;
    data['CATEGORY'] = cATEGORY;
    data['CATEGORYDESC'] = cATEGORYDESC;
    data['INDIVIDUAL'] = iNDIVIDUAL;
    data['TITLE'] = tITLE;
    data['FIRSTNAME'] = fIRSTNAME;
    data['MIDDLENAME'] = mIDDLENAME;
    data['LASTNAME'] = lASTNAME;
    data['OPENTITY'] = oPENTITY;
    data['OPENTITYNAME'] = oPENTITYNAME;
    data['CURRENCYCODE'] = cURRENCYCODE;
    data['CURRENCYDESC'] = cURRENCYDESC;
    data['COMPANYNAME'] = cOMPANYNAME;
    data['BILLINGMEDIA'] = bILLINGMEDIA;
    data['PARENT'] = pARENT;
    data['GROUPID'] = gROUPID;
    data['NATIONALITY'] = nATIONALITY;
    data['UINTYPE'] = uINTYPE;
    data['UIN'] = uIN;
    data['NOTES'] = nOTES;
    if (cONTACTINFO != null) {
      data['CONTACTINFO'] = cONTACTINFO!.toJson();
    }
    if (aDDRESSINFO != null) {
      data['ADDRESSINFO'] = aDDRESSINFO!.map((v) => v.toJson()).toList();
    }
    if (fLEXATTRIBUTEINFO != null) {
      data['FLEX-ATTRIBUTE-INFO'] = fLEXATTRIBUTEINFO!.toJson();
    }
    if (cONTRACTINFO != null) {
      data['CONTRACTINFO'] = cONTRACTINFO!.map((v) => v.toJson()).toList();
    }
    data['PROFILES'] = pROFILES;
    data['EQUIPMENTS'] = eQUIPMENTS;
    return data;
  }
}

class CONTACTINFO {
  String? cONTACTNAME;
  String? eMAIL;
  String? aLTEMAIL;
  String? hOMEPHONE;
  String? wORKPHONE;
  String? mOBILEPHONE;
  String? fAXNBR;

  CONTACTINFO(
      {this.cONTACTNAME,
      this.eMAIL,
      this.aLTEMAIL,
      this.hOMEPHONE,
      this.wORKPHONE,
      this.mOBILEPHONE,
      this.fAXNBR});

  CONTACTINFO.fromJson(Map<String, dynamic> json) {
    cONTACTNAME = json['CONTACTNAME'];
    eMAIL = json['EMAIL'];
    aLTEMAIL = json['ALTEMAIL'];
    hOMEPHONE = json['HOMEPHONE'];
    wORKPHONE = json['WORKPHONE'];
    mOBILEPHONE = json['MOBILEPHONE'];
    fAXNBR = json['FAXNBR'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CONTACTNAME'] = cONTACTNAME;
    data['EMAIL'] = eMAIL;
    data['ALTEMAIL'] = aLTEMAIL;
    data['HOMEPHONE'] = hOMEPHONE;
    data['WORKPHONE'] = wORKPHONE;
    data['MOBILEPHONE'] = mOBILEPHONE;
    data['FAXNBR'] = fAXNBR;
    return data;
  }
}

class ADDRESSINFO {
  String? aDDRESSTYPECODE;
  String? aDDRESS1;
  String? aDDRESS2;
  String? sTREET;
  String? aREA;
  String? cITY;
  String? dISTRICT;
  String? sTATE;
  String? zIPCODE;
  String? cOUNTRY;

  ADDRESSINFO(
      {this.aDDRESSTYPECODE,
      this.aDDRESS1,
      this.aDDRESS2,
      this.sTREET,
      this.aREA,
      this.cITY,
      this.dISTRICT,
      this.sTATE,
      this.zIPCODE,
      this.cOUNTRY});

  ADDRESSINFO.fromJson(Map<String, dynamic> json) {
    aDDRESSTYPECODE = json['ADDRESSTYPECODE'];
    aDDRESS1 = json['ADDRESS1'];
    aDDRESS2 = json['ADDRESS2'];
    sTREET = json['STREET'];
    aREA = json['AREA'];
    cITY = json['CITY'];
    dISTRICT = json['DISTRICT'];
    sTATE = json['STATE'];
    zIPCODE = json['ZIPCODE'];
    cOUNTRY = json['COUNTRY'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ADDRESSTYPECODE'] = aDDRESSTYPECODE;
    data['ADDRESS1'] = aDDRESS1;
    data['ADDRESS2'] = aDDRESS2;
    data['STREET'] = sTREET;
    data['AREA'] = aREA;
    data['CITY'] = cITY;
    data['DISTRICT'] = dISTRICT;
    data['STATE'] = sTATE;
    data['ZIPCODE'] = zIPCODE;
    data['COUNTRY'] = cOUNTRY;
    return data;
  }
}

class FLEXATTRIBUTEINFO {
  String? aTTRIBUTE1;
  String? aTTRIBUTE2;
  String? aTTRIBUTE3;
  String? aTTRIBUTE4;
  String? aTTRIBUTE5;
  String? aTTRIBUTE6;
  String? aTTRIBUTE7;
  String? aTTRIBUTE8;
  String? aTTRIBUTE9;
  String? aTTRIBUTE10;
  String? aTTRIBUTE11;
  String? aTTRIBUTE12;
  String? aTTRIBUTE13;
  String? aTTRIBUTE14;
  String? aTTRIBUTE15;
  String? aTTRIBUTE16;
  String? aTTRIBUTE17;
  String? aTTRIBUTE18;
  String? aTTRIBUTE19;
  String? aTTRIBUTE20;
  String? aTTRIBUTE21;
  String? aTTRIBUTE22;
  String? aTTRIBUTE23;
  String? aTTRIBUTE24;
  String? aTTRIBUTE25;

  FLEXATTRIBUTEINFO(
      {this.aTTRIBUTE1,
      this.aTTRIBUTE2,
      this.aTTRIBUTE3,
      this.aTTRIBUTE4,
      this.aTTRIBUTE5,
      this.aTTRIBUTE6,
      this.aTTRIBUTE7,
      this.aTTRIBUTE8,
      this.aTTRIBUTE9,
      this.aTTRIBUTE10,
      this.aTTRIBUTE11,
      this.aTTRIBUTE12,
      this.aTTRIBUTE13,
      this.aTTRIBUTE14,
      this.aTTRIBUTE15,
      this.aTTRIBUTE16,
      this.aTTRIBUTE17,
      this.aTTRIBUTE18,
      this.aTTRIBUTE19,
      this.aTTRIBUTE20,
      this.aTTRIBUTE21,
      this.aTTRIBUTE22,
      this.aTTRIBUTE23,
      this.aTTRIBUTE24,
      this.aTTRIBUTE25});

  FLEXATTRIBUTEINFO.fromJson(Map<String, dynamic> json) {
    aTTRIBUTE1 = json['ATTRIBUTE1'];
    aTTRIBUTE2 = json['ATTRIBUTE2'];
    aTTRIBUTE3 = json['ATTRIBUTE3'];
    aTTRIBUTE4 = json['ATTRIBUTE4'];
    aTTRIBUTE5 = json['ATTRIBUTE5'];
    aTTRIBUTE6 = json['ATTRIBUTE6'];
    aTTRIBUTE7 = json['ATTRIBUTE7'];
    aTTRIBUTE8 = json['ATTRIBUTE8'];
    aTTRIBUTE9 = json['ATTRIBUTE9'];
    aTTRIBUTE10 = json['ATTRIBUTE10'];
    aTTRIBUTE11 = json['ATTRIBUTE11'];
    aTTRIBUTE12 = json['ATTRIBUTE12'];
    aTTRIBUTE13 = json['ATTRIBUTE13'];
    aTTRIBUTE14 = json['ATTRIBUTE14'];
    aTTRIBUTE15 = json['ATTRIBUTE15'];
    aTTRIBUTE16 = json['ATTRIBUTE16'];
    aTTRIBUTE17 = json['ATTRIBUTE17'];
    aTTRIBUTE18 = json['ATTRIBUTE18'];
    aTTRIBUTE19 = json['ATTRIBUTE19'];
    aTTRIBUTE20 = json['ATTRIBUTE20'];
    aTTRIBUTE21 = json['ATTRIBUTE21'];
    aTTRIBUTE22 = json['ATTRIBUTE22'];
    aTTRIBUTE23 = json['ATTRIBUTE23'];
    aTTRIBUTE24 = json['ATTRIBUTE24'];
    aTTRIBUTE25 = json['ATTRIBUTE25'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['ATTRIBUTE1'] = aTTRIBUTE1;
    data['ATTRIBUTE2'] = aTTRIBUTE2;
    data['ATTRIBUTE3'] = aTTRIBUTE3;
    data['ATTRIBUTE4'] = aTTRIBUTE4;
    data['ATTRIBUTE5'] = aTTRIBUTE5;
    data['ATTRIBUTE6'] = aTTRIBUTE6;
    data['ATTRIBUTE7'] = aTTRIBUTE7;
    data['ATTRIBUTE8'] = aTTRIBUTE8;
    data['ATTRIBUTE9'] = aTTRIBUTE9;
    data['ATTRIBUTE10'] = aTTRIBUTE10;
    data['ATTRIBUTE11'] = aTTRIBUTE11;
    data['ATTRIBUTE12'] = aTTRIBUTE12;
    data['ATTRIBUTE13'] = aTTRIBUTE13;
    data['ATTRIBUTE14'] = aTTRIBUTE14;
    data['ATTRIBUTE15'] = aTTRIBUTE15;
    data['ATTRIBUTE16'] = aTTRIBUTE16;
    data['ATTRIBUTE17'] = aTTRIBUTE17;
    data['ATTRIBUTE18'] = aTTRIBUTE18;
    data['ATTRIBUTE19'] = aTTRIBUTE19;
    data['ATTRIBUTE20'] = aTTRIBUTE20;
    data['ATTRIBUTE21'] = aTTRIBUTE21;
    data['ATTRIBUTE22'] = aTTRIBUTE22;
    data['ATTRIBUTE23'] = aTTRIBUTE23;
    data['ATTRIBUTE24'] = aTTRIBUTE24;
    data['ATTRIBUTE25'] = aTTRIBUTE25;
    return data;
  }
}

class CONTRACTINFO {
  String? cONTRACTNO;
  String? sTARTDATE;
  String? eNDDATE;
  String? cONTRACTSTATUS;
  String? iSBULK;
  String? bILLFREQUENCY;
  String? sALESMANDESC;
  String? nOOFROOMS;
  String? oUTLETS;
  String? nOTES;
  PLANINFO? pLANINFO;

  CONTRACTINFO(
      {this.cONTRACTNO,
      this.sTARTDATE,
      this.eNDDATE,
      this.cONTRACTSTATUS,
      this.iSBULK,
      this.bILLFREQUENCY,
      this.sALESMANDESC,
      this.nOOFROOMS,
      this.oUTLETS,
      this.nOTES,
      this.pLANINFO});

  CONTRACTINFO.fromJson(Map<String, dynamic> json) {
    cONTRACTNO = json['CONTRACTNO'];
    sTARTDATE = json['STARTDATE'];
    eNDDATE = json['ENDDATE'];
    cONTRACTSTATUS = json['CONTRACTSTATUS'];
    iSBULK = json['ISBULK'];
    bILLFREQUENCY = json['BILLFREQUENCY'];
    sALESMANDESC = json['SALESMANDESC'];
    nOOFROOMS = json['NOOFROOMS'];
    oUTLETS = json['OUTLETS'];
    nOTES = json['NOTES'];
    pLANINFO =
        json['PLANINFO'] != null ? PLANINFO.fromJson(json['PLANINFO']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['CONTRACTNO'] = cONTRACTNO;
    data['STARTDATE'] = sTARTDATE;
    data['ENDDATE'] = eNDDATE;
    data['CONTRACTSTATUS'] = cONTRACTSTATUS;
    data['ISBULK'] = iSBULK;
    data['BILLFREQUENCY'] = bILLFREQUENCY;
    data['SALESMANDESC'] = sALESMANDESC;
    data['NOOFROOMS'] = nOOFROOMS;
    data['OUTLETS'] = oUTLETS;
    data['NOTES'] = nOTES;
    if (pLANINFO != null) {
      data['PLANINFO'] = pLANINFO!.toJson();
    }
    return data;
  }
}

class PLANINFO {
  String? pLANCODE;
  String? pLANDESC;
  SERVICEINFO? sERVICEINFO;
  PACKAGEGROUPINFO? pACKAGEGROUPINFO;
  SERVICEGROUPINFO? sERVICEGROUPINFO;

  PLANINFO(
      {this.pLANCODE,
      this.pLANDESC,
      this.sERVICEINFO,
      this.pACKAGEGROUPINFO,
      this.sERVICEGROUPINFO});

  PLANINFO.fromJson(Map<String, dynamic> json) {
    pLANCODE = json['PLANCODE'];
    pLANDESC = json['PLANDESC'];
    print(json['SERVICEINFO']);
    // sERVICEINFO = json['SERVICEINFO'] != null
    //     ? SERVICEINFO.fromJson(json['SERVICEINFO'])
    //     : null;
    pACKAGEGROUPINFO = json['PACKAGEGROUPINFO'] != null
        ? PACKAGEGROUPINFO.fromJson(json['PACKAGEGROUPINFO'])
        : null;
    sERVICEGROUPINFO = json['SERVICEGROUPINFO'] != null
        ? SERVICEGROUPINFO.fromJson(json['SERVICEGROUPINFO'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PLANCODE'] = pLANCODE;
    data['PLANDESC'] = pLANDESC;
    if (sERVICEINFO != null) {
      data['SERVICEINFO'] = sERVICEINFO!.toJson();
    }
    if (pACKAGEGROUPINFO != null) {
      data['PACKAGEGROUPINFO'] = pACKAGEGROUPINFO!.toJson();
    }
    if (sERVICEGROUPINFO != null) {
      data['SERVICEGROUPINFO'] = sERVICEGROUPINFO!.toJson();
    }
    return data;
  }
}

class SERVICEINFO {
  String? sERVICEDESC;

  SERVICEINFO({this.sERVICEDESC});

  SERVICEINFO.fromJson(Map<String, dynamic> json) {
    sERVICEDESC = json['SERVICEDESC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SERVICEDESC'] = sERVICEDESC;
    return data;
  }
}

class PACKAGEGROUPINFO {
  String? pACKAGEGROUPDESC;
  List<PACKAGEINFO>? pACKAGEINFO;

  PACKAGEGROUPINFO({this.pACKAGEGROUPDESC, this.pACKAGEINFO});

  PACKAGEGROUPINFO.fromJson(Map<String, dynamic> json) {
    pACKAGEGROUPDESC = json['PACKAGEGROUPDESC'];
    if (json['PACKAGEINFO'] != null) {
      pACKAGEINFO = <PACKAGEINFO>[];
      json['PACKAGEINFO'].forEach((v) {
        pACKAGEINFO!.add(PACKAGEINFO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PACKAGEGROUPDESC'] = pACKAGEGROUPDESC;
    if (pACKAGEINFO != null) {
      data['PACKAGEINFO'] = pACKAGEINFO!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PACKAGEINFO {
  String? pACKAGEDESC;
  SERVICEINFO? sERVICEINFO;

  PACKAGEINFO({this.pACKAGEDESC, this.sERVICEINFO});

  PACKAGEINFO.fromJson(Map<String, dynamic> json) {
    pACKAGEDESC = json['PACKAGEDESC'];
    sERVICEINFO = json['SERVICEINFO'] != null
        ? SERVICEINFO.fromJson(json['SERVICEINFO'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['PACKAGEDESC'] = pACKAGEDESC;
    if (sERVICEINFO != null) {
      data['SERVICEINFO'] = sERVICEINFO!.toJson();
    }
    return data;
  }
}

class SERVICEGROUPINFO {
  String? sERVICEGROUPDESC;
  List<SERVICEINFO>? sERVICEINFO;

  SERVICEGROUPINFO({this.sERVICEGROUPDESC, this.sERVICEINFO});

  SERVICEGROUPINFO.fromJson(Map<String, dynamic> json) {
    sERVICEGROUPDESC = json['SERVICEGROUPDESC'];
    if (json['SERVICEINFO'] != null) {
      sERVICEINFO = <SERVICEINFO>[];
      json['SERVICEINFO'].forEach((v) {
        sERVICEINFO!.add(SERVICEINFO.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['SERVICEGROUPDESC'] = sERVICEGROUPDESC;
    if (sERVICEINFO != null) {
      data['SERVICEINFO'] = sERVICEINFO!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
