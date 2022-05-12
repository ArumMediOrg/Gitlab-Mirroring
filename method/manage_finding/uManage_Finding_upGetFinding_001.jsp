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

		String EDTIFG_TITLE_NM_S = htMethod.get("EDTIFG_TITLE_NM_S");
		String EDTIFG_RSLT_EX_S = htMethod.get("EDTIFG_RSLT_EX_S");
		String EDTIFG_RSLT_CD_S = htMethod.get("EDTIFG_RSLT_CD_S");
		String EDTIFG_ITEM_CD_S = htMethod.get("EDTIFG_ITEM_CD_S");
		String CMBIFG_PART_CD_S1 = htMethod.get("CMBIFG_PART_CD_S1");
		String CMBIFG_PART_CD_S2 = htMethod.get("CMBIFG_PART_CD_S2");
		String CMBIFG_SUB_CD_S = htMethod.get("CMBIFG_SUB_CD_S");
		String CMBIFG_SUB2_CD_S1 = htMethod.get("CMBIFG_SUB2_CD_S1");
		String CMBIFG_SUB2_CD_S2 = htMethod.get("CMBIFG_SUB2_CD_S2");
		String RDGIFG_USE_YN_S = htMethod.get("RDGIFG_USE_YN_S");
		String RDGIFG_COMM_YN_S = htMethod.get("RDGIFG_COMM_YN_S");

		//
		if(EDTIFG_TITLE_NM_S == null) { EDTIFG_TITLE_NM_S = ""; }
		if(EDTIFG_RSLT_EX_S == null) { EDTIFG_RSLT_EX_S = ""; }
		if(EDTIFG_RSLT_CD_S == null) { EDTIFG_RSLT_CD_S = ""; }
		if(EDTIFG_ITEM_CD_S == null) { EDTIFG_ITEM_CD_S = ""; }
		if(CMBIFG_PART_CD_S1 == null) { CMBIFG_PART_CD_S1 = ""; }
		if(CMBIFG_PART_CD_S2 == null) { CMBIFG_PART_CD_S2 = ""; }
		if(CMBIFG_SUB_CD_S == null) { CMBIFG_SUB_CD_S = ""; }
		if(CMBIFG_SUB2_CD_S1 == null) { CMBIFG_SUB2_CD_S1 = ""; }
		if(CMBIFG_SUB2_CD_S2 == null) { CMBIFG_SUB2_CD_S2 = ""; }
		if(RDGIFG_USE_YN_S == null) { RDGIFG_USE_YN_S = ""; }
		if(RDGIFG_COMM_YN_S == null) { RDGIFG_COMM_YN_S = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IFG_RSLT_CD,    IFG_TITLE_NM,  IFG_RSLT_EX,   IFG_ERSLT_EX,  IFG_CRSLT_EX,  IFG_RRSLT_EX,
       IFG_JRSLT_EX,   IFG_ITEM_CD1,  IFG_ITEM_CD2,  IFG_ITEM_CD3,  IFG_ITEM_CD4,
       IFG_PART_CD,    IFG_SUB_CD,    IFG_USE_YN,    IFG_COMM_YN,   IFG_SUB2_CD,
       IFG_RSLT_PANJ,  IFG_NUSE_ID,   IFG_NUSE_DTT,  IFG_INPT_DTT,  IFG_INPT_ID,
       IFG_MODI_DTT,   IFG_MODI_ID
FROM IT_FINDING
WHERE 0=0
if :edtIfg_Title_Nm_S <> '' then
      and IFG_TITLE_NM LIKE '%' || :edtIfg_Title_Nm_S || '%'

if :edtIfg_Rslt_Ex_S <> '' then
      and IFG_RSLT_EX LIKE '%' || :edtIfg_Rslt_Ex_S || '%'

if :edtIfg_Rslt_Cd_S <> '' then
      and IFG_RSLT_CD = :edtIfg_Rslt_Cd_S

if :edtIfg_Item_Cd_S <> '' then
begin
      and ( (IFG_ITEM_CD1 = :edtIfg_Item_Cd_S)
           or (IFG_ITEM_CD2 = :edtIfg_Item_Cd_S)
           or (IFG_ITEM_CD3 = :edtIfg_Item_Cd_S)
           or (IFG_ITEM_CD4 = :edtIfg_Item_Cd_S) )
end;

if :cmbIfg_Part_Cd_S1 <> '' then
      and (IFG_PART_CD = :cmbIfg_Part_Cd_S2)

if :cmbIfg_Sub_Cd_S <> '' then
      and (IFG_SUB_CD = :cmbIfg_Sub_Cd_S)

if :cmbIfg_Sub2_Cd_S1 <> '' then
      and (IFG_SUB2_CD = :cmbIfg_Sub2_Cd_S2)

if :rdgIfg_Use_Yn_S = '1' then
      and (IFG_USE_YN = 'Y')
else if :rdgIfg_Use_Yn_S = '2' then
      and (IFG_USE_YN = 'N')

if :rdgIfg_Comm_Yn_S = '1' then
      and (IFG_COMM_YN = 'Y')

order by IFG_RSLT_CD
		*/

		sql = " SELECT IFG_RSLT_CD, IFG_TITLE_NM, IFG_RSLT_EX, IFG_ERSLT_EX, IFG_CRSLT_EX, IFG_RRSLT_EX, IFG_JRSLT_EX, IFG_ITEM_CD1, IFG_ITEM_CD2, IFG_ITEM_CD3, IFG_ITEM_CD4, IFG_PART_CD, IFG_SUB_CD, IFG_USE_YN, IFG_COMM_YN, IFG_SUB2_CD, IFG_RSLT_PANJ, IFG_NUSE_ID, IFG_NUSE_DTT, IFG_INPT_DTT, IFG_INPT_ID, IFG_MODI_DTT, IFG_MODI_ID";
		sql += " FROM IT_FINDING";
		sql += " WHERE 0=0";

		if(!EDTIFG_TITLE_NM_S.equals("")) {
			sql += " AND IFG_TITLE_NM LIKE '%' || '" + EDTIFG_TITLE_NM_S + "' || '%'";
		}

		if(!EDTIFG_RSLT_EX_S.equals("")) {
			sql += " AND IFG_RSLT_EX LIKE '%' || '" + EDTIFG_RSLT_EX_S + "' || '%'";
		}

		if(!EDTIFG_RSLT_CD_S.equals("")) {
			sql += " AND IFG_RSLT_CD LIKE '%' || '" + EDTIFG_RSLT_CD_S + "' || '%'";
		}

		if(!EDTIFG_ITEM_CD_S.equals("")) {
			sql += " AND (";
			sql += "	(IFG_ITEM_CD1 = '" + EDTIFG_ITEM_CD_S + "')";
			sql += " 	OR (IFG_ITEM_CD2 = '" + EDTIFG_ITEM_CD_S + "')";
			sql += " 	OR (IFG_ITEM_CD3 = '" + EDTIFG_ITEM_CD_S + "')";
			sql += " 	OR (IFG_ITEM_CD4 = '" + EDTIFG_ITEM_CD_S + "')";
			sql += ")";
		}

		if(!CMBIFG_PART_CD_S1.equals("")) {
			sql += " AND (IFG_PART_CD = '" + CMBIFG_PART_CD_S2 + "')";
		}

		if(!CMBIFG_SUB_CD_S.equals("")) {
			sql += " AND (IFG_SUB_CD = '" + CMBIFG_SUB_CD_S + "')";
		}

		if(!CMBIFG_SUB2_CD_S1.equals("")) {
			sql += " AND (IFG_SUB2_CD = '" + CMBIFG_SUB2_CD_S2 + "')";
		}


		if(RDGIFG_USE_YN_S.equals("1")) {
			sql += " AND (IFG_USE_YN = 'Y')";
		}
		else if(RDGIFG_USE_YN_S.equals("2")) {
			sql += " AND (IFG_USE_YN = 'N')";
		}

		if(RDGIFG_COMM_YN_S.equals("1")) {
			sql += " AND (IFG_COMM_YN = 'Y')";
		}

		sql += " ORDER BY IFG_RSLT_CD";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uManage_Finding_upGetFinding_001 \n";
			G_INFO += "설명 : 소견 정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EDTIFG_TITLE_NM_S : " + EDTIFG_TITLE_NM_S + " \n";
			G_INFO += " EDTIFG_RSLT_EX_S : " + EDTIFG_RSLT_EX_S + " \n";
			G_INFO += " EDTIFG_RSLT_CD_S : " + EDTIFG_RSLT_CD_S + " \n";
			G_INFO += " EDTIFG_ITEM_CD_S : " + EDTIFG_ITEM_CD_S + " \n";
			G_INFO += " CMBIFG_PART_CD_S1 : " + CMBIFG_PART_CD_S1 + " \n";
			G_INFO += " CMBIFG_PART_CD_S2 : " + CMBIFG_PART_CD_S2 + " \n";
			G_INFO += " CMBIFG_SUB_CD_S : " + CMBIFG_SUB_CD_S + " \n";
			G_INFO += " CMBIFG_SUB2_CD_S1 : " + CMBIFG_SUB2_CD_S1 + " \n";
			G_INFO += " CMBIFG_SUB2_CD_S2 : " + CMBIFG_SUB2_CD_S2 + " \n";
			G_INFO += " RDGIFG_USE_YN_S : " + RDGIFG_USE_YN_S + " \n";
			G_INFO += " RDGIFG_COMM_YN_S : " + RDGIFG_COMM_YN_S + " \n";
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
		<s:AttributeType name='IFG_RSLT_CD' rs:number='1' rs:writeunknown='true' rs:basetable='IT_FINDING' rs:basecolumn='IFG_RSLT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_TITLE_NM' rs:number='2' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_TITLE_NM'>
			<s:datatype dt:type='string' dt:maxLength='600'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_RSLT_EX' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_RSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_ERSLT_EX' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_ERSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_CRSLT_EX' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_CRSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_RRSLT_EX' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_RRSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_JRSLT_EX' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_JRSLT_EX'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_ITEM_CD1' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_ITEM_CD1'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_ITEM_CD2' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_ITEM_CD2'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_ITEM_CD3' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_ITEM_CD3'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_ITEM_CD4' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_ITEM_CD4'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_PART_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_PART_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_SUB_CD' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_SUB_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_USE_YN' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_COMM_YN' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_COMM_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_SUB2_CD' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_SUB2_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_RSLT_PANJ' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_RSLT_PANJ'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_NUSE_ID' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_NUSE_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_NUSE_DTT' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_NUSE_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_INPT_DTT' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_INPT_ID' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_INPT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_MODI_DTT' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_MODI_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='IFG_MODI_ID' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_FINDING'
			 rs:basecolumn='IFG_MODI_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='24' rs:rowid='true' rs:basetable='IT_FINDING' rs:basecolumn='ROWID'
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

			String IFG_RSLT_CD_T = cRsList.getString("IFG_RSLT_CD");
			String IFG_TITLE_NM_T = cRsList.getString("IFG_TITLE_NM");
			String IFG_RSLT_EX_T = cRsList.getString("IFG_RSLT_EX");
			String IFG_ERSLT_EX_T = cRsList.getString("IFG_ERSLT_EX");
			String IFG_CRSLT_EX_T = cRsList.getString("IFG_CRSLT_EX");
			String IFG_RRSLT_EX_T = cRsList.getString("IFG_RRSLT_EX");
			String IFG_JRSLT_EX_T = cRsList.getString("IFG_JRSLT_EX");
			String IFG_ITEM_CD1_T = cRsList.getString("IFG_ITEM_CD1");
			String IFG_ITEM_CD2_T = cRsList.getString("IFG_ITEM_CD2");
			String IFG_ITEM_CD3_T = cRsList.getString("IFG_ITEM_CD3");
			String IFG_ITEM_CD4_T = cRsList.getString("IFG_ITEM_CD4");
			String IFG_PART_CD_T = cRsList.getString("IFG_PART_CD");
			String IFG_SUB_CD_T = cRsList.getString("IFG_SUB_CD");
			String IFG_USE_YN_T = cRsList.getString("IFG_USE_YN");
			String IFG_COMM_YN_T = cRsList.getString("IFG_COMM_YN");
			String IFG_SUB2_CD_T = cRsList.getString("IFG_SUB2_CD");
			String IFG_RSLT_PANJ_T = cRsList.getString("IFG_RSLT_PANJ");
			String IFG_NUSE_ID_T = cRsList.getString("IFG_NUSE_ID");
			String IFG_NUSE_DTT_T = cRsList.getDate2("IFG_NUSE_DTT");
			String IFG_INPT_DTT_T = cRsList.getDate2("IFG_INPT_DTT");
			String IFG_INPT_ID_T = cRsList.getString("IFG_INPT_ID");
			String IFG_MODI_DTT_T = cRsList.getDate2("IFG_MODI_DTT");
			String IFG_MODI_ID_T = cRsList.getString("IFG_MODI_ID");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IFG_RSLT_CD_T.equals("")) {
%>
		 		IFG_RSLT_CD='<%= IFG_RSLT_CD_T%>'
<%
			}

			if(! IFG_TITLE_NM_T.equals("")) {
%>
		 		IFG_TITLE_NM='<%= IFG_TITLE_NM_T%>'
<%
			}

			if(! IFG_RSLT_EX_T.equals("")) {
%>
		 		IFG_RSLT_EX='<%= IFG_RSLT_EX_T%>'
<%
			}

			if(! IFG_ERSLT_EX_T.equals("")) {
%>
		 		IFG_ERSLT_EX='<%= IFG_ERSLT_EX_T%>'
<%
			}

			if(! IFG_CRSLT_EX_T.equals("")) {
%>
		 		IFG_CRSLT_EX='<%= IFG_CRSLT_EX_T%>'
<%
			}

			if(! IFG_RRSLT_EX_T.equals("")) {
%>
		 		IFG_RRSLT_EX='<%= IFG_RRSLT_EX_T%>'
<%
			}

			if(! IFG_JRSLT_EX_T.equals("")) {
%>
		 		IFG_JRSLT_EX='<%= IFG_JRSLT_EX_T%>'
<%
			}

			if(! IFG_ITEM_CD1_T.equals("")) {
%>
		 		IFG_ITEM_CD1='<%= IFG_ITEM_CD1_T%>'
<%
			}

			if(! IFG_ITEM_CD2_T.equals("")) {
%>
		 		IFG_ITEM_CD2='<%= IFG_ITEM_CD2_T%>'
<%
			}

			if(! IFG_ITEM_CD3_T.equals("")) {
%>
		 		IFG_ITEM_CD3='<%= IFG_ITEM_CD3_T%>'
<%
			}

			if(! IFG_ITEM_CD4_T.equals("")) {
%>
		 		IFG_ITEM_CD4='<%= IFG_ITEM_CD4_T%>'
<%
			}

			if(! IFG_PART_CD_T.equals("")) {
%>
		 		IFG_PART_CD='<%= IFG_PART_CD_T%>'
<%
			}

			if(! IFG_SUB_CD_T.equals("")) {
%>
		 		IFG_SUB_CD='<%= IFG_SUB_CD_T%>'
<%
			}

			if(! IFG_USE_YN_T.equals("")) {
%>
		 		IFG_USE_YN='<%= IFG_USE_YN_T%>'
<%
			}

			if(! IFG_COMM_YN_T.equals("")) {
%>
		 		IFG_COMM_YN='<%= IFG_COMM_YN_T%>'
<%
			}

			if(! IFG_SUB2_CD_T.equals("")) {
%>
		 		IFG_SUB2_CD='<%= IFG_SUB2_CD_T%>'
<%
			}

			if(! IFG_RSLT_PANJ_T.equals("")) {
%>
		 		IFG_RSLT_PANJ='<%= IFG_RSLT_PANJ_T%>'
<%
			}

			if(! IFG_NUSE_ID_T.equals("")) {
%>
		 		IFG_NUSE_ID='<%= IFG_NUSE_ID_T%>'
<%
			}

			if(! IFG_NUSE_DTT_T.equals("")) {
%>
		 		IFG_NUSE_DTT='<%= IFG_NUSE_DTT_T%>'
<%
			}

			if(! IFG_INPT_DTT_T.equals("")) {
%>
		 		IFG_INPT_DTT='<%= IFG_INPT_DTT_T%>'
<%
			}

			if(! IFG_INPT_ID_T.equals("")) {
%>
		 		IFG_INPT_ID='<%= IFG_INPT_ID_T%>'
<%
			}

			if(! IFG_MODI_DTT_T.equals("")) {
%>
		 		IFG_MODI_DTT='<%= IFG_MODI_DTT_T%>'
<%
			}

			if(! IFG_MODI_ID_T.equals("")) {
%>
		 		IFG_MODI_ID='<%= IFG_MODI_ID_T%>'
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
