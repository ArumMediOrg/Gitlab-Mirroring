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

		String ASPACCODE = htMethod.get("ASPACCODE");
		String ASXRAYKD = htMethod.get("ASXRAYKD");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(ASPACCODE == null) { ASPACCODE = ""; }
		if(ASXRAYKD == null) { ASXRAYKD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

 SELECT *
  FROM (
         SELECT CCN_LARGE, SUBSTR(CCN_SMALL,1,2) PACK_CD,
                CASE WHEN  :asPacCode   = '01' THEN
                          CASE   :asXrayKd  WHEN '1' THEN 'F0003'
                                                 WHEN '2' THEN 'F0014'
                                                 WHEN '3' THEN 'F0001'
                                                 WHEN '4' THEN 'F0007'
                                                 ELSE 'F0014' END
                     ELSE SUBSTR(CCN_SMALL,3,5) END AS ITEM_CD,
                CCN_LEVEL, CCN_FULL_NM, CCN_USE_YN
           FROM CT_COMMON
          WHERE CCN_LARGE = '0423'
            AND CCN_LEVEL = '5'
       ) AA
  LEFT OUTER JOIN (
                    SELECT ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD, ERI_RSLT_VL, (ERI_RSLT_LOW ||' - '|| ERI_RSLT_HIGH) LH
                         , ERI_WOSB_PANJ, ERI_HERT_CD, ERI_VLDT_LH, IIM_SNME_NM, PFP_RESULTRD_1, PFP_RESULTRD_2
                      FROM ET_RSLT_ITEM A
                      LEFT OUTER JOIN IT_ITEM B
                        ON A.ERI_ITEM_CD=B.IIM_ITEM_CD
                      LEFT OUTER JOIN PT_FIR_PANJUNG C  ON A.ERI_EXAM_DT=c.PFP_EXAM_DT and a.ERI_EXAM_sq = c.PFP_EXAM_sq
                     WHERE ERI_EXAM_DT = :EXAM_DT
                       AND ERI_EXAM_SQ = :EXAM_SQ
                       AND NVL(ERI_RSLT_VL, ' ') <> ' '
                       AND (ERI_HTSB_PANJ NOT LIKE '%A%' OR ERI_HERT_CD IS NOT NULL)
                  ) BB
    ON AA.ITEM_CD = BB.ERI_ITEM_CD
 WHERE ERI_EXAM_DT IS NOT NULL  AND PACK_CD = :asPacCode                                                                                                                                                      
		*/

		sql = " SELECT *";
		sql += " FROM (";
		sql += "	SELECT CCN_LARGE, SUBSTR(CCN_SMALL,1,2) PACK_CD";
		sql += "	, CASE WHEN '" + ASPACCODE + "' = '01' THEN";
		sql += "		CASE '" + ASXRAYKD + "' WHEN '1' THEN 'F0003' WHEN '2' THEN 'F0014' WHEN '3' THEN 'F0001' WHEN '4' THEN 'F0007' ELSE 'F0014' END";
		sql += "	ELSE SUBSTR(CCN_SMALL,3,5) END AS ITEM_CD";
		sql += "	, CCN_LEVEL, CCN_FULL_NM, CCN_USE_YN";
		sql += " 	FROM CT_COMMON";
		sql += " 	WHERE CCN_LARGE = '0423'";
		sql += " 	AND CCN_LEVEL = '5'";
		sql += " ) AA LEFT OUTER JOIN (";
		sql += "	SELECT ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD, ERI_RSLT_VL, (ERI_RSLT_LOW ||' - '|| ERI_RSLT_HIGH) LH , ERI_WOSB_PANJ, ERI_HERT_CD, ERI_VLDT_LH, IIM_SNME_NM, PFP_RESULTRD_1, PFP_RESULTRD_2";
		sql += " 	FROM ET_RSLT_ITEM A LEFT OUTER JOIN IT_ITEM B";
		sql += "	ON A.ERI_ITEM_CD=B.IIM_ITEM_CD";
		sql += "	LEFT OUTER JOIN PT_FIR_PANJUNG C";
		sql += " 	ON A.ERI_EXAM_DT=C.PFP_EXAM_DT";
		sql += " 	AND A.ERI_EXAM_SQ = C.PFP_EXAM_SQ";
		sql += " 	WHERE ERI_EXAM_DT = '" + EXAM_DT + "'";
		sql += " 	AND ERI_EXAM_SQ = '" + EXAM_SQ + "'";
		sql += " 	AND NVL(ERI_RSLT_VL, ' ') <> ' '";
		sql += " 	AND (ERI_HTSB_PANJ NOT LIKE '%A%' OR ERI_HERT_CD IS NOT NULL)";
		sql += " ) BB";
		sql += " ON AA.ITEM_CD = BB.ERI_ITEM_CD";
		sql += " WHERE ERI_EXAM_DT IS NOT NULL";
		sql += " AND PACK_CD = '" + ASPACCODE + "'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uGen_Frst_Panj_upAutoPanNoExec_001 \n";
			G_INFO += "설명 : 노동부자동판정 (판정항목관련 조회) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " ASPACCODE : " + ASPACCODE + " \n";
			G_INFO += " ASXRAYKD : " + ASXRAYKD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
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
		<s:AttributeType name='CCN_LARGE' rs:number='1'>
			<s:datatype dt:type='string' dt:maxLength='4' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='PACK_CD' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4'/>
		</s:AttributeType>
		<s:AttributeType name='ITEM_CD' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_LEVEL' rs:number='4'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_FULL_NM' rs:number='5'>
			<s:datatype dt:type='string' dt:maxLength='300' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='CCN_USE_YN' rs:number='6'>
			<s:datatype dt:type='string' dt:maxLength='1' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXAM_DT' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_EXAM_SQ' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='6'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_ITEM_CD' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_RSLT_VL' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='50'/>
		</s:AttributeType>
		<s:AttributeType name='LH' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='43'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_WOSB_PANJ' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='30'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_HERT_CD' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2'/>
		</s:AttributeType>
		<s:AttributeType name='ERI_VLDT_LH' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='IIM_SNME_NM' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='200'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_1' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='PFP_RESULTRD_2' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String CCN_LARGE_T = cRsList.getString("CCN_LARGE");
			String PACK_CD_T = cRsList.getString("PACK_CD");
			String ITEM_CD_T = cRsList.getString("ITEM_CD");
			String CCN_LEVEL_T = cRsList.getString("CCN_LEVEL");
			String CCN_FULL_NM_T = cRsList.getString("CCN_FULL_NM");
			String CCN_USE_YN_T = cRsList.getString("CCN_USE_YN");
			String ERI_EXAM_DT_T = cRsList.getString("ERI_EXAM_DT");
			String ERI_EXAM_SQ_T = cRsList.getString("ERI_EXAM_SQ");
			String ERI_ITEM_CD_T = cRsList.getString("ERI_ITEM_CD");
			String ERI_RSLT_VL_T = cRsList.getString("ERI_RSLT_VL");
			String LH_T = cRsList.getString("LH");
			String ERI_WOSB_PANJ_T = cRsList.getString("ERI_WOSB_PANJ");
			String ERI_HERT_CD_T = cRsList.getString("ERI_HERT_CD");
			String ERI_VLDT_LH_T = cRsList.getString("ERI_VLDT_LH");
			String IIM_SNME_NM_T = cRsList.getString("IIM_SNME_NM");
			String PFP_RESULTRD_1_T = cRsList.getString("PFP_RESULTRD_1");
			String PFP_RESULTRD_2_T = cRsList.getString("PFP_RESULTRD_2");
%>
			<z:row
<%
			if(! CCN_LARGE_T.equals("")) {
%>
		 		CCN_LARGE='<%= CCN_LARGE_T%>'
<%
			}

			if(! PACK_CD_T.equals("")) {
%>
		 		PACK_CD='<%= PACK_CD_T%>'
<%
			}

			if(! ITEM_CD_T.equals("")) {
%>
		 		ITEM_CD='<%= ITEM_CD_T%>'
<%
			}

			if(! CCN_LEVEL_T.equals("")) {
%>
		 		CCN_LEVEL='<%= CCN_LEVEL_T%>'
<%
			}

			if(! CCN_FULL_NM_T.equals("")) {
%>
		 		CCN_FULL_NM='<%= CCN_FULL_NM_T%>'
<%
			}

			if(! CCN_USE_YN_T.equals("")) {
%>
		 		CCN_USE_YN='<%= CCN_USE_YN_T%>'
<%
			}

			if(! ERI_EXAM_DT_T.equals("")) {
%>
		 		ERI_EXAM_DT='<%= ERI_EXAM_DT_T%>'
<%
			}

			if(! ERI_EXAM_SQ_T.equals("")) {
%>
		 		ERI_EXAM_SQ='<%= ERI_EXAM_SQ_T%>'
<%
			}

			if(! ERI_ITEM_CD_T.equals("")) {
%>
		 		ERI_ITEM_CD='<%= ERI_ITEM_CD_T%>'
<%
			}

			if(! ERI_RSLT_VL_T.equals("")) {
%>
		 		ERI_RSLT_VL='<%= ERI_RSLT_VL_T%>'
<%
			}

			if(! LH_T.equals("")) {
%>
		 		LH='<%= LH_T%>'
<%
			}

			if(! ERI_WOSB_PANJ_T.equals("")) {
%>
		 		ERI_WOSB_PANJ='<%= ERI_WOSB_PANJ_T%>'
<%
			}

			if(! ERI_HERT_CD_T.equals("")) {
%>
		 		ERI_HERT_CD='<%= ERI_HERT_CD_T%>'
<%
			}

			if(! ERI_VLDT_LH_T.equals("")) {
%>
		 		ERI_VLDT_LH='<%= ERI_VLDT_LH_T%>'
<%
			}

			if(! IIM_SNME_NM_T.equals("")) {
%>
		 		IIM_SNME_NM='<%= IIM_SNME_NM_T%>'
<%
			}

			if(! PFP_RESULTRD_1_T.equals("")) {
%>
		 		PFP_RESULTRD_1='<%= PFP_RESULTRD_1_T%>'
<%
			}

			if(! PFP_RESULTRD_2_T.equals("")) {
%>
		 		PFP_RESULTRD_2='<%= PFP_RESULTRD_2_T%>'
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
