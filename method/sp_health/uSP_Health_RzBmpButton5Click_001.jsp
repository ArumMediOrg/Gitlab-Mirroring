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

		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");
		String GUBUN = htMethod.get("GUBUN");

		//
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }
		if(GUBUN == null) { GUBUN = ""; }


		// DB객체
		stmtList = connect.createStatement();

		/*

Select * from ST_PANJUNG
 Where SPG_EXAM_DT  = :EXAM_DT
   And SPG_EXAM_SQ  = :EXAM_SQ
   And SPG_MATT_CD In ('70001', '70002')
   And SPG_ORGA_CD = '05'
   And SPG_SOKY_CD = 'N01R'
		*/

//		sql = " SELECT *";
//		sql += " FROM ST_PANJUNG";
//		sql += " WHERE SPG_EXAM_DT = '" + EXAM_DT + "'";
//		sql += " AND SPG_EXAM_SQ = '" + EXAM_SQ + "'";
//		sql += " AND SPG_MATT_CD IN ('70001', '70002')";
//		sql += " AND SPG_ORGA_CD = '05'";
//		sql += " AND SPG_SOKY_CD = 'N01R'";

		sql = "  SELECT * ";
		sql += " FROM ST_PANJUNG";
		sql += " WHERE SPG_EXAM_DT = '" + EXAM_DT + "'";
		sql += " AND SPG_EXAM_SQ = '" + EXAM_SQ + "'";
		if(GUBUN.equals("1")) {
			sql += " AND SPG_MATT_CD IN ('70001', '70002')";
			sql += " AND SPG_ORGA_CD = '05'";
			sql += " AND SPG_SOKY_CD = 'N01R'";
		} else if (GUBUN.equals("2")){
			sql += " AND SPG_MATT_CD IN ('82001', '83001')";
			sql += " AND SPG_ORGA_CD = '05'";
			sql += " AND SPG_SOKY_CD = 'J01R'";
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSP_Health_RzBmpButton5Click_001 \n";
			G_INFO += "설명 : 판정조회(야간2차 신경계 생성) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += " GUBUN : " + GUBUN + " \n";
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
					<s:AttributeType name='ROWID' rs:number='<%= Integer.toString(colCnt)%>' rs:rowid='true' rs:writeunknown='true' rs:basetable='DUAL'
									 rs:basecolumn='ROWID' rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
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
