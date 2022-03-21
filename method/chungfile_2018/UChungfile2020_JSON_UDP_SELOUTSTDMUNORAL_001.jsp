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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT EEA_MNGT_HTYR, EEA_INSU_NO,
       MAX(ICR_ZIP_CD) ICR_ZIP_CD, MAX(ICR_ZIP_AR) ICR_ZIP_AR, MAX(ICR_ROAD_AR) ICR_ROAD_AR,
       MAX(M857) M857,
       MAX(M858) M858,
       MAX(M859) M859,
       MAX(M860) M860,
       MAX(M716) M716,
       MAX(M717) M717,
       MAX(M718) M718,
       MAX(M719) M719,
       MAX(M720) M720,
       MAX(M721) M721,
       MAX(M861) M861,
       MAX(M862) M862,
       MAX(M863) M863,
       MAX(M864) M864,
       MAX(M724) M724
 FROM (SELECT EEA_EXAM_DT,   EEA_EXAM_SQ,
              EEA_MNGT_HTYR, EEA_INSU_NO,
              ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR,
              CASE WHEN IIQ_QGTN_CD='857' THEN QQN_RESULT END M857,
              CASE WHEN IIQ_QGTN_CD='858' THEN QQN_RESULT END M858,
              CASE WHEN IIQ_QGTN_CD='859' THEN QQN_RESULT END M859,
              CASE WHEN IIQ_QGTN_CD='860' THEN QQN_RESULT END M860,
              CASE WHEN IIQ_QGTN_CD='716' THEN QQN_RESULT END M716,
              CASE WHEN IIQ_QGTN_CD='717' THEN QQN_RESULT END M717,
              CASE WHEN IIQ_QGTN_CD='718' THEN QQN_RESULT END M718,
              CASE WHEN IIQ_QGTN_CD='719' THEN QQN_RESULT END M719,
              CASE WHEN IIQ_QGTN_CD='720' THEN QQN_RESULT END M720,
              CASE WHEN IIQ_QGTN_CD='721' THEN QQN_RESULT END M721,
              CASE WHEN IIQ_QGTN_CD='861' THEN QQN_RESULT END M861,
              CASE WHEN IIQ_QGTN_CD='862' THEN QQN_RESULT END M862,
              CASE WHEN IIQ_QGTN_CD='863' THEN QQN_RESULT END M863,
              CASE WHEN IIQ_QGTN_CD='864' THEN QQN_RESULT END M864,
              CASE WHEN IIQ_QGTN_CD='724' THEN QQN_RESULT END M724
         FROM QT_QUESTION A
              LEFT OUTER JOIN ET_EXAM_ACPT     B ON A.QQN_EXAM_DT=B.EEA_EXAM_DT AND A.QQN_EXAM_SQ=B.EEA_EXAM_SQ
              LEFT OUTER JOIN IT_CUSTOMER      C ON B.EEA_CUST_NO=C.ICR_CUST_NO
              LEFT OUTER JOIN IT_ITEM_QUESTION D ON A.QQN_QSTN_CD=D.IIQ_QGTN_CD
        WHERE EEA_EXAM_DT = :EXAM_DT
          AND EEA_EXAM_SQ = :EXAM_SQ
          AND IIQ_ITEM_CD IN('M0055')
          AND EEA_EXAM_CD in('31006')
      ) TTT
 GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, EEA_MNGT_HTYR, EEA_INSU_NO
		*/

		sql = " SELECT EEA_MNGT_HTYR, EEA_INSU_NO, MAX(ICR_ZIP_CD) ICR_ZIP_CD, MAX(ICR_ZIP_AR) ICR_ZIP_AR, MAX(ICR_ROAD_AR) ICR_ROAD_AR, MAX(M857) M857, MAX(M858) M858, MAX(M859) M859, MAX(M860) M860, MAX(M716) M716, MAX(M717) M717, MAX(M718) M718, MAX(M719) M719, MAX(M720) M720, MAX(M721) M721, MAX(M861) M861, MAX(M862) M862, MAX(M863) M863, MAX(M864) M864, MAX(M724) M724";
		sql += " FROM (";
		sql += "	SELECT EEA_EXAM_DT, EEA_EXAM_SQ, EEA_MNGT_HTYR, EEA_INSU_NO, ICR_ZIP_CD, ICR_ZIP_AR, ICR_ROAD_AR";
		sql += "	, CASE WHEN IIQ_QGTN_CD='857' THEN QQN_RESULT END M857";
		sql += "	, CASE WHEN IIQ_QGTN_CD='858' THEN QQN_RESULT END M858";
		sql += "	, CASE WHEN IIQ_QGTN_CD='859' THEN QQN_RESULT END M859";
		sql += "	, CASE WHEN IIQ_QGTN_CD='860' THEN QQN_RESULT END M860";
		sql += "	, CASE WHEN IIQ_QGTN_CD='716' THEN QQN_RESULT END M716";
		sql += "	, CASE WHEN IIQ_QGTN_CD='717' THEN QQN_RESULT END M717";
		sql += "	, CASE WHEN IIQ_QGTN_CD='718' THEN QQN_RESULT END M718";
		sql += "	, CASE WHEN IIQ_QGTN_CD='719' THEN QQN_RESULT END M719";
		sql += "	, CASE WHEN IIQ_QGTN_CD='720' THEN QQN_RESULT END M720";
		sql += "	, CASE WHEN IIQ_QGTN_CD='721' THEN QQN_RESULT END M721";
		sql += "	, CASE WHEN IIQ_QGTN_CD='861' THEN QQN_RESULT END M861";
		sql += "	, CASE WHEN IIQ_QGTN_CD='862' THEN QQN_RESULT END M862";
		sql += "	, CASE WHEN IIQ_QGTN_CD='863' THEN QQN_RESULT END M863";
		sql += "	, CASE WHEN IIQ_QGTN_CD='864' THEN QQN_RESULT END M864";
		sql += "	, CASE WHEN IIQ_QGTN_CD='724' THEN QQN_RESULT END M724";
		sql += " 	FROM QT_QUESTION A LEFT OUTER JOIN ET_EXAM_ACPT B";
		sql += " 	ON A.QQN_EXAM_DT=B.EEA_EXAM_DT";
		sql += " 	AND A.QQN_EXAM_SQ=B.EEA_EXAM_SQ LEFT OUTER JOIN IT_CUSTOMER C";
		sql += " 	ON B.EEA_CUST_NO=C.ICR_CUST_NO LEFT OUTER JOIN IT_ITEM_QUESTION D";
		sql += " 	ON A.QQN_QSTN_CD=D.IIQ_QGTN_CD";
		sql += " 	WHERE EEA_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND EEA_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " 	AND IIQ_ITEM_CD IN('M0055')";
		sql += " 	AND EEA_EXAM_CD IN('31006')";
		sql += " ) TTT";
		sql += " GROUP BY EEA_EXAM_DT, EEA_EXAM_SQ, EEA_MNGT_HTYR, EEA_INSU_NO";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : UChungfile2020_JSON_UDP_SELOUTSTDMUNORAL_001 \n";
			G_INFO += "설명 : 청구생성(학교밖 구강문진) 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
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
		<s:AttributeType name='EEA_MNGT_HTYR' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_INSU_NO' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='11'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_CD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ZIP_AR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_ROAD_AR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='M857' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M858' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M859' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M860' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M716' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M717' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M718' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M719' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M720' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M721' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M861' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M862' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M863' rs:number='18' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M864' rs:number='19' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='M724' rs:number='20' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>
		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_MNGT_HTYR_T = cRsList.getString("EEA_MNGT_HTYR");
			String EEA_INSU_NO_T = cRsList.getString("EEA_INSU_NO");
			String ICR_ZIP_CD_T = cRsList.getString("ICR_ZIP_CD");
			String ICR_ZIP_AR_T = cRsList.getString("ICR_ZIP_AR");
			String ICR_ROAD_AR_T = cRsList.getString("ICR_ROAD_AR");
			String M857_T = cRsList.getString("M857");
			String M858_T = cRsList.getString("M858");
			String M859_T = cRsList.getString("M859");
			String M860_T = cRsList.getString("M860");
			String M716_T = cRsList.getString("M716");
			String M717_T = cRsList.getString("M717");
			String M718_T = cRsList.getString("M718");
			String M719_T = cRsList.getString("M719");
			String M720_T = cRsList.getString("M720");
			String M721_T = cRsList.getString("M721");
			String M861_T = cRsList.getString("M861");
			String M862_T = cRsList.getString("M862");
			String M863_T = cRsList.getString("M863");
			String M864_T = cRsList.getString("M864");
			String M724_T = cRsList.getString("M724");
%>
			<z:row
<%
			if(! EEA_MNGT_HTYR_T.equals("")) {
%>
		 		EEA_MNGT_HTYR='<%= EEA_MNGT_HTYR_T%>'
<%
			}

			if(! EEA_INSU_NO_T.equals("")) {
%>
		 		EEA_INSU_NO='<%= EEA_INSU_NO_T%>'
<%
			}

			if(! ICR_ZIP_CD_T.equals("")) {
%>
		 		ICR_ZIP_CD='<%= ICR_ZIP_CD_T%>'
<%
			}

			if(! ICR_ZIP_AR_T.equals("")) {
%>
		 		ICR_ZIP_AR='<%= ICR_ZIP_AR_T%>'
<%
			}

			if(! ICR_ROAD_AR_T.equals("")) {
%>
		 		ICR_ROAD_AR='<%= ICR_ROAD_AR_T%>'
<%
			}

			if(! M857_T.equals("")) {
%>
		 		M857='<%= M857_T%>'
<%
			}

			if(! M858_T.equals("")) {
%>
		 		M858='<%= M858_T%>'
<%
			}

			if(! M859_T.equals("")) {
%>
		 		M859='<%= M859_T%>'
<%
			}

			if(! M860_T.equals("")) {
%>
		 		M860='<%= M860_T%>'
<%
			}

			if(! M716_T.equals("")) {
%>
		 		M716='<%= M716_T%>'
<%
			}

			if(! M717_T.equals("")) {
%>
		 		M717='<%= M717_T%>'
<%
			}

			if(! M718_T.equals("")) {
%>
		 		M718='<%= M718_T%>'
<%
			}

			if(! M719_T.equals("")) {
%>
		 		M719='<%= M719_T%>'
<%
			}

			if(! M720_T.equals("")) {
%>
		 		M720='<%= M720_T%>'
<%
			}

			if(! M721_T.equals("")) {
%>
		 		M721='<%= M721_T%>'
<%
			}

			if(! M861_T.equals("")) {
%>
		 		M861='<%= M861_T%>'
<%
			}

			if(! M862_T.equals("")) {
%>
		 		M862='<%= M862_T%>'
<%
			}

			if(! M863_T.equals("")) {
%>
		 		M863='<%= M863_T%>'
<%
			}

			if(! M864_T.equals("")) {
%>
		 		M864='<%= M864_T%>'
<%
			}

			if(! M724_T.equals("")) {
%>
		 		M724='<%= M724_T%>'
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
