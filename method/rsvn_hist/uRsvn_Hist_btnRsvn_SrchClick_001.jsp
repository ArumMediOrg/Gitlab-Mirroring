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

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");
		String RSVN_NO = htMethod.get("RSVN_NO");
		String RSVN_NM = htMethod.get("RSVN_NM");
		String DEL_YN = htMethod.get("DEL_YN");
		String OEDER_BY = htMethod.get("OEDER_BY");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }
		if(RSVN_NO == null) { RSVN_NO = ""; }
		if(RSVN_NM == null) { RSVN_NM = ""; }
		if(DEL_YN == null) { DEL_YN = ""; }
		if(OEDER_BY == null) { OEDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.RRT_INPT_DTT RRT_RSVN_DT, A.RRT_EXAM_DT, A.RRT_EXAM_TM, A.RRT_EXAM_SQ, 
       SUBSTR(A.RRT_RSVN_NO, 1, 8)||'-'||SUBSTR(A.RRT_RSVN_NO, 9, 6) RRT_RSVN_NO, 
       A.RRT_PSNL_NM, B.ICR_BIRH_DT, A.RRT_MOBL_NO, A.RRT_TEL_NO, A.RRT_CUST_NO, 
       F_PID(A.RRT_PSNL_ID) RRT_PSNL_ID, 
       F_CODE_FIND('0401', A.RRT_EXAM_CD, '', '1') RRT_EXAM_NM, '' RRT_DATA_KD 
  FROM RT_RSVT A LEFT OUTER JOIN IT_CUSTOMER B 
    ON B.ICR_CUST_NO = A.RRT_CUST_NO 
 WHERE A.RRT_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
   AND A.RRT_EXAM_CD <> '31001' 
   
IF (:RSVN_NO <> '') THEN
   AND A.RRT_RSVN_NO = :RSVN_NO

IF (:RSVN_NM <> '') THEN
   AND A.RRT_PSNL_NM LIKE '%'||:RSVN_NM||'%'

IF (:DEL_YN = 'Y') THEN
   AND 1 = 2 

 UNION ALL 
 
SELECT A.RRG_INPT_DTT RRT_RSVN_DT, A.RRG_EXAM_DT RRT_EXAM_DT, A.RRG_EXAM_TM RRT_EXAM_TM, A.RRG_EXAM_SQ RRT_EXAM_SQ, 
       SUBSTR(A.RRG_RSVN_NO, 1, 8)||'-'||SUBSTR(A.RRG_RSVN_NO, 9, 6) RRT_RSVN_NO, 
       A.RRG_PSNL_NM RRT_PSNL_NM, B.ICR_BIRH_DT, A.RRG_MOBL_NO RRT_MOBL_NO, A.RRG_TEL_NO RRT_TEL_NO, A.RRG_CUST_NO RRT_CUST_NO, 
       F_PID(A.RRG_PSNL_ID) RRT_PSNL_ID, 
       F_CODE_FIND('0401', A.RRG_EXAM_CD, '', '1') RRT_EXAM_NM, 'D' RRT_DATA_KD 
  FROM RT_RSVT_LOG A LEFT OUTER JOIN IT_CUSTOMER B 
    ON B.ICR_CUST_NO = A.RRG_CUST_NO 
 WHERE A.RRG_EXAM_DT BETWEEN :EXAM_SDT AND :EXAM_EDT
   AND A.RRG_EXAM_CD <> '31001' 
   AND A.RRG_DATA_KD = 'D' 

IF (:RSVN_NO <> '') THEN
   AND A.RRG_RSVN_NO = :RSVN_NO

IF (:RSVN_NM <> '') THEN
   AND A.RRG_PSNL_NM LIKE '%'||:RSVN_NM||'%'
   
   
IF (:OEDER_BY = '1') THEN
 ORDER BY RRT_EXAM_DT, RRT_PSNL_NM, RRT_RSVN_NO
ELSE IF (:OEDER_BY = '2') THEN
 ORDER BY RRT_RSVN_NO, RRT_PSNL_NM, RRT_EXAM_DT
ELSE IF (:OEDER_BY = '3') THEN
 ORDER BY RRT_PSNL_NM, RRT_EXAM_DT, RRT_RSVN_NO

		*/

		sql = " SELECT A.RRT_INPT_DTT RRT_RSVN_DT, A.RRT_EXAM_DT, A.RRT_EXAM_TM, A.RRT_EXAM_SQ, SUBSTR(A.RRT_RSVN_NO, 1, 8)||'-'||SUBSTR(A.RRT_RSVN_NO, 9, 6) RRT_RSVN_NO, A.RRT_PSNL_NM, B.ICR_BIRH_DT, A.RRT_MOBL_NO, A.RRT_TEL_NO, A.RRT_CUST_NO, F_PID(A.RRT_PSNL_ID) RRT_PSNL_ID, F_CODE_FIND('0401', A.RRT_EXAM_CD, '', '1') RRT_EXAM_NM, '' RRT_DATA_KD";
		sql += " FROM RT_RSVT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.RRT_CUST_NO";
		sql += " WHERE A.RRT_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND A.RRT_EXAM_CD <> '31001'";

		if(!RSVN_NO.equals("")) {
			sql += " AND A.RRT_RSVN_NO = '" + RSVN_NO + "'";
		}
		
		if(!RSVN_NM.equals("")) {
			sql += " AND A.RRT_PSNL_NM LIKE '%" + RSVN_NM + "%'";
		}
		
		if(DEL_YN.equals("Y")) {
			sql += " AND 1 = 2";
		}

		sql += " UNION ALL";

		sql += " SELECT A.RRG_INPT_DTT RRT_RSVN_DT, A.RRG_EXAM_DT RRT_EXAM_DT, A.RRG_EXAM_TM RRT_EXAM_TM, A.RRG_EXAM_SQ RRT_EXAM_SQ, SUBSTR(A.RRG_RSVN_NO, 1, 8)||'-'||SUBSTR(A.RRG_RSVN_NO, 9, 6) RRT_RSVN_NO, A.RRG_PSNL_NM RRT_PSNL_NM, B.ICR_BIRH_DT, A.RRG_MOBL_NO RRT_MOBL_NO, A.RRG_TEL_NO RRT_TEL_NO, A.RRG_CUST_NO RRT_CUST_NO, F_PID(A.RRG_PSNL_ID) RRT_PSNL_ID, F_CODE_FIND('0401', A.RRG_EXAM_CD, '', '1') RRT_EXAM_NM, 'D' RRT_DATA_KD";
		sql += " FROM RT_RSVT_LOG A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.RRG_CUST_NO";
		sql += " WHERE A.RRG_EXAM_DT BETWEEN '" + EXAM_SDT + "'";
		sql += " AND '" + EXAM_EDT + "'";
		sql += " AND A.RRG_EXAM_CD <> '31001'";
		sql += " AND A.RRG_DATA_KD = 'D'";

		if(!RSVN_NO.equals("")) {
			sql += " AND A.RRG_RSVN_NO = '" + RSVN_NO + "'";
		}
		
		if(!RSVN_NM.equals("")) {
			sql += " AND A.RRG_PSNL_NM LIKE '%" + RSVN_NM + "%'";
		}

		if(OEDER_BY.equals("1")) {
			sql += " ORDER BY RRT_EXAM_DT, RRT_PSNL_NM, RRT_RSVN_NO";
		}
		else if(OEDER_BY.equals("2")) {
			sql += " ORDER BY RRT_RSVN_NO, RRT_PSNL_NM, RRT_EXAM_DT";
		}
		else if(OEDER_BY.equals("3")) {
			sql += " ORDER BY RRT_PSNL_NM, RRT_EXAM_DT, RRT_RSVN_NO";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_Hist_btnRsvn_SrchClick_001 \n";
			G_INFO += "설명 : 예약이력 내역 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
			G_INFO += " RSVN_NO : " + RSVN_NO + " \n";
			G_INFO += " RSVN_NM : " + RSVN_NM + " \n";
			G_INFO += " DEL_YN : " + DEL_YN + " \n";
			G_INFO += " OEDER_BY : " + OEDER_BY + " \n";
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
		<s:AttributeType name='RRT_RSVN_DT' rs:number='1' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_DT' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_TM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EXAM_TM'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_SQ' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_RSVN_NO' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='29'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PSNL_NM' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_MOBL_NO' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_MOBL_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_TEL_NO' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_TEL_NO'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_CUST_NO' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PSNL_ID' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_NM' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_DATA_KD' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRT_RSVN_DT_T = cRsList.getDate2("RRT_RSVN_DT");
			String RRT_EXAM_DT_T = cRsList.getString("RRT_EXAM_DT");
			String RRT_EXAM_TM_T = cRsList.getString("RRT_EXAM_TM");
			String RRT_EXAM_SQ_T = cRsList.getString("RRT_EXAM_SQ");
			String RRT_RSVN_NO_T = cRsList.getString("RRT_RSVN_NO");
			String RRT_PSNL_NM_T = cRsList.getString("RRT_PSNL_NM");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String RRT_MOBL_NO_T = cRsList.getString("RRT_MOBL_NO");
			String RRT_TEL_NO_T = cRsList.getString("RRT_TEL_NO");
			String RRT_CUST_NO_T = cRsList.getString("RRT_CUST_NO");
			String RRT_PSNL_ID_T = cRsList.getString("RRT_PSNL_ID");
			String RRT_EXAM_NM_T = cRsList.getString("RRT_EXAM_NM");
			String RRT_DATA_KD_T = cRsList.getString("RRT_DATA_KD");
%>
			<z:row
<%
			if(! RRT_RSVN_DT_T.equals("")) {
%>
		 		RRT_RSVN_DT='<%= RRT_RSVN_DT_T%>'
<%
			}

			if(! RRT_EXAM_DT_T.equals("")) {
%>
		 		RRT_EXAM_DT='<%= RRT_EXAM_DT_T%>'
<%
			}

			if(! RRT_EXAM_TM_T.equals("")) {
%>
		 		RRT_EXAM_TM='<%= RRT_EXAM_TM_T%>'
<%
			}

			if(! RRT_EXAM_SQ_T.equals("")) {
%>
		 		RRT_EXAM_SQ='<%= RRT_EXAM_SQ_T%>'
<%
			}

			if(! RRT_RSVN_NO_T.equals("")) {
%>
		 		RRT_RSVN_NO='<%= RRT_RSVN_NO_T%>'
<%
			}

			if(! RRT_PSNL_NM_T.equals("")) {
%>
		 		RRT_PSNL_NM='<%= RRT_PSNL_NM_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! RRT_MOBL_NO_T.equals("")) {
%>
		 		RRT_MOBL_NO='<%= RRT_MOBL_NO_T%>'
<%
			}

			if(! RRT_TEL_NO_T.equals("")) {
%>
		 		RRT_TEL_NO='<%= RRT_TEL_NO_T%>'
<%
			}

			if(! RRT_CUST_NO_T.equals("")) {
%>
		 		RRT_CUST_NO='<%= RRT_CUST_NO_T%>'
<%
			}

			if(! RRT_PSNL_ID_T.equals("")) {
%>
		 		RRT_PSNL_ID='<%= RRT_PSNL_ID_T%>'
<%
			}

			if(! RRT_EXAM_NM_T.equals("")) {
%>
		 		RRT_EXAM_NM='<%= RRT_EXAM_NM_T%>'
<%
			}

			if(! RRT_DATA_KD_T.equals("")) {
%>
		 		RRT_DATA_KD='<%= RRT_DATA_KD_T%>'
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
