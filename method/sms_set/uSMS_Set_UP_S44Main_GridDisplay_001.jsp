<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtList = null;
	Statement stmtDetail = null;

	ResultSet rsList = null;
	ResultSet rsDetail = null;

	CRs cRsList = null;
	CRs cRsDetail = null;

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
		stmtDetail = connect.createStatement();

		/*

select  *  from user_tab_columns
where table_name='CR_SMS_AUTO_SET'
		*/

		sql = " SELECT *";
		sql += " FROM USER_TAB_COLUMNS";
		sql += " WHERE TABLE_NAME='CR_SMS_AUTO_SET'";

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uSMS_Set_UP_S44Main_GridDisplay_001 \n";
			G_INFO += "설명 : 테이블 존재유무 확인 \n";
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
		<s:AttributeType name='TABLE_NAME' rs:number='1' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS' rs:basecolumn='TABLE_NAME'>
			<s:datatype dt:type='string' dt:maxLength='30' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='COLUMN_NAME' rs:number='2' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS' rs:basecolumn='COLUMN_NAME'>
			<s:datatype dt:type='string' dt:maxLength='30' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='DATA_TYPE' rs:number='3' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='DATA_TYPE'>
			<s:datatype dt:type='string' dt:maxLength='106'/>
		</s:AttributeType>
		<s:AttributeType name='DATA_TYPE_MOD' rs:number='4' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='DATA_TYPE_MOD'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='DATA_TYPE_OWNER' rs:number='5' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='DATA_TYPE_OWNER'>
			<s:datatype dt:type='string' dt:maxLength='60'/>
		</s:AttributeType>
		<s:AttributeType name='DATA_LENGTH' rs:number='6' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS' rs:basecolumn='DATA_LENGTH'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='DATA_PRECISION' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='DATA_PRECISION'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DATA_SCALE' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='DATA_SCALE'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='NULLABLE' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='NULLABLE'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='COLUMN_ID' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='COLUMN_ID'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DEFAULT_LENGTH' rs:number='11' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='DEFAULT_LENGTH'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='DATA_DEFAULT' rs:number='12' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='DATA_DEFAULT'>
			<s:datatype dt:type='string' dt:maxLength='1073741823' rs:long='true'/>
		</s:AttributeType>
		<s:AttributeType name='NUM_DISTINCT' rs:number='13' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='NUM_DISTINCT'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='LOW_VALUE' rs:number='14' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='LOW_VALUE'>
			<s:datatype dt:type='bin.hex' dt:maxLength='32'/>
		</s:AttributeType>
		<s:AttributeType name='HIGH_VALUE' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='HIGH_VALUE'>
			<s:datatype dt:type='bin.hex' dt:maxLength='32'/>
		</s:AttributeType>
		<s:AttributeType name='DENSITY' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='DENSITY'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='NUM_NULLS' rs:number='17' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='NUM_NULLS'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='NUM_BUCKETS' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='NUM_BUCKETS'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='LAST_ANALYZED' rs:number='19' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='LAST_ANALYZED'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='SAMPLE_SIZE' rs:number='20' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='SAMPLE_SIZE'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CHARACTER_SET_NAME' rs:number='21' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='CHARACTER_SET_NAME'>
			<s:datatype dt:type='string' dt:maxLength='44'/>
		</s:AttributeType>
		<s:AttributeType name='CHAR_COL_DECL_LENGTH' rs:number='22' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='CHAR_COL_DECL_LENGTH'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='GLOBAL_STATS' rs:number='23' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='GLOBAL_STATS'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='USER_STATS' rs:number='24' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='USER_STATS'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='AVG_COL_LEN' rs:number='25' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='AVG_COL_LEN'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CHAR_LENGTH' rs:number='26' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='CHAR_LENGTH'>
			<s:datatype dt:type='number' rs:dbtype='varnumeric' dt:maxLength='38' rs:scale='255' rs:precision='38'/>
		</s:AttributeType>
		<s:AttributeType name='CHAR_USED' rs:number='27' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='CHAR_USED'>
			<s:datatype dt:type='string' dt:maxLength='1'/>
		</s:AttributeType>
		<s:AttributeType name='V80_FMT_IMAGE' rs:number='28' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='V80_FMT_IMAGE'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='DATA_UPGRADED' rs:number='29' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='DATA_UPGRADED'>
			<s:datatype dt:type='string' dt:maxLength='3'/>
		</s:AttributeType>
		<s:AttributeType name='HISTOGRAM' rs:number='30' rs:nullable='true' rs:writeunknown='true' rs:basetable='USER_TAB_COLUMNS'
			 rs:basecolumn='HISTOGRAM'>
			<s:datatype dt:type='string' dt:maxLength='15'/>
		</s:AttributeType>
		<s:extends type='rs:rowbase'/>
	</s:ElementType>
</s:Schema>		<rs:data>
<%
		int cnt = 0;
		while(cRsList.next()) {

			cnt++;

			String TABLE_NAME_T = cRsList.getString("TABLE_NAME");
			String COLUMN_NAME_T = cRsList.getString("COLUMN_NAME");
			String DATA_TYPE_T = cRsList.getString("DATA_TYPE");
			String DATA_TYPE_MOD_T = cRsList.getString("DATA_TYPE_MOD");
			String DATA_TYPE_OWNER_T = cRsList.getString("DATA_TYPE_OWNER");
			String DATA_LENGTH_T = cRsList.getString("DATA_LENGTH");
			String DATA_PRECISION_T = cRsList.getString("DATA_PRECISION");
			String DATA_SCALE_T = cRsList.getString("DATA_SCALE");
			String NULLABLE_T = cRsList.getString("NULLABLE");
			String COLUMN_ID_T = cRsList.getString("COLUMN_ID");
			String DEFAULT_LENGTH_T = cRsList.getString("DEFAULT_LENGTH");
			String DATA_DEFAULT_T = cRsList.getString("DATA_DEFAULT");
			String NUM_DISTINCT_T = cRsList.getString("NUM_DISTINCT");
			String LOW_VALUE_T = cRsList.getString("LOW_VALUE");
			String HIGH_VALUE_T = cRsList.getString("HIGH_VALUE");
			String DENSITY_T = cRsList.getString("DENSITY");
			String NUM_NULLS_T = cRsList.getString("NUM_NULLS");
			String NUM_BUCKETS_T = cRsList.getString("NUM_BUCKETS");
			String LAST_ANALYZED_T = cRsList.getDate2("LAST_ANALYZED");
			String SAMPLE_SIZE_T = cRsList.getString("SAMPLE_SIZE");
			String CHARACTER_SET_NAME_T = cRsList.getString("CHARACTER_SET_NAME");
			String CHAR_COL_DECL_LENGTH_T = cRsList.getString("CHAR_COL_DECL_LENGTH");
			String GLOBAL_STATS_T = cRsList.getString("GLOBAL_STATS");
			String USER_STATS_T = cRsList.getString("USER_STATS");
			String AVG_COL_LEN_T = cRsList.getString("AVG_COL_LEN");
			String CHAR_LENGTH_T = cRsList.getString("CHAR_LENGTH");
			String CHAR_USED_T = cRsList.getString("CHAR_USED");
			String V80_FMT_IMAGE_T = cRsList.getString("V80_FMT_IMAGE");
			String DATA_UPGRADED_T = cRsList.getString("DATA_UPGRADED");
			String HISTOGRAM_T = cRsList.getString("HISTOGRAM");
%>
			<z:row
<%
			if(! TABLE_NAME_T.equals("")) {
%>
		 		TABLE_NAME='<%= TABLE_NAME_T%>'
<%
			}

			if(! COLUMN_NAME_T.equals("")) {
%>
		 		COLUMN_NAME='<%= COLUMN_NAME_T%>'
<%
			}

			if(! DATA_TYPE_T.equals("")) {
%>
		 		DATA_TYPE='<%= DATA_TYPE_T%>'
<%
			}

			if(! DATA_TYPE_MOD_T.equals("")) {
%>
		 		DATA_TYPE_MOD='<%= DATA_TYPE_MOD_T%>'
<%
			}

			if(! DATA_TYPE_OWNER_T.equals("")) {
%>
		 		DATA_TYPE_OWNER='<%= DATA_TYPE_OWNER_T%>'
<%
			}

			if(! DATA_LENGTH_T.equals("")) {
%>
		 		DATA_LENGTH='<%= DATA_LENGTH_T%>'
<%
			}

			if(! DATA_PRECISION_T.equals("")) {
%>
		 		DATA_PRECISION='<%= DATA_PRECISION_T%>'
<%
			}

			if(! DATA_SCALE_T.equals("")) {
%>
		 		DATA_SCALE='<%= DATA_SCALE_T%>'
<%
			}

			if(! NULLABLE_T.equals("")) {
%>
		 		NULLABLE='<%= NULLABLE_T%>'
<%
			}

			if(! COLUMN_ID_T.equals("")) {
%>
		 		COLUMN_ID='<%= COLUMN_ID_T%>'
<%
			}

			if(! DEFAULT_LENGTH_T.equals("")) {
%>
		 		DEFAULT_LENGTH='<%= DEFAULT_LENGTH_T%>'
<%
			}

			if(! DATA_DEFAULT_T.equals("")) {
%>
		 		DATA_DEFAULT='<%= DATA_DEFAULT_T%>'
<%
			}

			if(! NUM_DISTINCT_T.equals("")) {
%>
		 		NUM_DISTINCT='<%= NUM_DISTINCT_T%>'
<%
			}

			if(! LOW_VALUE_T.equals("")) {
%>
		 		LOW_VALUE='<%= LOW_VALUE_T%>'
<%
			}

			if(! HIGH_VALUE_T.equals("")) {
%>
		 		HIGH_VALUE='<%= HIGH_VALUE_T%>'
<%
			}

			if(! DENSITY_T.equals("")) {
%>
		 		DENSITY='<%= DENSITY_T%>'
<%
			}

			if(! NUM_NULLS_T.equals("")) {
%>
		 		NUM_NULLS='<%= NUM_NULLS_T%>'
<%
			}

			if(! NUM_BUCKETS_T.equals("")) {
%>
		 		NUM_BUCKETS='<%= NUM_BUCKETS_T%>'
<%
			}

			if(! LAST_ANALYZED_T.equals("")) {
%>
		 		LAST_ANALYZED='<%= LAST_ANALYZED_T%>'
<%
			}

			if(! SAMPLE_SIZE_T.equals("")) {
%>
		 		SAMPLE_SIZE='<%= SAMPLE_SIZE_T%>'
<%
			}

			if(! CHARACTER_SET_NAME_T.equals("")) {
%>
		 		CHARACTER_SET_NAME='<%= CHARACTER_SET_NAME_T%>'
<%
			}

			if(! CHAR_COL_DECL_LENGTH_T.equals("")) {
%>
		 		CHAR_COL_DECL_LENGTH='<%= CHAR_COL_DECL_LENGTH_T%>'
<%
			}

			if(! GLOBAL_STATS_T.equals("")) {
%>
		 		GLOBAL_STATS='<%= GLOBAL_STATS_T%>'
<%
			}

			if(! USER_STATS_T.equals("")) {
%>
		 		USER_STATS='<%= USER_STATS_T%>'
<%
			}

			if(! AVG_COL_LEN_T.equals("")) {
%>
		 		AVG_COL_LEN='<%= AVG_COL_LEN_T%>'
<%
			}

			if(! CHAR_LENGTH_T.equals("")) {
%>
		 		CHAR_LENGTH='<%= CHAR_LENGTH_T%>'
<%
			}

			if(! CHAR_USED_T.equals("")) {
%>
		 		CHAR_USED='<%= CHAR_USED_T%>'
<%
			}

			if(! V80_FMT_IMAGE_T.equals("")) {
%>
		 		V80_FMT_IMAGE='<%= V80_FMT_IMAGE_T%>'
<%
			}

			if(! DATA_UPGRADED_T.equals("")) {
%>
		 		DATA_UPGRADED='<%= DATA_UPGRADED_T%>'
<%
			}

			if(! HISTOGRAM_T.equals("")) {
%>
		 		HISTOGRAM='<%= HISTOGRAM_T%>'
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

		if(rsDetail != null) {
			rsDetail.close();
			rsDetail = null;
		}

		if(stmtList != null) {
			stmtList.close();
			stmtList = null;
		}

		if(stmtDetail != null) {
			stmtDetail.close();
			stmtDetail = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
