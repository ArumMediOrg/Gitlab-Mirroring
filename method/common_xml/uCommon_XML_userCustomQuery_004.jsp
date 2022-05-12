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

    String SSQL = htMethod.get("SSQL");

    //
    if(SSQL == null) { SSQL = ""; }

    // DB객체
    stmtList = connect.createStatement();

		/*

select A.aliasField1, A.aliasField2, A.aliasField3, A.aliasField4, A.aliasField5, A.aliasField6, A.aliasField7, A.aliasField8, A.aliasField9, A.aliasField10,
       A.aliasField11, A.aliasField12, A.aliasField13, A.aliasField14, A.aliasField15, A.aliasField16, A.aliasField17, A.aliasField18, A.aliasField19, A.aliasField20 from
(
  :sSql
) A

		*/

    sql = "  SELECT ";
    sql += " * ";
    sql += " FROM (" + SSQL + ") A";

    //
    G_INFO += "<!-- \n";
    G_INFO += "서비스명 : uCommon_XML_userCustomQuery_004 \n";
    G_INFO += "설명 : 알리아싱된 데이터 출력을 위한 쿼리 - maxlength를 크게 잡아주시기 바랍니다. \n";
    G_INFO += "\n\n";

    G_INFO += "전달인자 : \n";
    G_INFO += " SSQL : " + SSQL + " \n";
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
                    <%
                        for (colCnt = 1; colCnt <= rsmd.getColumnCount(); colCnt++){
                            String dataType = "string";
                            String maxLength = "30000";

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
