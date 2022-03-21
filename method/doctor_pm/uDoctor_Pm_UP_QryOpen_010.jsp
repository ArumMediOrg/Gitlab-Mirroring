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

		String CMBPLACEFLG = htMethod.get("CMBPLACEFLG");
		String CMBPLACE = htMethod.get("CMBPLACE");
		String DTEDTEXAM_SDT = htMethod.get("DTEDTEXAM_SDT");
		String DTEDTEXAM_EDT = htMethod.get("DTEDTEXAM_EDT");

		//
		if(CMBPLACEFLG == null) { CMBPLACEFLG = ""; }
		if(CMBPLACE == null) { CMBPLACE = ""; }
		if(DTEDTEXAM_SDT == null) { DTEDTEXAM_SDT = ""; }
		if(DTEDTEXAM_EDT == null) { DTEDTEXAM_EDT = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT DISTINCT A.SPG_EXAM_DT, A.SPG_EXAM_SQ, A.SPG_DOCT_CD FROM ST_PANJUNG A
if :cmbPlaceFlg = '1' then
begin
        Inner Join ET_EXAM_ACPT B On B.EEA_EXAM_DT = A.SPG_EXAM_DT 
                And B.EEA_EXAM_SQ = A.SPG_EXAM_SQ                       
                And B.EEA_ORDER_YN <> 'C'                                    
                And SUBSTR(B.EEA_PLCE_CD, 1, 2)= :cmbPlace
end;
WHERE 0=0 ';
        AND A.SPG_EXAM_DT >= :DTEdtEXAM_SDT
        AND A.SPG_EXAM_DT <= :DTEdtEXAM_EDT
        AND A.SPG_EXAM_CHA = '1' 
        AND NVL(A.SPG_DOCT_CD, ' ') <> ' ' 
		*/

		sql = " SELECT DISTINCT A.SPG_EXAM_DT, A.SPG_EXAM_SQ, A.SPG_DOCT_CD";
		sql += " FROM ST_PANJUNG A";

		if(CMBPLACEFLG.equals("1")) {
			sql += " INNER JOIN ET_EXAM_ACPT B";
			sql += " ON B.EEA_EXAM_DT = A.SPG_EXAM_DT";
			sql += " AND B.EEA_EXAM_SQ = A.SPG_EXAM_SQ";
			sql += " AND B.EEA_ORDER_YN <> 'C'";
			sql += " AND SUBSTR(B.EEA_PLCE_CD, 1, 2)= '" + CMBPLACE + "'";
		}

		sql += " WHERE 0=0";
		sql += " AND A.SPG_EXAM_DT >= '" + DTEDTEXAM_SDT + "'";
		sql += " AND A.SPG_EXAM_DT <= '" + DTEDTEXAM_EDT + "'";
		sql += " AND A.SPG_EXAM_CHA = '1'";
		sql += " AND NVL(A.SPG_DOCT_CD, ' ') <> ' '";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uDoctor_Pm_UP_QryOpen_010 \n";
			G_INFO += "설명 : 특수검진1차 검진정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CMBPLACEFLG : " + CMBPLACEFLG + " \n";
			G_INFO += " CMBPLACE : " + CMBPLACE + " \n";
			G_INFO += " DTEDTEXAM_SDT : " + DTEDTEXAM_SDT + " \n";
			G_INFO += " DTEDTEXAM_EDT : " + DTEDTEXAM_EDT + " \n";
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
		<s:AttributeType name='SPG_EXAM_DT' rs:number='1' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_EXAM_SQ' rs:number='2' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_EXAM_SQ'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='SPG_DOCT_CD' rs:number='3' rs:nullable='true' rs:basetable='ST_PANJUNG' rs:basecolumn='SPG_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String SPG_EXAM_DT_T = cRsList.getString("SPG_EXAM_DT");
			String SPG_EXAM_SQ_T = cRsList.getString("SPG_EXAM_SQ");
			String SPG_DOCT_CD_T = cRsList.getString("SPG_DOCT_CD");
%>
			<z:row
<%
			if(! SPG_EXAM_DT_T.equals("")) {
%>
		 		SPG_EXAM_DT='<%= SPG_EXAM_DT_T%>'
<%
			}

			if(! SPG_EXAM_SQ_T.equals("")) {
%>
		 		SPG_EXAM_SQ='<%= SPG_EXAM_SQ_T%>'
<%
			}

			if(! SPG_DOCT_CD_T.equals("")) {
%>
		 		SPG_DOCT_CD='<%= SPG_DOCT_CD_T%>'
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
