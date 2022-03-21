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

		String EMP_NO = htMethod.get("EMP_NO");
		String PENL_NM = htMethod.get("PENL_NM");
		String USE_YN = htMethod.get("USE_YN");
		String ORDER_BY = htMethod.get("ORDER_BY");

		//
		if(EMP_NO == null) { EMP_NO = ""; }
		if(PENL_NM == null) { PENL_NM = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(ORDER_BY == null) { ORDER_BY = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT IAU_EMP_NO,    IAU_PENL_NM,   IAU_DEPT_CD,   IAU_RETIR_DT, IAU_USE_YN,
       IAU_LICEN1_CD, IAU_LICEN1_NO, IAU_LICEN2_CD, IAU_LICEN2_NO,
       IAU_PLCE_CD,   IAU_SEND_CD,   IAU_DIVI_CD,         
       IAU_STOMA_DR,  IAU_COLON_DR,  IAU_LIVER_DR,    
       IAU_BAST_DR,   IAU_UTER_DR,   IAU_LUNG_DR,        
       IAU_CKUP_DR,   IAU_PATH_DR,   IAU_DECI_DR,   IAU_DPAN_DR,  IAU_COLL_DR
  FROM IT_AUTH_USER
 WHERE 1 = 1

if :EMP_NO <> '' then
   AND IAU_EMP_NO = :EMP_NO

if :PENL_NM <> '' then
   AND IIAU_PENL_NM = :PENL_NM

if :USE_YN <> '' then
   AND UPPER(IAU_USE_YN) = UPPER(:USE_YN)

if :ORDER_BY = '1') then
 ORDER BY IAU_PENL_NM
else
 ORDER BY  IAU_EMP_NO

		*/

		sql = " SELECT IAU_EMP_NO, IAU_PENL_NM, IAU_DEPT_CD, IAU_RETIR_DT, IAU_USE_YN, IAU_LICEN1_CD, IAU_LICEN1_NO, IAU_LICEN2_CD, IAU_LICEN2_NO, IAU_PLCE_CD, IAU_SEND_CD, IAU_DIVI_CD, IAU_STOMA_DR, IAU_COLON_DR, IAU_LIVER_DR, IAU_BAST_DR, IAU_UTER_DR, IAU_LUNG_DR, IAU_CKUP_DR, IAU_PATH_DR, IAU_DECI_DR, IAU_DPAN_DR, IAU_COLL_DR";
		sql += " FROM IT_AUTH_USER";
		sql += " WHERE 1 = 1";

		if(! EMP_NO.equals("")) {
			sql += " AND IAU_EMP_NO = '" + EMP_NO + "'";
		}
		if(! PENL_NM.equals("")) {
			sql += " AND IIAU_PENL_NM = '" + PENL_NM + "'";
		}
		if(! USE_YN.equals("")) {
			sql += " AND UPPER(IAU_USE_YN) = UPPER('" + USE_YN + "')";
		}

		if(ORDER_BY.equals("1")) {
			sql += " ORDER BY IAU_PENL_NM";
		} else {
			sql += " ORDER BY IAU_EMP_NO";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFM_AcptComm_GF_FindUser_001 \n";
			G_INFO += "설명 : 사용자 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EMP_NO : " + EMP_NO + " \n";
			G_INFO += " PENL_NM : " + PENL_NM + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " ORDER_BY : " + ORDER_BY + " \n";
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
		<s:AttributeType name='IAU_EMP_NO' rs:number='1' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_EMP_NO'>
			<s:datatype dt:type='string' dt:maxLength='20' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='2' rs:writeunknown='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='IAU_PENL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DEPT_CD' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DEPT_CD'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_RETIR_DT' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_RETIR_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_USE_YN' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_USE_YN'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_CD' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN1_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN1_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_CD' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_CD'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LICEN2_NO' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LICEN2_NO'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PLCE_CD' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PLCE_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_SEND_CD' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_SEND_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DIVI_CD' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DIVI_CD'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_STOMA_DR' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_STOMA_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_COLON_DR' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_COLON_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LIVER_DR' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LIVER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_BAST_DR' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_BAST_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_UTER_DR' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_UTER_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_LUNG_DR' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_LUNG_DR'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_CKUP_DR' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_CKUP_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PATH_DR' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_PATH_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DECI_DR' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DECI_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_DPAN_DR' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_DPAN_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_COLL_DR' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_AUTH_USER'
			 rs:basecolumn='IAU_COLL_DR'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='24' rs:rowid='true' rs:basetable='IT_AUTH_USER' rs:basecolumn='ROWID'
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

			String IAU_EMP_NO_T = cRsList.getString("IAU_EMP_NO");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String IAU_DEPT_CD_T = cRsList.getString("IAU_DEPT_CD");
			String IAU_RETIR_DT_T = cRsList.getString("IAU_RETIR_DT");
			String IAU_USE_YN_T = cRsList.getString("IAU_USE_YN");
			String IAU_LICEN1_CD_T = cRsList.getString("IAU_LICEN1_CD");
			String IAU_LICEN1_NO_T = cRsList.getString("IAU_LICEN1_NO");
			String IAU_LICEN2_CD_T = cRsList.getString("IAU_LICEN2_CD");
			String IAU_LICEN2_NO_T = cRsList.getString("IAU_LICEN2_NO");
			String IAU_PLCE_CD_T = cRsList.getString("IAU_PLCE_CD");
			String IAU_SEND_CD_T = cRsList.getString("IAU_SEND_CD");
			String IAU_DIVI_CD_T = cRsList.getString("IAU_DIVI_CD");
			String IAU_STOMA_DR_T = cRsList.getString("IAU_STOMA_DR");
			String IAU_COLON_DR_T = cRsList.getString("IAU_COLON_DR");
			String IAU_LIVER_DR_T = cRsList.getString("IAU_LIVER_DR");
			String IAU_BAST_DR_T = cRsList.getString("IAU_BAST_DR");
			String IAU_UTER_DR_T = cRsList.getString("IAU_UTER_DR");
			String IAU_LUNG_DR_T = cRsList.getString("IAU_LUNG_DR");
			String IAU_CKUP_DR_T = cRsList.getString("IAU_CKUP_DR");
			String IAU_PATH_DR_T = cRsList.getString("IAU_PATH_DR");
			String IAU_DECI_DR_T = cRsList.getString("IAU_DECI_DR");
			String IAU_DPAN_DR_T = cRsList.getString("IAU_DPAN_DR");
			String IAU_COLL_DR_T = cRsList.getString("IAU_COLL_DR");
			String ROWID_T = cRsList.getString("ROWID");
%>
			<z:row
<%
			if(! IAU_EMP_NO_T.equals("")) {
%>
		 		IAU_EMP_NO='<%= IAU_EMP_NO_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! IAU_DEPT_CD_T.equals("")) {
%>
		 		IAU_DEPT_CD='<%= IAU_DEPT_CD_T%>'
<%
			}

			if(! IAU_RETIR_DT_T.equals("")) {
%>
		 		IAU_RETIR_DT='<%= IAU_RETIR_DT_T%>'
<%
			}

			if(! IAU_USE_YN_T.equals("")) {
%>
		 		IAU_USE_YN='<%= IAU_USE_YN_T%>'
<%
			}

			if(! IAU_LICEN1_CD_T.equals("")) {
%>
		 		IAU_LICEN1_CD='<%= IAU_LICEN1_CD_T%>'
<%
			}

			if(! IAU_LICEN1_NO_T.equals("")) {
%>
		 		IAU_LICEN1_NO='<%= IAU_LICEN1_NO_T%>'
<%
			}

			if(! IAU_LICEN2_CD_T.equals("")) {
%>
		 		IAU_LICEN2_CD='<%= IAU_LICEN2_CD_T%>'
<%
			}

			if(! IAU_LICEN2_NO_T.equals("")) {
%>
		 		IAU_LICEN2_NO='<%= IAU_LICEN2_NO_T%>'
<%
			}

			if(! IAU_PLCE_CD_T.equals("")) {
%>
		 		IAU_PLCE_CD='<%= IAU_PLCE_CD_T%>'
<%
			}

			if(! IAU_SEND_CD_T.equals("")) {
%>
		 		IAU_SEND_CD='<%= IAU_SEND_CD_T%>'
<%
			}

			if(! IAU_DIVI_CD_T.equals("")) {
%>
		 		IAU_DIVI_CD='<%= IAU_DIVI_CD_T%>'
<%
			}

			if(! IAU_STOMA_DR_T.equals("")) {
%>
		 		IAU_STOMA_DR='<%= IAU_STOMA_DR_T%>'
<%
			}

			if(! IAU_COLON_DR_T.equals("")) {
%>
		 		IAU_COLON_DR='<%= IAU_COLON_DR_T%>'
<%
			}

			if(! IAU_LIVER_DR_T.equals("")) {
%>
		 		IAU_LIVER_DR='<%= IAU_LIVER_DR_T%>'
<%
			}

			if(! IAU_BAST_DR_T.equals("")) {
%>
		 		IAU_BAST_DR='<%= IAU_BAST_DR_T%>'
<%
			}

			if(! IAU_UTER_DR_T.equals("")) {
%>
		 		IAU_UTER_DR='<%= IAU_UTER_DR_T%>'
<%
			}

			if(! IAU_LUNG_DR_T.equals("")) {
%>
		 		IAU_LUNG_DR='<%= IAU_LUNG_DR_T%>'
<%
			}

			if(! IAU_CKUP_DR_T.equals("")) {
%>
		 		IAU_CKUP_DR='<%= IAU_CKUP_DR_T%>'
<%
			}

			if(! IAU_PATH_DR_T.equals("")) {
%>
		 		IAU_PATH_DR='<%= IAU_PATH_DR_T%>'
<%
			}

			if(! IAU_DECI_DR_T.equals("")) {
%>
		 		IAU_DECI_DR='<%= IAU_DECI_DR_T%>'
<%
			}

			if(! IAU_DPAN_DR_T.equals("")) {
%>
		 		IAU_DPAN_DR='<%= IAU_DPAN_DR_T%>'
<%
			}

			if(! IAU_COLL_DR_T.equals("")) {
%>
		 		IAU_COLL_DR='<%= IAU_COLL_DR_T%>'
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
