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


		//

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT '1' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM 
  FROM IT_AUTH_USER A, (SELECT IAU_STOMA_DR EMP_NO FROM IT_AUTH_USER WHERE NVL(RTRIM(IAU_STOMA_DR), ' ') <> ' ' GROUP BY IAU_STOMA_DR) B 
 WHERE A.IAU_EMP_NO = B.EMP_NO 
UNION 
SELECT '2' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM 
  FROM IT_AUTH_USER A, (SELECT IAU_COLON_DR EMP_NO FROM IT_AUTH_USER WHERE NVL(RTRIM(IAU_COLON_DR), ' ') <> ' ' GROUP BY IAU_COLON_DR) B 
 WHERE A.IAU_EMP_NO = B.EMP_NO 
UNION 
SELECT '3' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM 
  FROM IT_AUTH_USER A, (SELECT IAU_LIVER_DR EMP_NO FROM IT_AUTH_USER WHERE NVL(RTRIM(IAU_LIVER_DR), ' ') <> ' ' GROUP BY IAU_LIVER_DR) B 
 WHERE A.IAU_EMP_NO = B.EMP_NO 
UNION 
SELECT '4' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM 
  FROM IT_AUTH_USER A, (SELECT IAU_BAST_DR EMP_NO FROM IT_AUTH_USER WHERE NVL(RTRIM(IAU_BAST_DR), ' ') <> ' ' GROUP BY IAU_BAST_DR) B 
 WHERE A.IAU_EMP_NO = B.EMP_NO 
UNION 
SELECT '5' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM 
  FROM IT_AUTH_USER A, (SELECT IAU_UTER_DR EMP_NO FROM IT_AUTH_USER WHERE NVL(RTRIM(IAU_UTER_DR), ' ') <> ' ' GROUP BY IAU_UTER_DR) B 
 WHERE A.IAU_EMP_NO = B.EMP_NO 
UNION 
SELECT '6' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM 
  FROM IT_AUTH_USER A, (SELECT IAU_LUNG_DR EMP_NO FROM IT_AUTH_USER WHERE NVL(RTRIM(IAU_LUNG_DR), ' ') <> ' ' GROUP BY IAU_LUNG_DR) B 
 WHERE A.IAU_EMP_NO = B.EMP_NO 
 ORDER BY CAN_KD, USE_YN DESC, IAU_PENL_NM
		*/

		sql = " SELECT '1' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER A, (";
		sql += "	SELECT IAU_STOMA_DR EMP_NO";
		sql += " 	FROM IT_AUTH_USER";
		sql += " 	WHERE NVL(RTRIM(IAU_STOMA_DR), ' ') <> ' '";
		sql += " 	GROUP BY IAU_STOMA_DR";
		sql += " ) B";
		sql += " WHERE A.IAU_EMP_NO = B.EMP_NO";

		sql += " UNION";
		sql += " SELECT '2' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER A, (";
		sql += "	SELECT IAU_COLON_DR EMP_NO";
		sql += " 	FROM IT_AUTH_USER";
		sql += " 	WHERE NVL(RTRIM(IAU_COLON_DR), ' ') <> ' '";
		sql += " 	GROUP BY IAU_COLON_DR";
		sql += " ) B";
		sql += " WHERE A.IAU_EMP_NO = B.EMP_NO";

		sql += " UNION";
		sql += " SELECT '3' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER A, (";
		sql += "	SELECT IAU_LIVER_DR EMP_NO";
		sql += " 	FROM IT_AUTH_USER";
		sql += " 	WHERE NVL(RTRIM(IAU_LIVER_DR), ' ') <> ' '";
		sql += " 	GROUP BY IAU_LIVER_DR";
		sql += " ) B";
		sql += " WHERE A.IAU_EMP_NO = B.EMP_NO";

		sql += " UNION";
		sql += " SELECT '4' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER A, (";
		sql += "	SELECT IAU_BAST_DR EMP_NO";
		sql += " 	FROM IT_AUTH_USER";
		sql += " 	WHERE NVL(RTRIM(IAU_BAST_DR), ' ') <> ' '";
		sql += " 	GROUP BY IAU_BAST_DR";
		sql += " ) B";
		sql += " WHERE A.IAU_EMP_NO = B.EMP_NO";

		sql += " UNION";
		sql += " SELECT '5' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER A, (";
		sql += "	SELECT IAU_UTER_DR EMP_NO";
		sql += " 	FROM IT_AUTH_USER";
		sql += " 	WHERE NVL(RTRIM(IAU_UTER_DR), ' ') <> ' '";
		sql += " 	GROUP BY IAU_UTER_DR";
		sql += " ) B";
		sql += " WHERE A.IAU_EMP_NO = B.EMP_NO";

		sql += " UNION";
		sql += " SELECT '6' CAN_KD, B.EMP_NO, B.EMP_NO||'-'||A.IAU_PENL_NM CAN_DR, NVL(A.IAU_USE_YN, 'Y') USE_YN, A.IAU_PENL_NM";
		sql += " FROM IT_AUTH_USER A, (";
		sql += "	SELECT IAU_LUNG_DR EMP_NO";
		sql += " 	FROM IT_AUTH_USER";
		sql += " 	WHERE NVL(RTRIM(IAU_LUNG_DR), ' ') <> ' '";
		sql += " 	GROUP BY IAU_LUNG_DR";
		sql += " ) B";
		sql += " WHERE A.IAU_EMP_NO = B.EMP_NO";

		sql += " ORDER BY CAN_KD, USE_YN DESC, IAU_PENL_NM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GP_CanDrSetting_001 \n";
			G_INFO += "설명 : 암의사 세팅 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='CAN_KD' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EMP_NO' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CAN_DR' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='121'/>
		</s:AttributeType>
		<s:AttributeType name='USE_YN' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='5'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CAN_KD_T = cRsList.getString("CAN_KD");
			String EMP_NO_T = cRsList.getString("EMP_NO");
			String CAN_DR_T = cRsList.getString("CAN_DR");
			String USE_YN_T = cRsList.getString("USE_YN");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
%>
			<z:row
<%
			if(! CAN_KD_T.equals("")) {
%>
		 		CAN_KD='<%= CAN_KD_T%>'
<%
			}

			if(! EMP_NO_T.equals("")) {
%>
		 		EMP_NO='<%= EMP_NO_T%>'
<%
			}

			if(! CAN_DR_T.equals("")) {
%>
		 		CAN_DR='<%= CAN_DR_T%>'
<%
			}

			if(! USE_YN_T.equals("")) {
%>
		 		USE_YN='<%= USE_YN_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}
%>
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
