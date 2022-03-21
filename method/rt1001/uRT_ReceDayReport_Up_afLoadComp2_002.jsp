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

		String DP_FROMDT2 = htMethod.get("DP_FROMDT2");
		String DP_TODT2 = htMethod.get("DP_TODT2");

		//
		if(DP_FROMDT2 == null) { DP_FROMDT2 = ""; }
		if(DP_TODT2 == null) { DP_TODT2 = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select
    IAU_PENL_NM, RRM_MODI_ID,
    NVL(sum(cardpr),0) cardpr,
    NVL(sum(cashpr),0) cashpr,
    NVL(sum(bkbookpr),0) bkbookpr,
    NVL(sum(otherpr),0) otherpr ,
    NVL(sum(returnpr),0) returnpr ,
    sum(NVL(cardpr,0) + NVL(cashpr,0) + NVL(bkbookpr,0) + NVL(otherpr,0) - NVL(returnpr,0)) totpr
 from (
    select RRM_MODI_ID, IAU_PENL_NM, RRM_PAY_KD, RRM_RESER_PR,
       case when RRM_PAY_KD ='01' then (RRM_RESER_PR) end cardpr,
       case when RRM_PAY_KD IN ('02','03')  then (RRM_RESER_PR) end cashpr,
       case when RRM_PAY_KD IN ('04')  then (RRM_RESER_PR) end bkbookpr,
       case when RRM_PAY_KD  NOT IN ('01','02','03','04')  then (RRM_RESER_PR) end otherpr,
       RRM_RETURN_PR returnpr
    from RT_RECE_MEDICHK a left outer join IT_AUTH_USER  b on a.RRM_MODI_ID = b.IAU_EMP_NO
    where
       RRM_RECE_DT >= :dp_fromdt2 and RRM_RECE_DT <= :dp_todt2
       and RRM_OCCU_KD in ('10','73')
) a group by IAU_PENL_NM, RRM_MODI_ID

		*/

		sql = " SELECT IAU_PENL_NM, RRM_MODI_ID, NVL(SUM(CARDPR),0) CARDPR, NVL(SUM(CASHPR),0) CASHPR, NVL(SUM(BKBOOKPR),0) BKBOOKPR, NVL(SUM(OTHERPR),0) OTHERPR , NVL(SUM(RETURNPR),0) RETURNPR , SUM(NVL(CARDPR,0) + NVL(CASHPR,0) + NVL(BKBOOKPR,0) + NVL(OTHERPR,0) - NVL(RETURNPR,0)) TOTPR";
		sql += " FROM (";
		sql += "	SELECT RRM_MODI_ID, IAU_PENL_NM, RRM_PAY_KD, RRM_RESER_PR";
		sql += "	, CASE WHEN RRM_PAY_KD ='01' THEN (RRM_RESER_PR) END CARDPR";
		sql += "	, CASE WHEN RRM_PAY_KD IN ('02','03') THEN (RRM_RESER_PR) END CASHPR";
		sql += "	, CASE WHEN RRM_PAY_KD IN ('04') THEN (RRM_RESER_PR) END BKBOOKPR";
		sql += "	, CASE WHEN RRM_PAY_KD NOT IN ('01','02','03','04') THEN (RRM_RESER_PR) END OTHERPR";
		sql += "	, RRM_RETURN_PR RETURNPR";
		sql += " 	FROM RT_RECE_MEDICHK A LEFT OUTER JOIN IT_AUTH_USER B";
		sql += " 	ON A.RRM_MODI_ID = B.IAU_EMP_NO";
		sql += " 	WHERE RRM_RECE_DT >= '" + DP_FROMDT2 + "'";
		sql += " 	AND RRM_RECE_DT <= '" + DP_TODT2 + "'";
		sql += " 	AND RRM_OCCU_KD IN ('10','73')";
		sql += " ) A";
		sql += " GROUP BY IAU_PENL_NM, RRM_MODI_ID";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_ReceDayReport_Up_afLoadComp2_002 \n";
			G_INFO += "설명 : 수납방식별 금액정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DP_FROMDT2 : " + DP_FROMDT2 + " \n";
			G_INFO += " DP_TODT2 : " + DP_TODT2 + " \n";
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
		<s:AttributeType name='IAU_PENL_NM' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_MODI_ID' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='CARDPR' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CASHPR' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BKBOOKPR' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='OTHERPR' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RETURNPR' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TOTPR' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String RRM_MODI_ID_T = cRsList.getString("RRM_MODI_ID");
			String CARDPR_T = cRsList.getString("CARDPR");
			String CASHPR_T = cRsList.getString("CASHPR");
			String BKBOOKPR_T = cRsList.getString("BKBOOKPR");
			String OTHERPR_T = cRsList.getString("OTHERPR");
			String RETURNPR_T = cRsList.getString("RETURNPR");
			String TOTPR_T = cRsList.getString("TOTPR");
%>
			<z:row
<%
			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! RRM_MODI_ID_T.equals("")) {
%>
		 		RRM_MODI_ID='<%= RRM_MODI_ID_T%>'
<%
			}

			if(! CARDPR_T.equals("")) {
%>
		 		CARDPR='<%= CARDPR_T%>'
<%
			}

			if(! CASHPR_T.equals("")) {
%>
		 		CASHPR='<%= CASHPR_T%>'
<%
			}

			if(! BKBOOKPR_T.equals("")) {
%>
		 		BKBOOKPR='<%= BKBOOKPR_T%>'
<%
			}

			if(! OTHERPR_T.equals("")) {
%>
		 		OTHERPR='<%= OTHERPR_T%>'
<%
			}

			if(! RETURNPR_T.equals("")) {
%>
		 		RETURNPR='<%= RETURNPR_T%>'
<%
			}

			if(! TOTPR_T.equals("")) {
%>
		 		TOTPR='<%= TOTPR_T%>'
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
