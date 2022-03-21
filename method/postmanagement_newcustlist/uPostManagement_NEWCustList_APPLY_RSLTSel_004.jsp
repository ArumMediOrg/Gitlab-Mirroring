<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtList = null;

	ResultSet rsList = null;

	CRs cRsList = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SEXAM_LIST = htMethod.get("SEXAM_LIST");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(SEXAM_LIST == null) { SEXAM_LIST = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

<delphi>
  var strExam_List : string;
  strExam_List := :sExam_List;
</delphi>

while strExam_List <> '' do begin
<delphi>
//function description
//sExamList sample '316012719600|999990000114|311960230900|999990000115'
//Copy > 파라메터 : string, startIdx, endIdx - string의 startIdx ~ EndIdx까지 string타입으로 반환한다.
//Pos  > 파라메터 : posString, string        - string에서 PosString의 위치를 int타입으로 반환한다.
  select f_pack_find(Copy(strExam_List,1,Pos('|',strExam_List)-1), eea_comp_cd) List,
         EEA_EXAM_CD , Copy(strExam_List,1,3) GUBUN
</delphi>
  from et_exam_acpt
  Where EEA_EXAM_DT = :EXAM_DT
     And EEA_EXAM_SQ = :EXAM_SQ
     and (instr(eea_exam_lt, 'P00') > 0 or instr(eea_exam_lt, 'P56') > 0
      or  instr(eea_exam_lt, 'P58') > 0)
<delphi>
  strExam_List := Copy(strExam_List,Pos('|',strExam_List)||1,Length(strExam_List));  
</delphi>  
  if strExam_List <> '' then
    Union
end;

  Order By GUBUN
  
  
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>  변환결과
// select f_pack_find('316012719600', eea_comp_cd) List,
//        EEA_EXAM_CD , '316' GUBUN
// from et_exam_acpt                                                                 
// Where EEA_EXAM_DT = :EXAM_DT                                                     
//       And EEA_EXAM_SQ = :EXAM_SQ                                                    
//       and (instr(eea_exam_lt, 'P00') > 0 or instr(eea_exam_lt, 'P56') > 0       
//        or  instr(eea_exam_lt, 'P58') > 0)                                         
// Union
// select f_pack_find('999990000114', eea_comp_cd) List,
//        EEA_EXAM_CD , '999' GUBUN
// from et_exam_acpt                                                                 
// Where EEA_EXAM_DT = :EXAM_DT                                                     
//       And EEA_EXAM_SQ = :EXAM_SQ                                                    
//       and (instr(eea_exam_lt, 'P00') > 0 or instr(eea_exam_lt, 'P56') > 0       
//        or  instr(eea_exam_lt, 'P58') > 0)                                         
// Union
// select f_pack_find('311960230900', eea_comp_cd) List,
//        EEA_EXAM_CD , '311' GUBUN
// from et_exam_acpt                                                                 
// Where EEA_EXAM_DT = :EXAM_DT                                                     
//       And EEA_EXAM_SQ = :EXAM_SQ                                                    
//       and (instr(eea_exam_lt, 'P00') > 0 or instr(eea_exam_lt, 'P56') > 0       
//        or  instr(eea_exam_lt, 'P58') > 0)                                         
// Union
// select f_pack_find('999990000115', eea_comp_cd) List,
//        EEA_EXAM_CD , '999' GUBUN
// from et_exam_acpt                                                                 
// Where EEA_EXAM_DT = :EXAM_DT                                                     
//       And EEA_EXAM_SQ = :EXAM_SQ                                                    
//       and (instr(eea_exam_lt, 'P00') > 0 or instr(eea_exam_lt, 'P56') > 0       
//        or  instr(eea_exam_lt, 'P58') > 0)                                         
// Order By GUBUN

		*/

		sql = "";
		if(! SEXAM_LIST.equals("")) {
		
			String[] arrSEXAM_LIST = SEXAM_LIST.split("\\|");
			
			for(int i=0; i<arrSEXAM_LIST.length; i++) {
			
				if(i >= 1) {
					sql += " UNION ";
				}

				sql += " SELECT F_PACK_FIND('" + arrSEXAM_LIST[i] + "', EEA_COMP_CD) LIST, EEA_EXAM_CD , '" + arrSEXAM_LIST[i].substring(0, 3) + "' GUBUN";
				sql += " FROM ET_EXAM_ACPT";
				sql += " WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
				sql += " AND (";
				sql += "	INSTR(EEA_EXAM_LT, 'P00') > 0";
				sql += " 	OR INSTR(EEA_EXAM_LT, 'P56') > 0";
				sql += " 	OR INSTR(EEA_EXAM_LT, 'P58') > 0";
				sql += " )";
			}
		
		}


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uPostManagement_NEWCustList_APPLY_RSLTSel_004 \n";
			G_INFO += "설명 : 기타검진정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SEXAM_LIST : " + SEXAM_LIST + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>200</resultCode>
	<resultXml>
		<xml xmlns:s='uuid:BDC6E3F0-6DA3-11d1-A2A3-00AA00C14882'
			xmlns:dt='uuid:C2F41010-65B3-11d1-A29F-00AA00C14882'
			xmlns:rs='urn:schemas-microsoft-com:rowset'
			xmlns:z='#RowsetSchema'>

<s:Schema id='RowsetSchema'>
	<s:ElementType name='row' content='eltOnly' rs:updatable='true'>
		<s:AttributeType name='LIST' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_CD' rs:number='2' rs:writeunknown='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='GUBUN' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='3' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='4' rs:rowid='true' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String LIST_T = cRsList.getString("LIST");
			String EEA_EXAM_CD_T = cRsList.getString("EEA_EXAM_CD");
			String GUBUN_T = cRsList.getString("GUBUN");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! LIST_T.equals("")) {
%>
		 		LIST='<%= LIST_T%>'
<%
			}

			if(! EEA_EXAM_CD_T.equals("")) {
%>
		 		EEA_EXAM_CD='<%= EEA_EXAM_CD_T%>'
<%
			}

			if(! GUBUN_T.equals("")) {
%>
		 		GUBUN='<%= GUBUN_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
			/>
<%
		}
%>
		</rs:data>
		</xml>
	</resultXml>
	<errorMsg></errorMsg>
</nurionXml>

<%
	} catch (Exception e) {

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>400</resultCode>
	<resultXml></resultXml>
	<errorMsg><![CDATA[<%= e.toString()%>]]></errorMsg>
	<sql><![CDATA[<%= sql%>]]></sql>
</nurionXml>

<%
	} finally {

		if(rsList != null) {
			rsList.close();
			rsList = null;
		}

		if(stmtList != null) {
			stmtList.close();
			stmtList = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
