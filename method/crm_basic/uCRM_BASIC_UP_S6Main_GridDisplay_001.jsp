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

		String SLT_KD = htMethod.get("SLT_KD");
		String SRCH_DTS = htMethod.get("SRCH_DTS");
		String SRCH_DTE = htMethod.get("SRCH_DTE");
		String SSQLADD = htMethod.get("SSQLADD");

		//

		if(SLT_KD == null) { SLT_KD = ""; }
		if(SRCH_DTS == null) { SRCH_DTS = ""; }
		if(SRCH_DTE == null) { SRCH_DTE = ""; }
		if(SSQLADD == null) { SSQLADD = ""; }

		// DB객체
		stmtList = connect.createStatement();

		sql = " select RRT_RSVN_NO, RRT_EXAM_DT,  RRT_EXAM_SQ, RRT_CHART_NO, RRT_PSNL_NM, RRT_SEX_CD, RRT_PSNL_AGE, RRT_MOBL_NO  ";
		sql += "    ,RRT_ZIP_CD, RRT_ZIP_AR || ' ' || RRT_ROAD_AR RRT_ADDR ";
		sql += " 	,f_pack_find(RRT_EXAM_LT,RRT_COMP_CD) RRT_EXAM_NM, RRT_CNCL_YN, RRT_RSVN_TX ";
		sql += " 	,CCD_SEND_CNT, CCD_SEND_DT, CCD_RETN_CNT, CCD_RETN_DT, CCD_MODI_ID ";
		sql += " 	,(select IAU_PENL_NM from it_auth_user where IAU_EMP_NO = CCD_SEND_ID)   CCD_SEND_NM ";
		sql += " 	,(select IAU_PENL_NM from it_auth_user where IAU_EMP_NO = CCD_RETN_ID)   CCD_RETN_NM ";
		sql += "    ,f_pid(RRT_PSNL_ID) RRT_PSNL_ID, F_COMP_FIND(RRT_COMP_CD) RRT_COMP_NM                ";


		if (SLT_KD.equals("Exam_Dt")) {
			sql += " from rt_rsvt a left outer join cr_colon_drug b on a.RRT_RSVN_NO = b.CCD_RSVN_NO ";
			sql += " where  RRT_EXAM_DT between '" + SRCH_DTS + "' and '" + SRCH_DTE + "' ";
		} else if (SLT_KD.equals("Send_Dt")) {
			sql += " from cr_colon_drug b left outer join rt_rsvt a on a.RRT_RSVN_NO = b.CCD_RSVN_NO ";
			sql += " where   CCD_SEND_DT between '" + SRCH_DTS + "' and '" + SRCH_DTE + "' ";
		}


		sql += SSQLADD;


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_UP_S6Main_GridDisplay_001 \n";
			G_INFO += "설명 : 종검결과지-메인내역조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SLT_KD : " + SLT_KD + " \n";
			G_INFO += " SRCH_DTS : " + SRCH_DTS + " \n";
			G_INFO += " SRCH_DTE : " + SRCH_DTE + " \n";
			G_INFO += " SSQLADD : " + SSQLADD + " \n";
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
