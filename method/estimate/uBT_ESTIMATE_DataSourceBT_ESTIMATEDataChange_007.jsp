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

		String MNGT_YR = htMethod.get("MNGT_YR");
		String ESTI_CD = htMethod.get("ESTI_CD");

		//
		if(MNGT_YR == null) { MNGT_YR = ""; }
		if(ESTI_CD == null) { ESTI_CD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT BED_DEPT_SQ, BED_DEPT_NM,   BED_SUBD_NM,  BED_BCAS_PR,    BED_BCAS_RT,BED_JCAS_PR,
       BED_JCAS_RT, BED_BCUST_CNT, BED_BSALE_PR, BED_JCUST_CNT, BED_JSALE_PR,            
       CASE WHEN BED_HALF_CD  IS NULL OR BED_HALF_CD  = '' THEN BED_HALF_CD            
            else dbo.GetSP_COMMON_cdToNm('HM99F',BED_HALF_CD) END BED_HALF_NM,         
       BED_BSBS_PR, BED_BTGS_PR, BED_JSBS_PR, BED_JTGS_PR, BED_JBCAS_PR,                 
       BED_JJCAS_PR, BED_MATT_LT                                                         
FROM BT_ESTI_DEPT                                                                      
WHERE BED_MNGT_YR = :MNGT_YR
   AND BED_ESTI_CD = :ESTI_CD
   AND BED_USE_YN  = 'Y'                                                               
ORDER BY BED_DEPT_SQ 

		*/

		sql = " SELECT BED_DEPT_SQ, BED_DEPT_NM, BED_SUBD_NM, BED_BCAS_PR, BED_BCAS_RT,BED_JCAS_PR, BED_JCAS_RT, BED_BCUST_CNT, BED_BSALE_PR, BED_JCUST_CNT, BED_JSALE_PR";
		sql += ", CASE WHEN BED_HALF_CD IS NULL OR BED_HALF_CD = '' THEN BED_HALF_CD ELSE GetSP_COMMON_cdToNm('HM99F',BED_HALF_CD) END BED_HALF_NM";
		sql += ", BED_BSBS_PR, BED_BTGS_PR, BED_JSBS_PR, BED_JTGS_PR, BED_JBCAS_PR, BED_JJCAS_PR, BED_MATT_LT";
		sql += " FROM BT_ESTI_DEPT";
		sql += " WHERE BED_MNGT_YR = '" + MNGT_YR + "'";
		sql += " AND BED_ESTI_CD = '" + ESTI_CD + "'";
		sql += " AND BED_USE_YN = 'Y'";
		sql += " ORDER BY BED_DEPT_SQ";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uBT_ESTIMATE_DataSourceBT_ESTIMATEDataChange_007 \n";
			G_INFO += "설명 : 합계그리드 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " MNGT_YR : " + MNGT_YR + " \n";
			G_INFO += " ESTI_CD : " + ESTI_CD + " \n";
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
		<s:AttributeType name='BED_DEPT_SQ' rs:number='1' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT' rs:basecolumn='BED_DEPT_SQ'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BED_DEPT_NM' rs:number='2' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT' rs:basecolumn='BED_DEPT_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='BED_SUBD_NM' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_SUBD_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BCAS_PR' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BCAS_RT' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BCAS_RT'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JCAS_PR' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JCAS_RT' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JCAS_RT'>
			<s:datatype dt:type='float' dt:maxLength='8' rs:precision='15' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BCUST_CNT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BCUST_CNT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BSALE_PR' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BSALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JCUST_CNT' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JCUST_CNT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JSALE_PR' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JSALE_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_HALF_NM' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_HALF_NM'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BSBS_PR' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_BTGS_PR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_BTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JSBS_PR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JSBS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JTGS_PR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JTGS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JBCAS_PR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JBCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_JJCAS_PR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_JJCAS_PR'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BED_MATT_LT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='BT_ESTI_DEPT'
			 rs:basecolumn='BED_MATT_LT'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='20' rs:rowid='true' rs:basetable='BT_ESTI_DEPT' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String BED_DEPT_SQ_T = cRsList.getString("BED_DEPT_SQ");
			String BED_DEPT_NM_T = cRsList.getString("BED_DEPT_NM");
			String BED_SUBD_NM_T = cRsList.getString("BED_SUBD_NM");
			String BED_BCAS_PR_T = cRsList.getString("BED_BCAS_PR");
			String BED_BCAS_RT_T = cRsList.getString("BED_BCAS_RT");
			String BED_JCAS_PR_T = cRsList.getString("BED_JCAS_PR");
			String BED_JCAS_RT_T = cRsList.getString("BED_JCAS_RT");
			String BED_BCUST_CNT_T = cRsList.getString("BED_BCUST_CNT");
			String BED_BSALE_PR_T = cRsList.getString("BED_BSALE_PR");
			String BED_JCUST_CNT_T = cRsList.getString("BED_JCUST_CNT");
			String BED_JSALE_PR_T = cRsList.getString("BED_JSALE_PR");
			String BED_HALF_NM_T = cRsList.getString("BED_HALF_NM");
			String BED_BSBS_PR_T = cRsList.getString("BED_BSBS_PR");
			String BED_BTGS_PR_T = cRsList.getString("BED_BTGS_PR");
			String BED_JSBS_PR_T = cRsList.getString("BED_JSBS_PR");
			String BED_JTGS_PR_T = cRsList.getString("BED_JTGS_PR");
			String BED_JBCAS_PR_T = cRsList.getString("BED_JBCAS_PR");
			String BED_JJCAS_PR_T = cRsList.getString("BED_JJCAS_PR");
			String BED_MATT_LT_T = cRsList.getString("BED_MATT_LT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! BED_DEPT_SQ_T.equals("")) {
%>
		 		BED_DEPT_SQ='<%= BED_DEPT_SQ_T%>'
<%
			}

			if(! BED_DEPT_NM_T.equals("")) {
%>
		 		BED_DEPT_NM='<%= BED_DEPT_NM_T%>'
<%
			}

			if(! BED_SUBD_NM_T.equals("")) {
%>
		 		BED_SUBD_NM='<%= BED_SUBD_NM_T%>'
<%
			}

			if(! BED_BCAS_PR_T.equals("")) {
%>
		 		BED_BCAS_PR='<%= BED_BCAS_PR_T%>'
<%
			}

			if(! BED_BCAS_RT_T.equals("")) {
%>
		 		BED_BCAS_RT='<%= BED_BCAS_RT_T%>'
<%
			}

			if(! BED_JCAS_PR_T.equals("")) {
%>
		 		BED_JCAS_PR='<%= BED_JCAS_PR_T%>'
<%
			}

			if(! BED_JCAS_RT_T.equals("")) {
%>
		 		BED_JCAS_RT='<%= BED_JCAS_RT_T%>'
<%
			}

			if(! BED_BCUST_CNT_T.equals("")) {
%>
		 		BED_BCUST_CNT='<%= BED_BCUST_CNT_T%>'
<%
			}

			if(! BED_BSALE_PR_T.equals("")) {
%>
		 		BED_BSALE_PR='<%= BED_BSALE_PR_T%>'
<%
			}

			if(! BED_JCUST_CNT_T.equals("")) {
%>
		 		BED_JCUST_CNT='<%= BED_JCUST_CNT_T%>'
<%
			}

			if(! BED_JSALE_PR_T.equals("")) {
%>
		 		BED_JSALE_PR='<%= BED_JSALE_PR_T%>'
<%
			}

			if(! BED_HALF_NM_T.equals("")) {
%>
		 		BED_HALF_NM='<%= BED_HALF_NM_T%>'
<%
			}

			if(! BED_BSBS_PR_T.equals("")) {
%>
		 		BED_BSBS_PR='<%= BED_BSBS_PR_T%>'
<%
			}

			if(! BED_BTGS_PR_T.equals("")) {
%>
		 		BED_BTGS_PR='<%= BED_BTGS_PR_T%>'
<%
			}

			if(! BED_JSBS_PR_T.equals("")) {
%>
		 		BED_JSBS_PR='<%= BED_JSBS_PR_T%>'
<%
			}

			if(! BED_JTGS_PR_T.equals("")) {
%>
		 		BED_JTGS_PR='<%= BED_JTGS_PR_T%>'
<%
			}

			if(! BED_JBCAS_PR_T.equals("")) {
%>
		 		BED_JBCAS_PR='<%= BED_JBCAS_PR_T%>'
<%
			}

			if(! BED_JJCAS_PR_T.equals("")) {
%>
		 		BED_JJCAS_PR='<%= BED_JJCAS_PR_T%>'
<%
			}

			if(! BED_MATT_LT_T.equals("")) {
%>
		 		BED_MATT_LT='<%= BED_MATT_LT_T%>'
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
