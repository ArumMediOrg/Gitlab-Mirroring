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

	ResultSetMetaData rsmd = null;
    int colCnt = 0;

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String EXAM_SDT = htMethod.get("EXAM_SDT");
		String EXAM_EDT = htMethod.get("EXAM_EDT");

		//
		if(EXAM_SDT == null) { EXAM_SDT = ""; }
		if(EXAM_EDT == null) { EXAM_EDT = ""; }

		// DB객체
		stmtList = connect.createStatement();


			sql = " SELECT RRL_EXAM_DT,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '00' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_00,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '01' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_01,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '02' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_02,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '03' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_03,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '04' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_04,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '05' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_05,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '06' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_06,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '07' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_07,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '08' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_08,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '09' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_09,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '10' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_10,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '11' THEN RRL_TOT_CNT  ELSE 0 END) TOT_CNT_11,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '00' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_00,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '01' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_01,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '02' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_02,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '03' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_03,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '04' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_04,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '05' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_05,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '06' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_06,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '07' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_07,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '08' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_08,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '09' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_09,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '10' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_10,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '11' THEN RRL_RSVN_CNT ELSE 0 END) RSVN_CNT_11,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '00' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_00,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '01' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_01,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '02' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_02,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '03' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_03,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '04' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_04,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '05' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_05,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '06' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_06,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '07' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_07,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '08' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_08,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '09' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_09,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '10' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_10,";
			sql += " SUM(CASE WHEN RRE_EQUI_CD = '11' THEN RRL_PROC_CNT ELSE 0 END) PROC_CNT_11";
			sql += " FROM RT_RSVT_EQUIP A, RT_RSVT_EQUIP_LIMIT B";
			sql += " WHERE UPPER(A.RRE_USE_YN) = 'Y'";
			sql += " AND RRL_EQUI_CD = RRE_EQUI_CD";
			sql += " AND RRL_EXAM_DT BETWEEN '" + EXAM_SDT + "' AND '" + EXAM_EDT + "'";
			sql += " AND RRL_USE_YN = 'Y'";
			sql += " GROUP BY RRL_EXAM_DT";
			sql += " ORDER BY RRL_EXAM_DT";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uRsvn_List_Up_Equip_Cnt_001 \n";
			G_INFO += "설명 : 예약장비별 설정 건수 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_SDT : " + EXAM_SDT + " \n";
			G_INFO += " EXAM_EDT : " + EXAM_EDT + " \n";
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
                        for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++) {
                            String dataType = "string";
                            String maxLength = "4000";

                            if (rsmd.getColumnTypeName(colCnt).equals("BLOB")) {
                                dataType = "bin.hex";
                                maxLength = "2147483647";
                                //<s:datatype dt:type='bin.hex' dt:maxLength='2147483647' rs:long='true'/>
                            } else if (rsmd.getColumnTypeName(colCnt).equals("CLOB")) {
                                maxLength = "1073741823";
                                //<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
                            }
                    %>
                    <s:AttributeType name='<%= rsmd.getColumnName(colCnt)%>' rs:number='<%= Integer.toString(colCnt)%>' rs:writeunknown='true' rs:basetable='DUAL'
                                     rs:basecolumn='<%= rsmd.getColumnName(colCnt)%>'>
                        <s:datatype dt:type='<%= dataType%>' dt:maxLength='<%= maxLength%>' <% if (!maxLength.equals("4000")) { %> rs:long='true' <% } %>/>
                    </s:AttributeType>
                    <%
                        }
                    %>
                    <s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
                                     rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
                        <s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
                    </s:AttributeType>
                    <s:extends type='rs:rowbase'/>
                </s:ElementType>
            </s:Schema> <rs:data>
            <%
                int cnt = 0;
                while (cRsList.next()) {

                    cnt++;

                    String ROWID_T = cRsList.getString("ROWID");
            %>
            <z:row
            <%
                for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++) {

                    String tempData = cRsList.getString(rsmd.getColumnName(colCnt));

                    if (rsmd.getColumnTypeName(colCnt).equals("BLOB")) {
                        byte[] buf_BLOB = rsList.getBytes(rsmd.getColumnName(colCnt));
                        if (buf_BLOB != null) {
                            tempData = new String(buf_BLOB);
                        }
                    }

                    if (!tempData.equals("")) {
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

    out.clear();        // include된 파일안의 공백 제거
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

    if (rsList != null) {
        rsList.close();
        rsList = null;
    }

    if (stmtList != null) {
        stmtList.close();
        stmtList = null;
    }
%>
<%@ include file="/inc_prg/disconnect.jsp" %>
<%
    }
%>
