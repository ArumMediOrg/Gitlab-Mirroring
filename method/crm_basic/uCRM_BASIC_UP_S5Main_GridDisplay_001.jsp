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
		String SSQLADD = htMethod.get("SSQLADD");

		//

		if(SLT_KD == null) { SLT_KD = "";}
		if(SSQLADD == null) { SSQLADD = "";}

		// DB객체
		stmtList = connect.createStatement();

		sql += " select CPM_SEQ, EEA_EXAM_DT, EEA_EXAM_SQ, EEA_CHART_NO, EEA_PSNL_NM, EEA_MOBL_NO ";
		sql += " , EEA_ACPT_TX ,EEA_ZIP_CD, EEA_ZIP_AR || ' ' || EEA_ROAD_AR EEA_ADDR   ";
		sql += " , CPM_PSND_DT ,CPM_EMAIL_DT ,CPM_PCHK_DT ,CPM_PREG_DT ";
		sql += " , CPM_RMRK_TX ,CPM_MODI_ID  ,CPM_MODI_DTT ";
		sql += " ,(select IAU_PENL_NM from it_auth_user where IAU_EMP_NO = CPM_PREG_ID)   CPM_PREG_NM  ";
		sql += " ,(select IAU_PENL_NM from it_auth_user where IAU_EMP_NO = CPM_PSND_ID)   CPM_PSND_NM  ";
		sql += " ,(select IAU_PENL_NM from it_auth_user where IAU_EMP_NO = CPM_EMAIL_ID)  CPM_EMAIL_NM ";
		sql += " ,(select IAU_PENL_NM from it_auth_user where IAU_EMP_NO = CPM_PCHK_ID)   CPM_PCHK_NM  ";
		sql += " ,(select IAU_PENL_NM from it_auth_user where IAU_EMP_NO = CPM_MODI_ID)   CPM_MODI_NM ";
		sql += " , (b.EEA_ZIP_AR || ' ' || b.EEA_ROAD_AR) AS EEA_ADDR_NM ";


		if (SLT_KD.equals("Acpt_Dt")){
			sql += " from ET_EXAM_ACPT b inner join CR_POST_MNG a     ";
			sql += " on a.CPM_EXAM_DT = b.EEA_EXAM_dt and a.CPM_EXAM_SQ = b.EEA_EXAM_SQ  ";
			sql += " where  1 = 1 ";
		} else {
			sql += " from CR_POST_MNG a left outer join ET_EXAM_ACPT b    ";
			sql += " on a.CPM_EXAM_DT = b.EEA_EXAM_dt and a.CPM_EXAM_SQ = b.EEA_EXAM_SQ  ";
			sql += " where  1 = 1  ";
		}

		sql += SSQLADD;


			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCRM_BASIC_UP_S5Main_GridDisplay_001 \n";
			G_INFO += "설명 : 종검결과지-메인내역조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " SLT_KD : " + SLT_KD + " \n";
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
