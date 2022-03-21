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

		String DTEDTEEA_EXAM_SDT = htMethod.get("DTEDTEEA_EXAM_SDT");
		String DTEDTEEA_EXAM_EDT = htMethod.get("DTEDTEEA_EXAM_EDT");
		String MSKEDTEEA_COMP_CD = htMethod.get("MSKEDTEEA_COMP_CD");
		String CHKBOXMAIN = htMethod.get("CHKBOXMAIN");
		String INMSKEDTEEA_COMP_CD = htMethod.get("INMSKEDTEEA_COMP_CD");
		String CMBFAMYCD = htMethod.get("CMBFAMYCD");
		String RZCMBBOXPANJ = htMethod.get("RZCMBBOXPANJ");

		//
		if(DTEDTEEA_EXAM_SDT == null) { DTEDTEEA_EXAM_SDT = ""; }
		if(DTEDTEEA_EXAM_EDT == null) { DTEDTEEA_EXAM_EDT = ""; }
		if(MSKEDTEEA_COMP_CD == null) { MSKEDTEEA_COMP_CD = ""; }
		if(CHKBOXMAIN == null) { CHKBOXMAIN = ""; }
		if(INMSKEDTEEA_COMP_CD == null) { INMSKEDTEEA_COMP_CD = ""; }
		if(CMBFAMYCD == null) { CMBFAMYCD = ""; }
		if(RZCMBBOXPANJ == null) { RZCMBBOXPANJ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, 
        CASE WHEN A.EEA_SEX_CD IS NULL OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD  ELSE GetCOMMON_LvCdToNm('0411',A.EEA_SEX_CD,'5',1) END ICR_SEX_NM, 
        D.* 
FROM ET_EXAM_ACPT A INNER JOIN ET_EMOTIONAL_LABOR  D ON A.EEA_EXAM_DT = D.EEL_EXAM_DT AND A.EEA_EXAM_SQ = D.EEL_EXAM_SQ 
WHERE A.EEA_EXAM_DT >= :DTEdtEEA_EXAM_SDT
        AND A.EEA_EXAM_DT <= :DTEdtEEA_EXAM_EDT
        AND A.EEA_ORDER_YN <> 'C' 

if :MskEdtEEA_COMP_CD <> ' then
begin
        if :ChkBoxMain = 'Y' then 
                AND A.EEA_COMP_CD IN :inMskEdtEEA_COMP_CD
        else                       
                AND A.EEA_COMP_CD = ::MskEdtEEA_COMP_CD
end;

//본인여부
if :cmbFamyCd <> '00' then
        AND A.EEA_FAMY_CD = :cmbFamyCd

if :RzCmbBoxPANJ= '1' then
        AND D.EEL_PANJ_YN = 'Y'
else if :RzCmbBoxPANJ = '2' then
        AND D.EEL_PANJ_YN = 'N'
ORDER BY A.EEA_EXAM_DT 

		*/

		sql = " SELECT A.EEA_EXAM_DT, A.EEA_EXAM_SQ, F_COMP_FIND(A.EEA_COMP_CD) EEA_COMP_NM, CASE WHEN A.EEA_SEX_CD IS NULL OR A.EEA_SEX_CD = '' THEN A.EEA_SEX_CD ELSE GETCOMMON_LVCDTONM('0411',A.EEA_SEX_CD,'5',1) END ICR_SEX_NM, D.*";
		sql += " FROM ET_EXAM_ACPT A INNER JOIN ET_EMOTIONAL_LABOR D";
		sql += " ON A.EEA_EXAM_DT = D.EEL_EXAM_DT";
		sql += " AND A.EEA_EXAM_SQ = D.EEL_EXAM_SQ";
		sql += " WHERE A.EEA_EXAM_DT >= '" + DTEDTEEA_EXAM_SDT + "'";
		sql += " AND A.EEA_EXAM_DT <= '" + DTEDTEEA_EXAM_EDT + "'";
		sql += " AND A.EEA_ORDER_YN <> 'C'";

		if(!MSKEDTEEA_COMP_CD.equals("")) {
			if(CHKBOXMAIN.equals("Y")) {
				sql += " AND A.EEA_COMP_CD IN '" + INMSKEDTEEA_COMP_CD + "'";
			} else {
				sql += " AND A.EEA_COMP_CD = '" + MSKEDTEEA_COMP_CD + "'";
			}
		
		}
		
		if(!CMBFAMYCD.equals("00")) {
			sql += " AND A.EEA_FAMY_CD = '" + CMBFAMYCD + "'";		 
		}

		if(RZCMBBOXPANJ.equals("1")) {
			sql += " AND D.EEL_PANJ_YN = 'Y'";
		} else if(RZCMBBOXPANJ.equals("2")) {
			sql += " AND D.EEL_PANJ_YN = 'N'"; 
		}
		sql += " ORDER BY A.EEA_EXAM_DT";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uEmotional_Labor_Stats_SBtnQueryClick_001 \n";
			G_INFO += "설명 : 접수정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DTEDTEEA_EXAM_SDT : " + DTEDTEEA_EXAM_SDT + " \n";
			G_INFO += " DTEDTEEA_EXAM_EDT : " + DTEDTEEA_EXAM_EDT + " \n";
			G_INFO += " MSKEDTEEA_COMP_CD : " + MSKEDTEEA_COMP_CD + " \n";
			G_INFO += " CHKBOXMAIN : " + CHKBOXMAIN + " \n";
			G_INFO += " INMSKEDTEEA_COMP_CD : " + INMSKEDTEEA_COMP_CD + " \n";
			G_INFO += " CMBFAMYCD : " + CMBFAMYCD + " \n";
			G_INFO += " RZCMBBOXPANJ : " + RZCMBBOXPANJ + " \n";
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
		<s:AttributeType name='EEA_EXAM_DT' rs:number='1' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_DT' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_SQ' rs:number='2' rs:basetable='ET_EXAM_ACPT' rs:basecolumn='EEA_EXAM_SQ' rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_COMP_NM' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_SEX_NM' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_EXAM_DT' rs:number='5' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_EXAM_DT'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_EXAM_SQ' rs:number='6' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_EXAM_SQ'
			 rs:keycolumn='true'>
			<s:datatype dt:type='string' dt:maxLength='6' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_1VL' rs:number='7' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_1VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_2VL' rs:number='8' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_2VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_3VL' rs:number='9' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_3VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_4VL' rs:number='10' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_4VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_5VL' rs:number='11' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_5VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_6VL' rs:number='12' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_6VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_7VL' rs:number='13' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_7VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_8VL' rs:number='14' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_8VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_9VL' rs:number='15' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_9VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_10VL' rs:number='16' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_10VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_11VL' rs:number='17' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_11VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_12VL' rs:number='18' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_12VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_13VL' rs:number='19' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_13VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_14VL' rs:number='20' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_14VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_15VL' rs:number='21' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_15VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_16VL' rs:number='22' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_16VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_17VL' rs:number='23' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_17VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_18VL' rs:number='24' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_18VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_19VL' rs:number='25' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_19VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_20VL' rs:number='26' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_20VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_21VL' rs:number='27' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_21VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_22VL' rs:number='28' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_22VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_23VL' rs:number='29' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_23VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_QST1_24VL' rs:number='30' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_QST1_24VL'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_RST1_VL' rs:number='31' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_RST1_VL'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_RST2_VL' rs:number='32' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_RST2_VL'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_RST3_VL' rs:number='33' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_RST3_VL'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_RST4_VL' rs:number='34' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_RST4_VL'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_RST5_VL' rs:number='35' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_RST5_VL'>
			<s:datatype dt:type='string' dt:maxLength='5'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_RSLT_TX' rs:number='36' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_RSLT_TX'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_DOCT_CD' rs:number='37' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_DOCT_CD'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_PANJ_DT' rs:number='38' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_PANJ_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_PANJ_YN' rs:number='39' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_PANJ_YN'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_INPUT_ID' rs:number='40' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_INPUT_ID'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='EEL_INPUT_DTT' rs:number='41' rs:nullable='true' rs:basetable='ET_EMOTIONAL_LABOR' rs:basecolumn='EEL_INPUT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_EXAM_SQ_T = cRsList.getString("EEA_EXAM_SQ");
			String EEA_COMP_NM_T = cRsList.getString("EEA_COMP_NM");
			String ICR_SEX_NM_T = cRsList.getString("ICR_SEX_NM");
			String EEL_EXAM_DT_T = cRsList.getString("EEL_EXAM_DT");
			String EEL_EXAM_SQ_T = cRsList.getString("EEL_EXAM_SQ");
			String EEL_QST1_1VL_T = cRsList.getString("EEL_QST1_1VL");
			String EEL_QST1_2VL_T = cRsList.getString("EEL_QST1_2VL");
			String EEL_QST1_3VL_T = cRsList.getString("EEL_QST1_3VL");
			String EEL_QST1_4VL_T = cRsList.getString("EEL_QST1_4VL");
			String EEL_QST1_5VL_T = cRsList.getString("EEL_QST1_5VL");
			String EEL_QST1_6VL_T = cRsList.getString("EEL_QST1_6VL");
			String EEL_QST1_7VL_T = cRsList.getString("EEL_QST1_7VL");
			String EEL_QST1_8VL_T = cRsList.getString("EEL_QST1_8VL");
			String EEL_QST1_9VL_T = cRsList.getString("EEL_QST1_9VL");
			String EEL_QST1_10VL_T = cRsList.getString("EEL_QST1_10VL");
			String EEL_QST1_11VL_T = cRsList.getString("EEL_QST1_11VL");
			String EEL_QST1_12VL_T = cRsList.getString("EEL_QST1_12VL");
			String EEL_QST1_13VL_T = cRsList.getString("EEL_QST1_13VL");
			String EEL_QST1_14VL_T = cRsList.getString("EEL_QST1_14VL");
			String EEL_QST1_15VL_T = cRsList.getString("EEL_QST1_15VL");
			String EEL_QST1_16VL_T = cRsList.getString("EEL_QST1_16VL");
			String EEL_QST1_17VL_T = cRsList.getString("EEL_QST1_17VL");
			String EEL_QST1_18VL_T = cRsList.getString("EEL_QST1_18VL");
			String EEL_QST1_19VL_T = cRsList.getString("EEL_QST1_19VL");
			String EEL_QST1_20VL_T = cRsList.getString("EEL_QST1_20VL");
			String EEL_QST1_21VL_T = cRsList.getString("EEL_QST1_21VL");
			String EEL_QST1_22VL_T = cRsList.getString("EEL_QST1_22VL");
			String EEL_QST1_23VL_T = cRsList.getString("EEL_QST1_23VL");
			String EEL_QST1_24VL_T = cRsList.getString("EEL_QST1_24VL");
			String EEL_RST1_VL_T = cRsList.getString("EEL_RST1_VL");
			String EEL_RST2_VL_T = cRsList.getString("EEL_RST2_VL");
			String EEL_RST3_VL_T = cRsList.getString("EEL_RST3_VL");
			String EEL_RST4_VL_T = cRsList.getString("EEL_RST4_VL");
			String EEL_RST5_VL_T = cRsList.getString("EEL_RST5_VL");
			String EEL_RSLT_TX_T = cRsList.getString("EEL_RSLT_TX");
			String EEL_DOCT_CD_T = cRsList.getString("EEL_DOCT_CD");
			String EEL_PANJ_DT_T = cRsList.getString("EEL_PANJ_DT");
			String EEL_PANJ_YN_T = cRsList.getString("EEL_PANJ_YN");
			String EEL_INPUT_ID_T = cRsList.getString("EEL_INPUT_ID");
			String EEL_INPUT_DTT_T = cRsList.getDate2("EEL_INPUT_DTT");
%>
			<z:row
<%
			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_EXAM_SQ_T.equals("")) {
%>
		 		EEA_EXAM_SQ='<%= EEA_EXAM_SQ_T%>'
<%
			}

			if(! EEA_COMP_NM_T.equals("")) {
%>
		 		EEA_COMP_NM='<%= EEA_COMP_NM_T%>'
<%
			}

			if(! ICR_SEX_NM_T.equals("")) {
%>
		 		ICR_SEX_NM='<%= ICR_SEX_NM_T%>'
<%
			}

			if(! EEL_EXAM_DT_T.equals("")) {
%>
		 		EEL_EXAM_DT='<%= EEL_EXAM_DT_T%>'
<%
			}

			if(! EEL_EXAM_SQ_T.equals("")) {
%>
		 		EEL_EXAM_SQ='<%= EEL_EXAM_SQ_T%>'
<%
			}

			if(! EEL_QST1_1VL_T.equals("")) {
%>
		 		EEL_QST1_1VL='<%= EEL_QST1_1VL_T%>'
<%
			}

			if(! EEL_QST1_2VL_T.equals("")) {
%>
		 		EEL_QST1_2VL='<%= EEL_QST1_2VL_T%>'
<%
			}

			if(! EEL_QST1_3VL_T.equals("")) {
%>
		 		EEL_QST1_3VL='<%= EEL_QST1_3VL_T%>'
<%
			}

			if(! EEL_QST1_4VL_T.equals("")) {
%>
		 		EEL_QST1_4VL='<%= EEL_QST1_4VL_T%>'
<%
			}

			if(! EEL_QST1_5VL_T.equals("")) {
%>
		 		EEL_QST1_5VL='<%= EEL_QST1_5VL_T%>'
<%
			}

			if(! EEL_QST1_6VL_T.equals("")) {
%>
		 		EEL_QST1_6VL='<%= EEL_QST1_6VL_T%>'
<%
			}

			if(! EEL_QST1_7VL_T.equals("")) {
%>
		 		EEL_QST1_7VL='<%= EEL_QST1_7VL_T%>'
<%
			}

			if(! EEL_QST1_8VL_T.equals("")) {
%>
		 		EEL_QST1_8VL='<%= EEL_QST1_8VL_T%>'
<%
			}

			if(! EEL_QST1_9VL_T.equals("")) {
%>
		 		EEL_QST1_9VL='<%= EEL_QST1_9VL_T%>'
<%
			}

			if(! EEL_QST1_10VL_T.equals("")) {
%>
		 		EEL_QST1_10VL='<%= EEL_QST1_10VL_T%>'
<%
			}

			if(! EEL_QST1_11VL_T.equals("")) {
%>
		 		EEL_QST1_11VL='<%= EEL_QST1_11VL_T%>'
<%
			}

			if(! EEL_QST1_12VL_T.equals("")) {
%>
		 		EEL_QST1_12VL='<%= EEL_QST1_12VL_T%>'
<%
			}

			if(! EEL_QST1_13VL_T.equals("")) {
%>
		 		EEL_QST1_13VL='<%= EEL_QST1_13VL_T%>'
<%
			}

			if(! EEL_QST1_14VL_T.equals("")) {
%>
		 		EEL_QST1_14VL='<%= EEL_QST1_14VL_T%>'
<%
			}

			if(! EEL_QST1_15VL_T.equals("")) {
%>
		 		EEL_QST1_15VL='<%= EEL_QST1_15VL_T%>'
<%
			}

			if(! EEL_QST1_16VL_T.equals("")) {
%>
		 		EEL_QST1_16VL='<%= EEL_QST1_16VL_T%>'
<%
			}

			if(! EEL_QST1_17VL_T.equals("")) {
%>
		 		EEL_QST1_17VL='<%= EEL_QST1_17VL_T%>'
<%
			}

			if(! EEL_QST1_18VL_T.equals("")) {
%>
		 		EEL_QST1_18VL='<%= EEL_QST1_18VL_T%>'
<%
			}

			if(! EEL_QST1_19VL_T.equals("")) {
%>
		 		EEL_QST1_19VL='<%= EEL_QST1_19VL_T%>'
<%
			}

			if(! EEL_QST1_20VL_T.equals("")) {
%>
		 		EEL_QST1_20VL='<%= EEL_QST1_20VL_T%>'
<%
			}

			if(! EEL_QST1_21VL_T.equals("")) {
%>
		 		EEL_QST1_21VL='<%= EEL_QST1_21VL_T%>'
<%
			}

			if(! EEL_QST1_22VL_T.equals("")) {
%>
		 		EEL_QST1_22VL='<%= EEL_QST1_22VL_T%>'
<%
			}

			if(! EEL_QST1_23VL_T.equals("")) {
%>
		 		EEL_QST1_23VL='<%= EEL_QST1_23VL_T%>'
<%
			}

			if(! EEL_QST1_24VL_T.equals("")) {
%>
		 		EEL_QST1_24VL='<%= EEL_QST1_24VL_T%>'
<%
			}

			if(! EEL_RST1_VL_T.equals("")) {
%>
		 		EEL_RST1_VL='<%= EEL_RST1_VL_T%>'
<%
			}

			if(! EEL_RST2_VL_T.equals("")) {
%>
		 		EEL_RST2_VL='<%= EEL_RST2_VL_T%>'
<%
			}

			if(! EEL_RST3_VL_T.equals("")) {
%>
		 		EEL_RST3_VL='<%= EEL_RST3_VL_T%>'
<%
			}

			if(! EEL_RST4_VL_T.equals("")) {
%>
		 		EEL_RST4_VL='<%= EEL_RST4_VL_T%>'
<%
			}

			if(! EEL_RST5_VL_T.equals("")) {
%>
		 		EEL_RST5_VL='<%= EEL_RST5_VL_T%>'
<%
			}

			if(! EEL_RSLT_TX_T.equals("")) {
%>
		 		EEL_RSLT_TX='<%= EEL_RSLT_TX_T%>'
<%
			}

			if(! EEL_DOCT_CD_T.equals("")) {
%>
		 		EEL_DOCT_CD='<%= EEL_DOCT_CD_T%>'
<%
			}

			if(! EEL_PANJ_DT_T.equals("")) {
%>
		 		EEL_PANJ_DT='<%= EEL_PANJ_DT_T%>'
<%
			}

			if(! EEL_PANJ_YN_T.equals("")) {
%>
		 		EEL_PANJ_YN='<%= EEL_PANJ_YN_T%>'
<%
			}

			if(! EEL_INPUT_ID_T.equals("")) {
%>
		 		EEL_INPUT_ID='<%= EEL_INPUT_ID_T%>'
<%
			}

			if(! EEL_INPUT_DTT_T.equals("")) {
%>
		 		EEL_INPUT_DTT='<%= EEL_INPUT_DTT_T%>'
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
