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

		String APLY_DT = htMethod.get("APLY_DT");
		String ORAL_YN = htMethod.get("ORAL_YN");

		//
		if(APLY_DT == null) { APLY_DT = ""; }
		if(ORAL_YN == null) { ORAL_YN = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT MAX(R0028) A0001, MAX(M0044) J0011,
       MAX(BF007) BF007, MAX(F0001) F0001, MAX(F0003) F0003, MAX(F0007) F0007, 
       MAX(F0014) F0014, MAX(BD003) BD003, MAX(BB022) BB022, MAX(BA014) BA014, 
       MAX(BB005) BB005, MAX(BA005) BA005, MAX(BA006) BA006, MAX(BA009) BA009, 
       MAX(BA010) BA010, MAX(BA013) BA013 
  FROM (SELECT IIP_APLY_DT, 
               CASE WHEN IIP_ITEM_CD = 'A0001' THEN IIP_STSG_PR END A0001, 
               CASE WHEN IIP_ITEM_CD = 'J0011' THEN IIP_STSG_PR END J0011, 
               CASE WHEN IIP_ITEM_CD = 'R0028' THEN IIP_STSG_PR END R0028, 
               CASE WHEN IIP_ITEM_CD = 'M0044' THEN IIP_STSG_PR END M0044, 
               CASE WHEN IIP_ITEM_CD = 'BF007' THEN IIP_STSG_PR END BF007, 
               CASE WHEN IIP_ITEM_CD = 'F0001' THEN IIP_STSG_PR END F0001, 
               CASE WHEN IIP_ITEM_CD = 'F0003' THEN IIP_STSG_PR END F0003, 
               CASE WHEN IIP_ITEM_CD = 'F0007' THEN IIP_STSG_PR END F0007, 
               CASE WHEN IIP_ITEM_CD = 'F0014' THEN IIP_STSG_PR END F0014, 
               CASE WHEN IIP_ITEM_CD = 'BD003' THEN IIP_STSG_PR END BD003, 
               CASE WHEN IIP_ITEM_CD = 'BB022' THEN IIP_STSG_PR END BB022, 
               CASE WHEN IIP_ITEM_CD = 'BB005' THEN IIP_STSG_PR END BB005, 
               CASE WHEN IIP_ITEM_CD = 'BA005' THEN IIP_STSG_PR END BA005, 
               CASE WHEN IIP_ITEM_CD = 'BA006' THEN IIP_STSG_PR END BA006, 
               CASE WHEN IIP_ITEM_CD = 'BA009' THEN IIP_STSG_PR END BA009, 
               CASE WHEN IIP_ITEM_CD = 'BA014' THEN IIP_STSG_PR END BA014, 
               CASE WHEN IIP_ITEM_CD = 'BA010' THEN IIP_STSG_PR END BA010, 
               CASE WHEN IIP_ITEM_CD = 'BA013' THEN IIP_STSG_PR END BA013  
          FROM IT_ITEM_PRICE A 
         WHERE IIP_APLY_DT = (SELECT MAX(B.IIP_APLY_DT) 
                               FROM IT_ITEM_PRICE B 
                              WHERE A.IIP_ITEM_CD = B.IIP_ITEM_CD 
                                AND B.IIP_APLY_DT LIKE :APLY_DT || '%')
                                
IF (:ORAL_YN = 'Y') THEN
           AND IIP_ITEM_CD IN ('J0011', 'M0044') 
IF (:ORAL_YN = 'N') THEN
           AND IIP_ITEM_CD IN ('A0001', 'BF007', 'F0001', 'F0003', 'BA010', 'BA013', 
                               'F0007', 'F0014', 'BD003', 'BB022', 'BB005', 
                               'BA005', 'BA006', 'BA009', 'BA014', 'R0028') 
ELSE                                
           AND IIP_ITEM_CD IN ('A0001', 'J0011', 'BF007', 'F0001', 'F0003', 'BA010', 
                               'F0007', 'F0014', 'BD003', 'BB022', 'BB005', 'BA013',
                               'BA005', 'BA006', 'BA009', 'BA014', 'R0028', 'M0044')
       ) FF
        
		*/

		sql = " SELECT MAX(R0028) A0001, MAX(M0044) J0011, MAX(BF007) BF007, MAX(F0001) F0001, MAX(F0003) F0003, MAX(F0007) F0007, MAX(F0014) F0014, MAX(BD003) BD003, MAX(BB022) BB022, MAX(BA014) BA014, MAX(BB005) BB005, MAX(BA005) BA005, MAX(BA006) BA006, MAX(BA009) BA009, MAX(BA010) BA010, MAX(BA013) BA013";
		sql += " FROM (";
		sql += "	SELECT IIP_APLY_DT";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'A0001' THEN IIP_STSG_PR END A0001";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'J0011' THEN IIP_STSG_PR END J0011";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'R0028' THEN IIP_STSG_PR END R0028";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'M0044' THEN IIP_STSG_PR END M0044";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'BF007' THEN IIP_STSG_PR END BF007";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'F0001' THEN IIP_STSG_PR END F0001";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'F0003' THEN IIP_STSG_PR END F0003";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'F0007' THEN IIP_STSG_PR END F0007";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'F0014' THEN IIP_STSG_PR END F0014";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'BD003' THEN IIP_STSG_PR END BD003";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'BB022' THEN IIP_STSG_PR END BB022";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'BB005' THEN IIP_STSG_PR END BB005";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'BA005' THEN IIP_STSG_PR END BA005";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'BA006' THEN IIP_STSG_PR END BA006";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'BA009' THEN IIP_STSG_PR END BA009";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'BA014' THEN IIP_STSG_PR END BA014";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'BA010' THEN IIP_STSG_PR END BA010";
		sql += "	, CASE WHEN IIP_ITEM_CD = 'BA013' THEN IIP_STSG_PR END BA013";
		sql += " FROM IT_ITEM_PRICE A";
		sql += " WHERE IIP_APLY_DT = (";
		sql += "	SELECT MAX(B.IIP_APLY_DT)";
		sql += " 	FROM IT_ITEM_PRICE B";
		sql += " 	WHERE A.IIP_ITEM_CD = B.IIP_ITEM_CD";
		sql += " 	AND B.IIP_APLY_DT LIKE '" + APLY_DT + "%'";
		sql += " )";

		if(ORAL_YN.equals("Y")) {
			sql += " AND IIP_ITEM_CD IN ('J0011', 'M0044')";
		}
		
		if(ORAL_YN.equals("N")) {
			sql += " AND IIP_ITEM_CD IN ('A0001', 'BF007', 'F0001', 'F0003', 'BA010', 'BA013', 'F0007', 'F0014', 'BD003', 'BB022', 'BB005', 'BA005', 'BA006', 'BA009', 'BA014', 'R0028')";
		}
		else {
			sql += " AND IIP_ITEM_CD IN ('A0001', 'J0011', 'BF007', 'F0001', 'F0003', 'BA010', 'F0007', 'F0014', 'BD003', 'BB022', 'BB005', 'BA013', 'BA005', 'BA006', 'BA009', 'BA014', 'R0028', 'M0044')";
		}

		sql += " ) FF";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRtStudChung_UP_Print_001 \n";
			G_INFO += "설명 : 학생검사항목별 수가 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " APLY_DT : " + APLY_DT + " \n";
			G_INFO += " ORAL_YN : " + ORAL_YN + " \n";
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
		<s:AttributeType name='A0001' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='J0011' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BF007' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='F0001' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='F0003' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='F0007' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='F0014' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BD003' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BB022' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA014' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BB005' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA005' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA006' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA009' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA010' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BA013' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String A0001_T = cRsList.getString("A0001");
			String J0011_T = cRsList.getString("J0011");
			String BF007_T = cRsList.getString("BF007");
			String F0001_T = cRsList.getString("F0001");
			String F0003_T = cRsList.getString("F0003");
			String F0007_T = cRsList.getString("F0007");
			String F0014_T = cRsList.getString("F0014");
			String BD003_T = cRsList.getString("BD003");
			String BB022_T = cRsList.getString("BB022");
			String BA014_T = cRsList.getString("BA014");
			String BB005_T = cRsList.getString("BB005");
			String BA005_T = cRsList.getString("BA005");
			String BA006_T = cRsList.getString("BA006");
			String BA009_T = cRsList.getString("BA009");
			String BA010_T = cRsList.getString("BA010");
			String BA013_T = cRsList.getString("BA013");
%>
			<z:row
<%
			if(! A0001_T.equals("")) {
%>
		 		A0001='<%= A0001_T%>'
<%
			}

			if(! J0011_T.equals("")) {
%>
		 		J0011='<%= J0011_T%>'
<%
			}

			if(! BF007_T.equals("")) {
%>
		 		BF007='<%= BF007_T%>'
<%
			}

			if(! F0001_T.equals("")) {
%>
		 		F0001='<%= F0001_T%>'
<%
			}

			if(! F0003_T.equals("")) {
%>
		 		F0003='<%= F0003_T%>'
<%
			}

			if(! F0007_T.equals("")) {
%>
		 		F0007='<%= F0007_T%>'
<%
			}

			if(! F0014_T.equals("")) {
%>
		 		F0014='<%= F0014_T%>'
<%
			}

			if(! BD003_T.equals("")) {
%>
		 		BD003='<%= BD003_T%>'
<%
			}

			if(! BB022_T.equals("")) {
%>
		 		BB022='<%= BB022_T%>'
<%
			}

			if(! BA014_T.equals("")) {
%>
		 		BA014='<%= BA014_T%>'
<%
			}

			if(! BB005_T.equals("")) {
%>
		 		BB005='<%= BB005_T%>'
<%
			}

			if(! BA005_T.equals("")) {
%>
		 		BA005='<%= BA005_T%>'
<%
			}

			if(! BA006_T.equals("")) {
%>
		 		BA006='<%= BA006_T%>'
<%
			}

			if(! BA009_T.equals("")) {
%>
		 		BA009='<%= BA009_T%>'
<%
			}

			if(! BA010_T.equals("")) {
%>
		 		BA010='<%= BA010_T%>'
<%
			}

			if(! BA013_T.equals("")) {
%>
		 		BA013='<%= BA013_T%>'
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
