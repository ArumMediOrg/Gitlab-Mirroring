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

		String REVER_NO = htMethod.get("REVER_NO");

		//
		if(REVER_NO == null) { REVER_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

Select                                                                       
A.RRT_EXAM_CD,  A.RRT_HTSB_CD,  A.RRT_HLTH_KD,  A.RRT_ORAL_YN,               
A.RRT_STOMA_CD, A.RRT_COLON_CD, A.RRT_LIVER_CD, A.RRT_BAST_CD, A.RRT_UTER_CD,
A.RRT_LUNG_CD,  A.RRT_SPSB_CD,  A.RRT_EXAM_LT,  A.RRT_PSNL_ID,                
B.ICR_BIRH_DT                                                                
From RT_RSVT A                                                               
Inner Join IT_CUSTOMER B                                                     
On B.ICR_CUST_NO = A.RRT_CUST_NO                                             
 Where A.RRT_RSVN_NO = :Rever_No
		*/

		sql = " SELECT A.RRT_EXAM_CD, A.RRT_HTSB_CD, A.RRT_HLTH_KD, A.RRT_ORAL_YN, A.RRT_STOMA_CD, A.RRT_COLON_CD, A.RRT_LIVER_CD, A.RRT_BAST_CD, A.RRT_UTER_CD, A.RRT_LUNG_CD, A.RRT_SPSB_CD, A.RRT_EXAM_LT, A.RRT_PSNL_ID, B.ICR_BIRH_DT";
		sql += " FROM RT_RSVT A INNER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.RRT_CUST_NO";
		sql += " WHERE A.RRT_RSVN_NO = '" + REVER_NO + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : MunJin_Out_Munjin_Send_001 \n";
			G_INFO += "설명 : 누리온 예약정보 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " REVER_NO : " + REVER_NO + " \n";
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
		<s:AttributeType name='RRT_EXAM_CD' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_HTSB_CD' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_HTSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_HLTH_KD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_HLTH_KD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_ORAL_YN' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_ORAL_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_STOMA_CD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_STOMA_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_COLON_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_COLON_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_LIVER_CD' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_LIVER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_BAST_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_BAST_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_UTER_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_UTER_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_LUNG_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_LUNG_CD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_SPSB_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_SPSB_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_LT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PSNL_ID' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_PSNL_ID'>
			<s:datatype dt:type='string' dt:maxLength='13'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='15' rs:rowid='true' rs:basetable='RT_RSVT' rs:basecolumn='ROWID' rs:keycolumn='true'
			 rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c15' rs:name='ROWID' rs:number='16' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
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

			String RRT_EXAM_CD_T = cRsList.getString("RRT_EXAM_CD");
			String RRT_HTSB_CD_T = cRsList.getString("RRT_HTSB_CD");
			String RRT_HLTH_KD_T = cRsList.getString("RRT_HLTH_KD");
			String RRT_ORAL_YN_T = cRsList.getString("RRT_ORAL_YN");
			String RRT_STOMA_CD_T = cRsList.getString("RRT_STOMA_CD");
			String RRT_COLON_CD_T = cRsList.getString("RRT_COLON_CD");
			String RRT_LIVER_CD_T = cRsList.getString("RRT_LIVER_CD");
			String RRT_BAST_CD_T = cRsList.getString("RRT_BAST_CD");
			String RRT_UTER_CD_T = cRsList.getString("RRT_UTER_CD");
			String RRT_LUNG_CD_T = cRsList.getString("RRT_LUNG_CD");
			String RRT_SPSB_CD_T = cRsList.getString("RRT_SPSB_CD");
			String RRT_EXAM_LT_T = cRsList.getString("RRT_EXAM_LT");
			String RRT_PSNL_ID_T = cRsList.getString("RRT_PSNL_ID");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String ROWID_T = cRsList.getString("ROWID");
			String c15_T = cRsList.getString("c15");
%>
			<z:row
<%
			if(! RRT_EXAM_CD_T.equals("")) {
%>
		 		RRT_EXAM_CD='<%= RRT_EXAM_CD_T%>'
<%
			}

			if(! RRT_HTSB_CD_T.equals("")) {
%>
		 		RRT_HTSB_CD='<%= RRT_HTSB_CD_T%>'
<%
			}

			if(! RRT_HLTH_KD_T.equals("")) {
%>
		 		RRT_HLTH_KD='<%= RRT_HLTH_KD_T%>'
<%
			}

			if(! RRT_ORAL_YN_T.equals("")) {
%>
		 		RRT_ORAL_YN='<%= RRT_ORAL_YN_T%>'
<%
			}

			if(! RRT_STOMA_CD_T.equals("")) {
%>
		 		RRT_STOMA_CD='<%= RRT_STOMA_CD_T%>'
<%
			}

			if(! RRT_COLON_CD_T.equals("")) {
%>
		 		RRT_COLON_CD='<%= RRT_COLON_CD_T%>'
<%
			}

			if(! RRT_LIVER_CD_T.equals("")) {
%>
		 		RRT_LIVER_CD='<%= RRT_LIVER_CD_T%>'
<%
			}

			if(! RRT_BAST_CD_T.equals("")) {
%>
		 		RRT_BAST_CD='<%= RRT_BAST_CD_T%>'
<%
			}

			if(! RRT_UTER_CD_T.equals("")) {
%>
		 		RRT_UTER_CD='<%= RRT_UTER_CD_T%>'
<%
			}

			if(! RRT_LUNG_CD_T.equals("")) {
%>
		 		RRT_LUNG_CD='<%= RRT_LUNG_CD_T%>'
<%
			}

			if(! RRT_SPSB_CD_T.equals("")) {
%>
		 		RRT_SPSB_CD='<%= RRT_SPSB_CD_T%>'
<%
			}

			if(! RRT_EXAM_LT_T.equals("")) {
%>
		 		RRT_EXAM_LT='<%= RRT_EXAM_LT_T%>'
<%
			}

			if(! RRT_PSNL_ID_T.equals("")) {
%>
		 		RRT_PSNL_ID='<%= RRT_PSNL_ID_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c15_T.equals("")) {
%>
		 		c15='<%= c15_T%>'
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
