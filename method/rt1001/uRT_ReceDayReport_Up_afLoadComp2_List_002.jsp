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
		String AVSG2 = htMethod.get("AVSG2");
		String MODI_ID = htMethod.get("MODI_ID");

		//
		if(DP_FROMDT2 == null) { DP_FROMDT2 = ""; }
		if(DP_TODT2 == null) { DP_TODT2 = ""; }
		if(AVSG2 == null) { AVSG2 = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select
  RRM_MODI_ID, IAU_PENL_NM, EEA_EXAM_DT, EEA_CHART_NO , EEA_PSNL_NM,
  ICR_BIRH_DT, EEA_EXAM_NM, RRM_OCCU_NM, RRM_RECE_DT ,
  NVL(cardpr,0) cardpr,
  NVL(cashpr,0) cashpr,
  NVL(bkbookpr,0) bkbookpr,
  NVL(otherpr,0)  otherpr,
  NVL(returnpr,0) returnpr,
  NVL(totpr,0) totpr,
  RRM_INPUT_DTT,
  RRM_ISSUE_NM
from
  (select
     RRM_MODI_ID,
     IAU_PENL_NM,
     RRT_EXAM_DT EEA_EXAM_DT,
            '' EEA_CHART_NO,
            RRT_PSNL_NM EEA_PSNL_NM,
            ICR_BIRH_DT,
            (select CCN_FULL_NM from CT_COMMON where CCN_LARGE = '0401' and CCN_SMALL = c.RRT_EXAM_CD)  EEA_EXAM_NM,
            (select CCN_FULL_NM from CT_COMMON where CCN_LARGE = '0925' and CCN_SMALL = a.RRM_OCCU_KD)  RRM_OCCU_NM,
            RRM_RECE_DT,
     case when RRM_PAY_KD ='01' then (NVL(RRM_RESER_PR,0)) end cardpr,
     case when RRM_PAY_KD IN ('02','03')  then (NVL(RRM_RESER_PR,0)) end cashpr,
     case when RRM_PAY_KD IN ('04')  then (NVL(RRM_RESER_PR,0)) end bkbookpr,
     case when RRM_PAY_KD  NOT IN ('01','02','03','04')  then (NVL(RRM_RESER_PR,0)) end otherpr,
     RRM_RETURN_PR returnpr,
            (NVL(RRM_RESER_PR,0) - NVL(RRM_RETURN_PR,0)) totpr,
     TO_CHAR(RRM_INPUT_DTT, 'YYYY-MM-DD HH24:MI:SS') RRM_INPUT_DTT,
     NVL((SELECT CCN_FULL_NM
             FROM CT_COMMON
             WHERE A.RRM_ISSUE_CD=CCN_SMALL
               AND CCN_LARGE='0923' ),'') || NVL(RRM_CARD_NM,'') RRM_ISSUE_NM
   from RT_RECE_MEDICHK a left outer join IT_AUTH_USER  b on a.RRM_MODI_ID = b.IAU_EMP_NO
                          left outer join RT_RSVT  c on a.RRM_RECE_NO = c.RRT_RSVN_NO
                                                               left outer join IT_CUSTOMER   d on c.RRT_CUST_NO = d.ICR_CUST_NO
   where
          RRM_RECE_DT >= :dp_fromdt2 and RRM_RECE_DT <= :dp_todt2
      and RRM_OCCU_KD in ('10','73')
if :avsg2 <> '합계'  then
begin
      and RRM_MODI_ID = :MODI_ID
end;
  ) aa order by  EEA_PSNL_NM

		*/

		sql = " SELECT RRM_MODI_ID, IAU_PENL_NM, EEA_EXAM_DT, EEA_CHART_NO , EEA_PSNL_NM, ICR_BIRH_DT, EEA_EXAM_NM, RRM_OCCU_NM, RRM_RECE_DT , NVL(CARDPR,0) CARDPR, NVL(CASHPR,0) CASHPR, NVL(BKBOOKPR,0) BKBOOKPR, NVL(OTHERPR,0) OTHERPR, NVL(RETURNPR,0) RETURNPR, NVL(TOTPR,0) TOTPR, RRM_INPUT_DTT, RRM_ISSUE_NM";
		sql += " FROM (";
		sql += "	SELECT RRM_MODI_ID, IAU_PENL_NM, RRT_EXAM_DT EEA_EXAM_DT, '' EEA_CHART_NO, RRT_PSNL_NM EEA_PSNL_NM, ICR_BIRH_DT";

		sql += "	, (";
		sql += "		SELECT CCN_FULL_NM";
		sql += " 		FROM CT_COMMON";
		sql += " 		WHERE CCN_LARGE = '0401'";
		sql += " 		AND CCN_SMALL = C.RRT_EXAM_CD";
		sql += "	) EEA_EXAM_NM";

		sql += "	, (";
		sql += "		SELECT CCN_FULL_NM";
		sql += " 		FROM CT_COMMON";
		sql += " 		WHERE CCN_LARGE = '0925'";
		sql += " 		AND CCN_SMALL = A.RRM_OCCU_KD";
		sql += "	) RRM_OCCU_NM";

		sql += "	, RRM_RECE_DT";
		sql += "	, CASE WHEN RRM_PAY_KD ='01' THEN (NVL(RRM_RESER_PR,0)) END CARDPR";
		sql += "	, CASE WHEN RRM_PAY_KD IN ('02','03') THEN (NVL(RRM_RESER_PR,0)) END CASHPR";
		sql += "	, CASE WHEN RRM_PAY_KD IN ('04') THEN (NVL(RRM_RESER_PR,0)) END BKBOOKPR";
		sql += "	, CASE WHEN RRM_PAY_KD NOT IN ('01','02','03','04') THEN (NVL(RRM_RESER_PR,0)) END OTHERPR";
		sql += "	, RRM_RETURN_PR RETURNPR, (NVL(RRM_RESER_PR,0) - NVL(RRM_RETURN_PR,0)) TOTPR, TO_CHAR(RRM_INPUT_DTT, 'YYYY-MM-DD HH24:MI:SS') RRM_INPUT_DTT";
		sql += "	, NVL(";
		sql += "		(";
		sql += "			SELECT CCN_FULL_NM";
		sql += " 			FROM CT_COMMON";
		sql += " 			WHERE A.RRM_ISSUE_CD=CCN_SMALL";
		sql += " 			AND CCN_LARGE='0923'";
		sql += "		),'') || NVL(RRM_CARD_NM,'') RRM_ISSUE_NM";
		sql += " 	FROM RT_RECE_MEDICHK A LEFT OUTER JOIN IT_AUTH_USER B";
		sql += " 	ON A.RRM_MODI_ID = B.IAU_EMP_NO LEFT OUTER JOIN RT_RSVT C";
		sql += " 	ON A.RRM_RECE_NO = C.RRT_RSVN_NO LEFT OUTER JOIN IT_CUSTOMER D";
		sql += " 	ON C.RRT_CUST_NO = D.ICR_CUST_NO";
		sql += " 	WHERE RRM_RECE_DT >= '" + DP_FROMDT2 + "'";
		sql += " 	AND RRM_RECE_DT <= '" + DP_TODT2 + "'";
		sql += " 	AND RRM_OCCU_KD IN ('10','73')";

		if(!AVSG2.equals("합계")) {
			sql += " 	AND RRM_MODI_ID = '" + MODI_ID + "'";
		}

		sql += " ) AA";
		sql += " ORDER BY EEA_PSNL_NM";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRT_ReceDayReport_Up_afLoadComp2_List_002 \n";
			G_INFO += "설명 : 예약금수납정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " DP_FROMDT2 : " + DP_FROMDT2 + " \n";
			G_INFO += " DP_TODT2 : " + DP_TODT2 + " \n";
			G_INFO += " AVSG2 : " + AVSG2 + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
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
		<s:AttributeType name='RRM_MODI_ID' rs:number='1' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='20'/>
		</s:AttributeType>
		<s:AttributeType name='IAU_PENL_NM' rs:number='2' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_DT' rs:number='3' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_CHART_NO' rs:number='4' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='2' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_PSNL_NM' rs:number='5' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='100'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='6' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='EEA_EXAM_NM' rs:number='7' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_OCCU_NM' rs:number='8' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='300'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_RECE_DT' rs:number='9' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='CARDPR' rs:number='10' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CASHPR' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='BKBOOKPR' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='OTHERPR' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RETURNPR' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='TOTPR' rs:number='15' rs:nullable='true'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_INPUT_DTT' rs:number='16' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='19'/>
		</s:AttributeType>
		<s:AttributeType name='RRM_ISSUE_NM' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='340'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String RRM_MODI_ID_T = cRsList.getString("RRM_MODI_ID");
			String IAU_PENL_NM_T = cRsList.getString("IAU_PENL_NM");
			String EEA_EXAM_DT_T = cRsList.getString("EEA_EXAM_DT");
			String EEA_CHART_NO_T = cRsList.getString("EEA_CHART_NO");
			String EEA_PSNL_NM_T = cRsList.getString("EEA_PSNL_NM");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String EEA_EXAM_NM_T = cRsList.getString("EEA_EXAM_NM");
			String RRM_OCCU_NM_T = cRsList.getString("RRM_OCCU_NM");
			String RRM_RECE_DT_T = cRsList.getString("RRM_RECE_DT");
			String CARDPR_T = cRsList.getString("CARDPR");
			String CASHPR_T = cRsList.getString("CASHPR");
			String BKBOOKPR_T = cRsList.getString("BKBOOKPR");
			String OTHERPR_T = cRsList.getString("OTHERPR");
			String RETURNPR_T = cRsList.getString("RETURNPR");
			String TOTPR_T = cRsList.getString("TOTPR");
			String RRM_INPUT_DTT_T = cRsList.getString("RRM_INPUT_DTT");
			String RRM_ISSUE_NM_T = cRsList.getString("RRM_ISSUE_NM");
%>
			<z:row
<%
			if(! RRM_MODI_ID_T.equals("")) {
%>
		 		RRM_MODI_ID='<%= RRM_MODI_ID_T%>'
<%
			}

			if(! IAU_PENL_NM_T.equals("")) {
%>
		 		IAU_PENL_NM='<%= IAU_PENL_NM_T%>'
<%
			}

			if(! EEA_EXAM_DT_T.equals("")) {
%>
		 		EEA_EXAM_DT='<%= EEA_EXAM_DT_T%>'
<%
			}

			if(! EEA_CHART_NO_T.equals("")) {
%>
		 		EEA_CHART_NO='<%= EEA_CHART_NO_T%>'
<%
			}

			if(! EEA_PSNL_NM_T.equals("")) {
%>
		 		EEA_PSNL_NM='<%= EEA_PSNL_NM_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! EEA_EXAM_NM_T.equals("")) {
%>
		 		EEA_EXAM_NM='<%= EEA_EXAM_NM_T%>'
<%
			}

			if(! RRM_OCCU_NM_T.equals("")) {
%>
		 		RRM_OCCU_NM='<%= RRM_OCCU_NM_T%>'
<%
			}

			if(! RRM_RECE_DT_T.equals("")) {
%>
		 		RRM_RECE_DT='<%= RRM_RECE_DT_T%>'
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

			if(! RRM_INPUT_DTT_T.equals("")) {
%>
		 		RRM_INPUT_DTT='<%= RRM_INPUT_DTT_T%>'
<%
			}

			if(! RRM_ISSUE_NM_T.equals("")) {
%>
		 		RRM_ISSUE_NM='<%= RRM_ISSUE_NM_T%>'
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
