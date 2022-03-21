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

		String G_ENCRT_KD = htMethod.get("G_ENCRT_KD");
		String DP_FROMDT = htMethod.get("DP_FROMDT");
		String DP_TODT = htMethod.get("DP_TODT");

		//
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(DP_FROMDT == null) { DP_FROMDT = ""; }
		if(DP_TODT == null) { DP_TODT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

if :g_Encrt_Kd = '1' then
  select bb.icr_pid_en psnl_id, 
else if :g_Encrt_Kd = '2' then
  select ECHELONDB.ecl_decrypt(bb.icr_pid_en) psnl_id,
else
  select bb.icr_penl_id psnl_id,

       RRM_RECE_NO,
       SUBSTR(RRM_RECE_NO,1,4)||'-'||SUBSTR(RRM_RECE_NO,5,2)||'-'||SUBSTR(RRM_RECE_NO,7,2) EXAM_DT,
       SUBSTR(RRM_RECE_NO,9,6) EXAM_SQ,
       CASE
           WHEN (RRM_PAY_KD) ='01' THEN '카드'
           WHEN (RRM_PAY_KD) ='02' THEN '현금'
           WHEN (RRM_PAY_KD) ='03' THEN '현영'
           WHEN (RRM_PAY_KD) ='04' THEN '통장'
       END RRM_PAY_KD,
       RRM_RECE_DT,
       RRM_CHARGE_PR,
       RRM_RECE_PR,
       F_RPAD(RRM_CUST_NM,40,' ') RRM_CUST_NM
  FROM
       (select (select EEA_CUST_NO from ET_EXAM_ACPT where EEA_RECE_NO =  RRM_RECE_NO AND ROWNUM = 1) EEA_CUST_NO,
                A.*
        from RT_RECE_MEDICHK A
        WHERE A.RRM_RECE_DT >= :dp_fromdt
              AND A.RRM_RECE_DT <= :dp_todt
              AND A.RRM_OCCU_KD IN ('20')
       ) AA
       LEFT OUTER JOIN IT_CUSTOMER BB
            ON AA.EEA_CUST_NO=BB.ICR_CUST_NO
  order by RRM_RECE_DT
		*/

		if(G_ENCRT_KD.equals("1")) {
			sql = " SELECT BB.ICR_PID_EN PSNL_ID,";
		}
		else if (G_ENCRT_KD.equals("2")) {
			sql = " SELECT ECHELONDB.ECL_DECRYPT(BB.ICR_PID_EN) PSNL_ID,";
		}
		else {
			sql = " SELECT BB.ICR_PENL_ID PSNL_ID,";
 		}
		sql += " RRM_RECE_NO, SUBSTR(RRM_RECE_NO,1,4)||'-'||SUBSTR(RRM_RECE_NO,5,2)||'-'||SUBSTR(RRM_RECE_NO,7,2) EXAM_DT, SUBSTR(RRM_RECE_NO,9,6) EXAM_SQ";
		sql += ", CASE WHEN (RRM_PAY_KD) ='01' THEN '카드' WHEN (RRM_PAY_KD) ='02' THEN '현금' WHEN (RRM_PAY_KD) ='03' THEN '현영' WHEN (RRM_PAY_KD) ='04' THEN '통장' END RRM_PAY_KD";
		sql += ", RRM_RECE_DT, RRM_CHARGE_PR, RRM_RECE_PR, F_RPAD(RRM_CUST_NM,40,' ') RRM_CUST_NM";
		sql += " FROM (";
		sql += "	SELECT (";
		sql += "		SELECT EEA_CUST_NO";
		sql += " 		FROM ET_EXAM_ACPT";
		sql += " 		WHERE EEA_RECE_NO = RRM_RECE_NO";
		sql += " 		AND ROWNUM = 1";
		sql += "	) EEA_CUST_NO, A.*";
		sql += " 	FROM RT_RECE_MEDICHK A";
		sql += " 	WHERE A.RRM_RECE_DT >= '" + DP_FROMDT + "'";
		sql += " 	AND A.RRM_RECE_DT <= '" + DP_TODT + "'";
		sql += " 	AND A.RRM_OCCU_KD IN ('20')";
		sql += " ) AA LEFT OUTER JOIN IT_CUSTOMER BB";
		sql += " ON AA.EEA_CUST_NO=BB.ICR_CUST_NO";
		sql += " ORDER BY RRM_RECE_DT";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uNTSMEDTAX_Up_afLoadTax_001 \n";
			G_INFO += "설명 : 소득공제 계산 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " DP_FROMDT : " + DP_FROMDT + " \n";
			G_INFO += " DP_TODT : " + DP_TODT + " \n";
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
		<s:AttributeType name='PSNL_ID' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RECE_NO' rs:number='2'>
			<s:datatype dt:type='string' dt:maxLength='14' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_DT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='18'/>
		</s:AttributeType>
		<s:AttributeType name='EXAM_SQ' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_PAY_KD' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RECE_DT' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_CHARGE_PR' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RECE_PR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='numeric' dt:maxLength='19' rs:scale='0' rs:precision='10' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_CUST_NM' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String PSNL_ID_T = cRsList.getString("PSNL_ID");
			String RRM_RECE_NO_T = cRsList.getString("RRM_RECE_NO");
			String EXAM_DT_T = cRsList.getString("EXAM_DT");
			String EXAM_SQ_T = cRsList.getString("EXAM_SQ");
			String RRM_PAY_KD_T = cRsList.getString("RRM_PAY_KD");
			String RRM_RECE_DT_T = cRsList.getString("RRM_RECE_DT");
			String RRM_CHARGE_PR_T = cRsList.getString("RRM_CHARGE_PR");
			String RRM_RECE_PR_T = cRsList.getString("RRM_RECE_PR");
			String RRM_CUST_NM_T = cRsList.getString("RRM_CUST_NM");
%>
			<z:row
<%
			if(! PSNL_ID_T.equals("")) {
%>
		 		PSNL_ID='<%= PSNL_ID_T%>'
<%
			}

			if(! RRM_RECE_NO_T.equals("")) {
%>
		 		RRM_RECE_NO='<%= RRM_RECE_NO_T%>'
<%
			}

			if(! EXAM_DT_T.equals("")) {
%>
		 		EXAM_DT='<%= EXAM_DT_T%>'
<%
			}

			if(! EXAM_SQ_T.equals("")) {
%>
		 		EXAM_SQ='<%= EXAM_SQ_T%>'
<%
			}

			if(! RRM_PAY_KD_T.equals("")) {
%>
		 		RRM_PAY_KD='<%= RRM_PAY_KD_T%>'
<%
			}

			if(! RRM_RECE_DT_T.equals("")) {
%>
		 		RRM_RECE_DT='<%= RRM_RECE_DT_T%>'
<%
			}

			if(! RRM_CHARGE_PR_T.equals("")) {
%>
		 		RRM_CHARGE_PR='<%= RRM_CHARGE_PR_T%>'
<%
			}

			if(! RRM_RECE_PR_T.equals("")) {
%>
		 		RRM_RECE_PR='<%= RRM_RECE_PR_T%>'
<%
			}

			if(! RRM_CUST_NM_T.equals("")) {
%>
		 		RRM_CUST_NM='<%= RRM_CUST_NM_T%>'
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
