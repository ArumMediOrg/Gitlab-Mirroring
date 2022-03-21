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

SELECT * FROM CT_COMM_PANJ WHERE CCP_GUBN_CD  = '200' AND CCP_USE_YN = 'Y'
		*/

		sql = " SELECT *";
		sql += " FROM CT_COMM_PANJ";
		sql += " WHERE CCP_GUBN_CD = '200'";
		sql += " AND CCP_USE_YN = 'Y'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uJobStress_Btn_PanJungClick_001 \n";
			G_INFO += "설명 : 판정정보 로딩 \n";
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
		<s:AttributeType name='CCP_GUBN_CD' rs:number='1' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ' rs:basecolumn='CCP_GUBN_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_MACH_CD' rs:number='2' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ' rs:basecolumn='CCP_MACH_CD'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_MACH_SQ' rs:number='3' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ' rs:basecolumn='CCP_MACH_SQ'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_MACH_NM' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_MACH_NM'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_CMPR_KD' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_CMPR_KD'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_ITEM_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_ITEM_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_MAN_LOW' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_MAN_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_MAN_HIGH' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_MAN_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_WOMAN_LOW' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_WOMAN_LOW'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_WOMAN_HIGH' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_WOMAN_HIGH'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_CHAR_VAL1' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_CHAR_VAL1'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_CHAR_VAL2' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_CHAR_VAL2'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_CHAR_VAL3' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_CHAR_VAL3'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_CHAR_VAL4' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_CHAR_VAL4'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_CHAR_VAL5' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_CHAR_VAL5'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_CHAR_VAL6' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_CHAR_VAL6'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_CHAR_VAL7' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_CHAR_VAL7'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_SOKUN_TX' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_SOKUN_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_RMK_TX' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_RMK_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_NORM_YN' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_NORM_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_USE_YN' rs:number='21' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ' rs:basecolumn='CCP_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_NUSE_ID' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_NUSE_DTT' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_INPT_ID' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_INPT_DTT' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_MODI_ID' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CCP_MODI_DTT' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='CCP_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='28' rs:rowid='true' rs:writeunknown='true' rs:basetable='CT_COMM_PANJ'
			 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CCP_GUBN_CD_T = cRsList.getString("CCP_GUBN_CD");
			String CCP_MACH_CD_T = cRsList.getString("CCP_MACH_CD");
			String CCP_MACH_SQ_T = cRsList.getString("CCP_MACH_SQ");
			String CCP_MACH_NM_T = cRsList.getString("CCP_MACH_NM");
			String CCP_CMPR_KD_T = cRsList.getString("CCP_CMPR_KD");
			String CCP_ITEM_CD_T = cRsList.getString("CCP_ITEM_CD");
			String CCP_MAN_LOW_T = cRsList.getString("CCP_MAN_LOW");
			String CCP_MAN_HIGH_T = cRsList.getString("CCP_MAN_HIGH");
			String CCP_WOMAN_LOW_T = cRsList.getString("CCP_WOMAN_LOW");
			String CCP_WOMAN_HIGH_T = cRsList.getString("CCP_WOMAN_HIGH");
			String CCP_CHAR_VAL1_T = cRsList.getString("CCP_CHAR_VAL1");
			String CCP_CHAR_VAL2_T = cRsList.getString("CCP_CHAR_VAL2");
			String CCP_CHAR_VAL3_T = cRsList.getString("CCP_CHAR_VAL3");
			String CCP_CHAR_VAL4_T = cRsList.getString("CCP_CHAR_VAL4");
			String CCP_CHAR_VAL5_T = cRsList.getString("CCP_CHAR_VAL5");
			String CCP_CHAR_VAL6_T = cRsList.getString("CCP_CHAR_VAL6");
			String CCP_CHAR_VAL7_T = cRsList.getString("CCP_CHAR_VAL7");
			String CCP_SOKUN_TX_T = cRsList.getString("CCP_SOKUN_TX");
			String CCP_RMK_TX_T = cRsList.getString("CCP_RMK_TX");
			String CCP_NORM_YN_T = cRsList.getString("CCP_NORM_YN");
			String CCP_USE_YN_T = cRsList.getString("CCP_USE_YN");
			String CCP_NUSE_ID_T = cRsList.getString("CCP_NUSE_ID");
			String CCP_NUSE_DTT_T = cRsList.getDate2("CCP_NUSE_DTT");
			String CCP_INPT_ID_T = cRsList.getString("CCP_INPT_ID");
			String CCP_INPT_DTT_T = cRsList.getDate2("CCP_INPT_DTT");
			String CCP_MODI_ID_T = cRsList.getString("CCP_MODI_ID");
			String CCP_MODI_DTT_T = cRsList.getDate2("CCP_MODI_DTT");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! CCP_GUBN_CD_T.equals("")) {
%>
		 		CCP_GUBN_CD='<%= CCP_GUBN_CD_T%>'
<%
			}

			if(! CCP_MACH_CD_T.equals("")) {
%>
		 		CCP_MACH_CD='<%= CCP_MACH_CD_T%>'
<%
			}

			if(! CCP_MACH_SQ_T.equals("")) {
%>
		 		CCP_MACH_SQ='<%= CCP_MACH_SQ_T%>'
<%
			}

			if(! CCP_MACH_NM_T.equals("")) {
%>
		 		CCP_MACH_NM='<%= CCP_MACH_NM_T%>'
<%
			}

			if(! CCP_CMPR_KD_T.equals("")) {
%>
		 		CCP_CMPR_KD='<%= CCP_CMPR_KD_T%>'
<%
			}

			if(! CCP_ITEM_CD_T.equals("")) {
%>
		 		CCP_ITEM_CD='<%= CCP_ITEM_CD_T%>'
<%
			}

			if(! CCP_MAN_LOW_T.equals("")) {
%>
		 		CCP_MAN_LOW='<%= CCP_MAN_LOW_T%>'
<%
			}

			if(! CCP_MAN_HIGH_T.equals("")) {
%>
		 		CCP_MAN_HIGH='<%= CCP_MAN_HIGH_T%>'
<%
			}

			if(! CCP_WOMAN_LOW_T.equals("")) {
%>
		 		CCP_WOMAN_LOW='<%= CCP_WOMAN_LOW_T%>'
<%
			}

			if(! CCP_WOMAN_HIGH_T.equals("")) {
%>
		 		CCP_WOMAN_HIGH='<%= CCP_WOMAN_HIGH_T%>'
<%
			}

			if(! CCP_CHAR_VAL1_T.equals("")) {
%>
		 		CCP_CHAR_VAL1='<%= CCP_CHAR_VAL1_T%>'
<%
			}

			if(! CCP_CHAR_VAL2_T.equals("")) {
%>
		 		CCP_CHAR_VAL2='<%= CCP_CHAR_VAL2_T%>'
<%
			}

			if(! CCP_CHAR_VAL3_T.equals("")) {
%>
		 		CCP_CHAR_VAL3='<%= CCP_CHAR_VAL3_T%>'
<%
			}

			if(! CCP_CHAR_VAL4_T.equals("")) {
%>
		 		CCP_CHAR_VAL4='<%= CCP_CHAR_VAL4_T%>'
<%
			}

			if(! CCP_CHAR_VAL5_T.equals("")) {
%>
		 		CCP_CHAR_VAL5='<%= CCP_CHAR_VAL5_T%>'
<%
			}

			if(! CCP_CHAR_VAL6_T.equals("")) {
%>
		 		CCP_CHAR_VAL6='<%= CCP_CHAR_VAL6_T%>'
<%
			}

			if(! CCP_CHAR_VAL7_T.equals("")) {
%>
		 		CCP_CHAR_VAL7='<%= CCP_CHAR_VAL7_T%>'
<%
			}

			if(! CCP_SOKUN_TX_T.equals("")) {
%>
		 		CCP_SOKUN_TX='<%= CCP_SOKUN_TX_T%>'
<%
			}

			if(! CCP_RMK_TX_T.equals("")) {
%>
		 		CCP_RMK_TX='<%= CCP_RMK_TX_T%>'
<%
			}

			if(! CCP_NORM_YN_T.equals("")) {
%>
		 		CCP_NORM_YN='<%= CCP_NORM_YN_T%>'
<%
			}

			if(! CCP_USE_YN_T.equals("")) {
%>
		 		CCP_USE_YN='<%= CCP_USE_YN_T%>'
<%
			}

			if(! CCP_NUSE_ID_T.equals("")) {
%>
		 		CCP_NUSE_ID='<%= CCP_NUSE_ID_T%>'
<%
			}

			if(! CCP_NUSE_DTT_T.equals("")) {
%>
		 		CCP_NUSE_DTT='<%= CCP_NUSE_DTT_T%>'
<%
			}

			if(! CCP_INPT_ID_T.equals("")) {
%>
		 		CCP_INPT_ID='<%= CCP_INPT_ID_T%>'
<%
			}

			if(! CCP_INPT_DTT_T.equals("")) {
%>
		 		CCP_INPT_DTT='<%= CCP_INPT_DTT_T%>'
<%
			}

			if(! CCP_MODI_ID_T.equals("")) {
%>
		 		CCP_MODI_ID='<%= CCP_MODI_ID_T%>'
<%
			}

			if(! CCP_MODI_DTT_T.equals("")) {
%>
		 		CCP_MODI_DTT='<%= CCP_MODI_DTT_T%>'
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
