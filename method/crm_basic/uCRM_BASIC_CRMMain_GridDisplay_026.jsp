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

	ResultSetMetaData rsmd = null;

	CRs cRsList = null;

	//
	String G_INFO = "";

	int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String SEXAM_DT = htMethod.get("SEXAM_DT");
		String SEXAM_SQ = htMethod.get("SEXAM_SQ");

		//
		if(SEXAM_DT == null) { SEXAM_DT = ""; }
		if(SEXAM_SQ == null) { SEXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*
Select CASE WHEN A.PLP_JLPN_DSCD = '0SH' then '기타질환'
            WHEN A.PLP_JLPN_DSCD = '1SH' then '폐결핵/흉부'
            WHEN A.PLP_JLPN_DSCD = '2SH' then '고혈압'
            WHEN A.PLP_JLPN_DSCD = '3SH' then '당뇨'
            WHEN A.PLP_JLPN_DSCD = '4SH' then '이상지질혈'
            WHEN A.PLP_JLPN_DSCD = '5SH' then '빈혈'
            WHEN A.PLP_JLPN_DSCD = '6SH' then '청력'
            WHEN A.PLP_JLPN_DSCD = '7SH' then '간장질환'
            WHEN A.PLP_JLPN_DSCD = '8SH' then '신장질환'
            WHEN A.PLP_JLPN_DSCD = '9SH' then '비만'
            Else '' END PLP_JLPN_DSCD,
       A.PLP_JLPN_PNCD,
              CASE WHEN A.PLP_JLPN_SH01 = '1' then '건강상담'
                   WHEN A.PLP_JLPN_SH01 = '2' then '보호구지급 및 착용지도'
                         WHEN A.PLP_JLPN_SH01 = '3' then '추적검사검사항목에 대하여 추적검사가 필요'
                         WHEN A.PLP_JLPN_SH01 = '4' then '근무중에 대하여 치료'
                        WHEN A.PLP_JLPN_SH01 = '5' then '근로시간 단축'
                         WHEN A.PLP_JLPN_SH01 = '6' then '작업전환'
                          WHEN A.PLP_JLPN_SH01 = '7' then '근로제한 및 금지'
                         WHEN A.PLP_JLPN_SH01 = '8' then '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내 '
                         WHEN A.PLP_JLPN_SH01 = '9' then '기타'
                         Else '' END PLP_JLPN_SH01,
              CASE WHEN A.PLP_JLPN_SH02 = '1' then '건강상담'
                   WHEN A.PLP_JLPN_SH02 = '2' then '보호구지급 및 착용지도'
                         WHEN A.PLP_JLPN_SH02 = '3' then '추적검사검사항목에 대하여 추적검사가 필요'
                         WHEN A.PLP_JLPN_SH02 = '4' then '근무중에 대하여 치료'
                         WHEN A.PLP_JLPN_SH02 = '5' then '근로시간 단축'
                         WHEN A.PLP_JLPN_SH02 = '6' then '작업전환'
                         WHEN A.PLP_JLPN_SH02 = '7' then '근로제한 및 금지'
                          WHEN A.PLP_JLPN_SH02 = '8' then '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안 내'
                         WHEN A.PLP_JLPN_SH02 = '9' then '기타'
                         Else '' END PLP_JLPN_SH02,
              CASE WHEN A.PLP_JLPN_SH03 = '1' then '건강상담'
                   WHEN A.PLP_JLPN_SH03 = '2' then '보호구지급 및 착용지도'
                         WHEN A.PLP_JLPN_SH03 = '3' then '추적검사검사항목에 대하여 추적검사가 필요'
                         WHEN A.PLP_JLPN_SH03 = '4' then '근무중에 대하여 치료'
                         WHEN A.PLP_JLPN_SH03 = '5' then '근로시간 단축'
                         WHEN A.PLP_JLPN_SH03 = '6' then '작업전환'
                          WHEN A.PLP_JLPN_SH03 = '7' then '근로제한 및 금지'
                         WHEN A.PLP_JLPN_SH03 = '8' then '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내 '
                         WHEN A.PLP_JLPN_SH03 = '9' then '기타'
                         Else '' END PLP_JLPN_SH03,
       A.PLP_JLPN_SHDS, A.PLP_JLPN_DOCV, A.PLP_ETC_EX, B.PFP_DOCTORFIR, C.IAU_PENL_NM
  From PT_LABOR_PANJUNG A
  Left Outer Join PT_FIR_PANJUNG B On B.PFP_EXAM_DT = A.PLP_EXAM_DT
                                  And B.PFP_EXAM_SQ = A.PLP_EXAM_SQ
  Left Outer Join IT_AUTH_USER   C On C.IAU_EMP_NO  = B.PFP_DOCTORFIR
 Where A.PLP_EXAM_DT = :sEXAM_DT
   And A.PLP_EXAM_SQ = :sEXAM_SQ
   And A.PLP_JLPN_PNCD <> 'A'
 Order By A.PLP_JLPN_DSCD


		*/

		sql = " Select CASE WHEN A.PLP_JLPN_DSCD = '0SH' then '기타질환' ";
		sql += " 			WHEN A.PLP_JLPN_DSCD = '1SH' then '폐결핵/흉부' ";
		sql += " 			WHEN A.PLP_JLPN_DSCD = '2SH' then '고혈압' ";
		sql += " 			WHEN A.PLP_JLPN_DSCD = '3SH' then '당뇨' ";
		sql += " 			WHEN A.PLP_JLPN_DSCD = '4SH' then '이상지질혈' ";
		sql += " 			WHEN A.PLP_JLPN_DSCD = '5SH' then '빈혈' ";
		sql += " 			WHEN A.PLP_JLPN_DSCD = '6SH' then '청력' ";
		sql += " 			WHEN A.PLP_JLPN_DSCD = '7SH' then '간장질환' ";
		sql += " 			WHEN A.PLP_JLPN_DSCD = '8SH' then '신장질환' ";
		sql += " 			WHEN A.PLP_JLPN_DSCD = '9SH' then '비만' ";
		sql += " 			Else '' END PLP_JLPN_DSCD, ";
		sql += " 	A.PLP_JLPN_PNCD, ";
		sql += " 			CASE WHEN A.PLP_JLPN_SH01 = '1' then '건강상담' ";
		sql += " 				WHEN A.PLP_JLPN_SH01 = '2' then '보호구지급 및 착용지도' ";
		sql += " 						WHEN A.PLP_JLPN_SH01 = '3' then '추적검사검사항목에 대하여 추적검사가 필요' ";
		sql += " 						WHEN A.PLP_JLPN_SH01 = '4' then '근무중에 대하여 치료' ";
		sql += " 						WHEN A.PLP_JLPN_SH01 = '5' then '근로시간 단축' ";
		sql += " 						WHEN A.PLP_JLPN_SH01 = '6' then '작업전환' ";
		sql += " 						WHEN A.PLP_JLPN_SH01 = '7' then '근로제한 및 금지' ";
		sql += " 						WHEN A.PLP_JLPN_SH01 = '8' then '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내 ' ";
		sql += " 						WHEN A.PLP_JLPN_SH01 = '9' then '기타' ";
		sql += " 						Else '' END PLP_JLPN_SH01, ";
		sql += " 			CASE WHEN A.PLP_JLPN_SH02 = '1' then '건강상담' ";
		sql += " 				WHEN A.PLP_JLPN_SH02 = '2' then '보호구지급 및 착용지도' ";
		sql += " 						WHEN A.PLP_JLPN_SH02 = '3' then '추적검사검사항목에 대하여 추적검사가 필요' ";
		sql += " 						WHEN A.PLP_JLPN_SH02 = '4' then '근무중에 대하여 치료' ";
		sql += " 						WHEN A.PLP_JLPN_SH02 = '5' then '근로시간 단축' ";
		sql += " 						WHEN A.PLP_JLPN_SH02 = '6' then '작업전환' ";
		sql += " 						WHEN A.PLP_JLPN_SH02 = '7' then '근로제한 및 금지' ";
		sql += " 						WHEN A.PLP_JLPN_SH02 = '8' then '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안 내' ";
		sql += " 						WHEN A.PLP_JLPN_SH02 = '9' then '기타' ";
		sql += " 						Else '' END PLP_JLPN_SH02, ";
		sql += " 			CASE WHEN A.PLP_JLPN_SH03 = '1' then '건강상담' ";
		sql += " 				WHEN A.PLP_JLPN_SH03 = '2' then '보호구지급 및 착용지도' ";
		sql += " 						WHEN A.PLP_JLPN_SH03 = '3' then '추적검사검사항목에 대하여 추적검사가 필요' ";
		sql += " 						WHEN A.PLP_JLPN_SH03 = '4' then '근무중에 대하여 치료' ";
		sql += " 						WHEN A.PLP_JLPN_SH03 = '5' then '근로시간 단축' ";
		sql += " 						WHEN A.PLP_JLPN_SH03 = '6' then '작업전환' ";
		sql += " 						WHEN A.PLP_JLPN_SH03 = '7' then '근로제한 및 금지' ";
		sql += " 						WHEN A.PLP_JLPN_SH03 = '8' then '산재요양신청서 직접 작성 등 당해 근로자에 대한 직업병확진의뢰 안내 ' ";
		sql += " 						WHEN A.PLP_JLPN_SH03 = '9' then '기타' ";
		sql += " 						Else '' END PLP_JLPN_SH03, ";
		sql += " 	A.PLP_JLPN_SHDS, A.PLP_JLPN_DOCV, A.PLP_ETC_EX, B.PFP_DOCTORFIR, C.IAU_PENL_NM ";
		sql += " From PT_LABOR_PANJUNG A ";
		sql += " Left Outer Join PT_FIR_PANJUNG B On B.PFP_EXAM_DT = A.PLP_EXAM_DT ";
		sql += " 								And B.PFP_EXAM_SQ = A.PLP_EXAM_SQ ";
		sql += " Left Outer Join IT_AUTH_USER   C On C.IAU_EMP_NO  = B.PFP_DOCTORFIR ";
		sql += " Where A.PLP_EXAM_DT = '" + SEXAM_DT + "' ";
		sql += " And A.PLP_EXAM_SQ = '" + SEXAM_SQ + "' ";
		sql += " And A.PLP_JLPN_PNCD <> 'A' ";
		sql += " Order By A.PLP_JLPN_DSCD ";



			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_CRMMain_GridDisplay_026 \n";
			G_INFO += "설명 : 상담관리-접수-검사결과-노동부 판정 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";

			G_INFO += " SEXAM_DT : " + SEXAM_DT + " \n";
			G_INFO += " SEXAM_SQ : " + SEXAM_SQ + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
			G_INFO += "-->";

		rsList = stmtList.executeQuery(sql);
		cRsList = new CRs(rsList);

		rsmd = rsList.getMetaData();  //Select 결과의 Metadata 가져오기.

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
<%
		for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
			String dataType = "string";
			String maxLength = "4000";

			if (rsmd.getColumnTypeName(colCnt).equals("BLOB")){
				dataType = "bin.hex";
				maxLength = "2147483647";
				//<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
			} else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")){
				maxLength = "1073741823";
				//<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
			}
%>
		<s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL' rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
			<s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (! maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
		</s:AttributeType>
<%
		}
%>
		<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:basetable='DUAL' rs:basecolumn='ROWID'
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

			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
				String tempData = cRsList.getString(rsmd.getColumnName(colCnt));
				if(! tempData.equals("")) {
%>
		 			<%= rsmd.getColumnName(colCnt)%>='<%= tempData%>'
<%
				}
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
