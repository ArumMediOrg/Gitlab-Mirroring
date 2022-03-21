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

		String CBRSVN = htMethod.get("CBRSVN");
		String EDPSNL_NM = htMethod.get("EDPSNL_NM");
		String EDPSNL_ID = htMethod.get("EDPSNL_ID");
		String G_ENCRT_KD = htMethod.get("G_ENCRT_KD");
		String SMOBL_NO = htMethod.get("SMOBL_NO");

		//
		if(CBRSVN == null) { CBRSVN = ""; }
		if(EDPSNL_NM == null) { EDPSNL_NM = ""; }
		if(EDPSNL_ID == null) { EDPSNL_ID = ""; }
		if(G_ENCRT_KD == null) { G_ENCRT_KD = ""; }
		if(SMOBL_NO == null) { SMOBL_NO = ""; }

		// DB객체
		stmtList = connect.createStatement();

		/*

select a.rrt_inpt_dtt rrt_rsvn_dt, a.rrt_rsvn_no, a.rrt_exam_dt, a.rrt_exam_tm,                                
       a.rrt_psnl_nm, b.icr_birh_dt, a.rrt_cust_no, a.rrt_exam_lt, a.rrt_comp_cd, a.rrt_rsvn_tx,               
       dbo.f_tel_format(a.rrt_mobl_no) rrt_mobl_no,                                                            
       dbo.f_tel_format(a.rrt_tel_no)  rrt_tel_no,                                                             
       dbo.f_pid(a.rrt_psnl_id) rrt_psnl_id,                                                                   
       case when SUBSTR(a.rrt_exam_lt, 1, 3) in ('P00'', ''E00') then dbo.f_pack_find(a.rrt_exam_lt, '')
            when SUBSTR(a.rrt_exam_lt, 1, 3) = 'C03' then dbo.f_pack_find(a.rrt_exam_lt, a.rrt_comp_cd)   
            else dbo.f_code_find('0401', a.rrt_exam_cd, '', '1') end as rrt_exam_nm,                     
       dbo.F_COMP_FIND(a.rrt_comp_cd) rrt_comp_nm, a.rrt_equip_lt, a.rrt_equip_tm,                             
       dbo.f_user_find(a.rrt_inpt_id) rrt_inpt_nm, a.rrt_inpt_dtt                                              
  from rt_rsvt a                                                                                               
       left outer join it_customer b                                                                           
    on b.icr_cust_no = a.rrt_cust_no                                                                           
    if (:cbRsvn = 'Y') then
       where a.rrt_exam_dt >= TO_CHAR(TO_DATE(SYSDATE, 'YYYY-MM-DD') 
    else
       where a.rrt_exam_dt  = TO_CHAR(TO_DATE(SYSDATE, 'YYYY-MM-DD')
   and NVL(a.rrt_exam_sq, ' ') = ' ' 
   and NVL(a.rrt_cncl_yn, ' ') <> 'Y' 
   and SUBSTR(a.rrt_exam_cd, 1, 2) <> '31'
   if (:edPsnl_Nm <> '') then
       and a.rrt_psnl_nm like '%'||:edPsnl_Nm||'%'
   if (Length(:edPsnl_Id) = 13) then
   begin
      if (:g_Encrt_Kd = '1') then 
         and icr_pid_en = :edPsnl_Id
      else if (:g_Encrt_Kd = '2') then
         and icr_pid_en = ECHELONDB.dbo.ecl_encrypt(:edPsnl_Id) 
      else
         and icr_penl_id = :edPsnl_Id
    end else if (:edPsnl_Id <> '') then
      and a.rrt_psnl_id like SUBSTR(:edPsnl_Id, 1, 7)||'%'
    if (:sMobl_No <> '') then
      and icr_mobl_no  like :sMobl_No||'%'
    order by a.rrt_psnl_nm, a.rrt_exam_dt, a.rrt_exam_tm 
		*/

		sql = " SELECT A.RRT_INPT_DTT RRT_RSVN_DT, A.RRT_RSVN_NO, A.RRT_EXAM_DT, A.RRT_EXAM_TM, A.RRT_PSNL_NM, B.ICR_BIRH_DT, A.RRT_CUST_NO, A.RRT_EXAM_LT, A.RRT_COMP_CD, A.RRT_RSVN_TX, F_TEL_FORMAT(A.RRT_MOBL_NO) RRT_MOBL_NO, F_TEL_FORMAT(A.RRT_TEL_NO) RRT_TEL_NO, F_PID(A.RRT_PSNL_ID) RRT_PSNL_ID, CASE WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) IN ('P00', 'E00') THEN F_PACK_FIND(A.RRT_EXAM_LT, '') WHEN SUBSTR(A.RRT_EXAM_LT, 1, 3) = 'C03' THEN F_PACK_FIND(A.RRT_EXAM_LT, A.RRT_COMP_CD) ELSE F_CODE_FIND('0401', A.RRT_EXAM_CD, '', '1') END AS RRT_EXAM_NM, F_COMP_FIND(A.RRT_COMP_CD) RRT_COMP_NM, A.RRT_EQUIP_LT, A.RRT_EQUIP_TM, F_USER_FIND(A.RRT_INPT_ID) RRT_INPT_NM, A.RRT_INPT_DTT";
		sql += " FROM RT_RSVT A LEFT OUTER JOIN IT_CUSTOMER B";
		sql += " ON B.ICR_CUST_NO = A.RRT_CUST_NO";

    	 	if(CBRSVN.equals("Y")) {
			sql += " WHERE A.RRT_EXAM_DT >= TO_CHAR(TO_DATE(SYSDATE, 'YYYY-MM-DD'))";
		} else {
			sql += " WHERE A.RRT_EXAM_DT = TO_CHAR(TO_DATE(SYSDATE, 'YYYY-MM-DD'))";
		}

		sql += " AND NVL(A.RRT_EXAM_SQ, ' ') = ' '";
		sql += " AND NVL(A.RRT_CNCL_YN, ' ') <> 'Y'";
		sql += " AND SUBSTR(A.RRT_EXAM_CD, 1, 2) <> '31'";

    		if(!EDPSNL_NM.equals("")) {
			sql += " AND A.RRT_PSNL_NM LIKE '%" + EDPSNL_NM + "%'";
		}

    	  	if(EDPSNL_ID.length() == 13) {
      	  		if(G_ENCRT_KD.equals("1")) {
 				sql += " AND ICR_PID_EN = '" + EDPSNL_ID + "'";
    	  		}
    	  		else if(G_ENCRT_KD.equals("2")) {
 				sql += " AND ICR_PID_EN = ECHELONDB.ECL_ENCRYPT('" + EDPSNL_ID + "')";
   	  		}
    	  		else {
				sql += " AND ICR_PENL_ID = '" + EDPSNL_ID + "'";
    	  		}
	
		} else if(!EDPSNL_ID.equals("")) {
			sql += " AND A.RRT_PSNL_ID LIKE SUBSTR('" + EDPSNL_ID + "', 1, 7)||'%' ";
		}
		
		if (!SMOBL_NO.equals("")) {
			sql += " AND ICR_MOBL_NO LIKE '" + SMOBL_NO + "%'";	
		}

		sql += " ORDER BY A.RRT_PSNL_NM, A.RRT_EXAM_DT, A.RRT_EXAM_TM";
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uFind_Cust_ReverSelect_001 \n";
			G_INFO += "설명 : 접수정보 로딩 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " CBRSVN : " + CBRSVN + " \n";
			G_INFO += " EDPSNL_NM : " + EDPSNL_NM + " \n";
			G_INFO += " EDPSNL_ID : " + EDPSNL_ID + " \n";
			G_INFO += " G_ENCRT_KD : " + G_ENCRT_KD + " \n";
			G_INFO += " SMOBL_NO : " + SMOBL_NO + " \n";
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
		<s:AttributeType name='RRT_RSVN_DT' rs:number='1' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_INPT_DTT'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_RSVN_NO' rs:number='2' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_RSVN_NO'>
			<s:datatype dt:type='string' dt:maxLength='14' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_DT' rs:number='3' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_DT'>
			<s:datatype dt:type='string' dt:maxLength='10' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_TM' rs:number='4' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_EXAM_TM'>
			<s:datatype dt:type='string' dt:maxLength='5' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PSNL_NM' rs:number='5' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='RRT_PSNL_NM'>
			<s:datatype dt:type='string' dt:maxLength='100' rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ICR_BIRH_DT' rs:number='6' rs:nullable='true' rs:writeunknown='true' rs:basetable='IT_CUSTOMER'
			 rs:basecolumn='ICR_BIRH_DT'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_CUST_NO' rs:number='7' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_CUST_NO'>
			<s:datatype dt:type='string' dt:maxLength='10'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_LT' rs:number='8' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EXAM_LT'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_COMP_CD' rs:number='9' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_COMP_CD'>
			<s:datatype dt:type='string' dt:maxLength='12'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_RSVN_TX' rs:number='10' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_RSVN_TX'>
			<s:datatype dt:type='string' dt:maxLength='1000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_MOBL_NO' rs:number='11' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_TEL_NO' rs:number='12' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_PSNL_ID' rs:number='13' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EXAM_NM' rs:number='14' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_COMP_NM' rs:number='15' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EQUIP_LT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EQUIP_LT' rs:number='16' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_EQUIP_TM'>
			<s:datatype dt:type='string' dt:maxLength='2000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_EQUIP_TM' rs:number='17' rs:nullable='true'>
			<s:datatype dt:type='string' dt:maxLength='400'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_INPT_NM' rs:number='18' rs:nullable='true' rs:writeunknown='true' rs:basetable='RT_RSVT'
			 rs:basecolumn='RRT_INPT_DTT'>
			<s:datatype dt:type='string' dt:maxLength='4000'/>
		</s:AttributeType>
		<s:AttributeType name='RRT_INPT_DTT' rs:number='19' rs:writeunknown='true' rs:basetable='RT_RSVT' rs:basecolumn='ROWID'>
			<s:datatype dt:type='dateTime' rs:dbtype='timestamp' dt:maxLength='16' rs:scale='0' rs:precision='19' rs:fixedlength='true'
			 rs:maybenull='false'/>
		</s:AttributeType>
		<s:AttributeType name='ROWID' rs:number='20' rs:rowid='true' rs:basetable='IT_CUSTOMER' rs:basecolumn='ROWID'
			 rs:keycolumn='true' rs:hidden='true' rs:autoincrement='true'>
			<s:datatype dt:type='string' rs:dbtype='str' dt:maxLength='18' rs:fixedlength='true'/>
		</s:AttributeType>
		<s:AttributeType name='c20' rs:name='ROWID' rs:number='21' rs:rowid='true' rs:hidden='true'>
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

			String RRT_RSVN_DT_T = cRsList.getDate2("RRT_RSVN_DT");
			String RRT_RSVN_NO_T = cRsList.getString("RRT_RSVN_NO");
			String RRT_EXAM_DT_T = cRsList.getString("RRT_EXAM_DT");
			String RRT_EXAM_TM_T = cRsList.getString("RRT_EXAM_TM");
			String RRT_PSNL_NM_T = cRsList.getString("RRT_PSNL_NM");
			String ICR_BIRH_DT_T = cRsList.getString("ICR_BIRH_DT");
			String RRT_CUST_NO_T = cRsList.getString("RRT_CUST_NO");
			String RRT_EXAM_LT_T = cRsList.getString("RRT_EXAM_LT");
			String RRT_COMP_CD_T = cRsList.getString("RRT_COMP_CD");
			String RRT_RSVN_TX_T = cRsList.getString("RRT_RSVN_TX");
			String RRT_MOBL_NO_T = cRsList.getString("RRT_MOBL_NO");
			String RRT_TEL_NO_T = cRsList.getString("RRT_TEL_NO");
			String RRT_PSNL_ID_T = cRsList.getString("RRT_PSNL_ID");
			String RRT_EXAM_NM_T = cRsList.getString("RRT_EXAM_NM");
			String RRT_COMP_NM_T = cRsList.getString("RRT_COMP_NM");
			String RRT_EQUIP_LT_T = cRsList.getString("RRT_EQUIP_LT");
			String RRT_EQUIP_TM_T = cRsList.getString("RRT_EQUIP_TM");
			String RRT_INPT_NM_T = cRsList.getString("RRT_INPT_NM");
			String RRT_INPT_DTT_T = cRsList.getDate2("RRT_INPT_DTT");
			String ROWID_T = cRsList.getString("ROWID");
			String c20_T = cRsList.getString("c20");
%>
			<z:row
<%
			if(! RRT_RSVN_DT_T.equals("")) {
%>
		 		RRT_RSVN_DT='<%= RRT_RSVN_DT_T%>'
<%
			}

			if(! RRT_RSVN_NO_T.equals("")) {
%>
		 		RRT_RSVN_NO='<%= RRT_RSVN_NO_T%>'
<%
			}

			if(! RRT_EXAM_DT_T.equals("")) {
%>
		 		RRT_EXAM_DT='<%= RRT_EXAM_DT_T%>'
<%
			}

			if(! RRT_EXAM_TM_T.equals("")) {
%>
		 		RRT_EXAM_TM='<%= RRT_EXAM_TM_T%>'
<%
			}

			if(! RRT_PSNL_NM_T.equals("")) {
%>
		 		RRT_PSNL_NM='<%= RRT_PSNL_NM_T%>'
<%
			}

			if(! ICR_BIRH_DT_T.equals("")) {
%>
		 		ICR_BIRH_DT='<%= ICR_BIRH_DT_T%>'
<%
			}

			if(! RRT_CUST_NO_T.equals("")) {
%>
		 		RRT_CUST_NO='<%= RRT_CUST_NO_T%>'
<%
			}

			if(! RRT_EXAM_LT_T.equals("")) {
%>
		 		RRT_EXAM_LT='<%= RRT_EXAM_LT_T%>'
<%
			}

			if(! RRT_COMP_CD_T.equals("")) {
%>
		 		RRT_COMP_CD='<%= RRT_COMP_CD_T%>'
<%
			}

			if(! RRT_RSVN_TX_T.equals("")) {
%>
		 		RRT_RSVN_TX='<%= RRT_RSVN_TX_T%>'
<%
			}

			if(! RRT_MOBL_NO_T.equals("")) {
%>
		 		RRT_MOBL_NO='<%= RRT_MOBL_NO_T%>'
<%
			}

			if(! RRT_TEL_NO_T.equals("")) {
%>
		 		RRT_TEL_NO='<%= RRT_TEL_NO_T%>'
<%
			}

			if(! RRT_PSNL_ID_T.equals("")) {
%>
		 		RRT_PSNL_ID='<%= RRT_PSNL_ID_T%>'
<%
			}

			if(! RRT_EXAM_NM_T.equals("")) {
%>
		 		RRT_EXAM_NM='<%= RRT_EXAM_NM_T%>'
<%
			}

			if(! RRT_COMP_NM_T.equals("")) {
%>
		 		RRT_COMP_NM='<%= RRT_COMP_NM_T%>'
<%
			}

			if(! RRT_EQUIP_LT_T.equals("")) {
%>
		 		RRT_EQUIP_LT='<%= RRT_EQUIP_LT_T%>'
<%
			}

			if(! RRT_EQUIP_TM_T.equals("")) {
%>
		 		RRT_EQUIP_TM='<%= RRT_EQUIP_TM_T%>'
<%
			}

			if(! RRT_INPT_NM_T.equals("")) {
%>
		 		RRT_INPT_NM='<%= RRT_INPT_NM_T%>'
<%
			}

			if(! RRT_INPT_DTT_T.equals("")) {
%>
		 		RRT_INPT_DTT='<%= RRT_INPT_DTT_T%>'
<%
			}
%>
				ROWID='<%= cnt%>'
<%
			if(! c20_T.equals("")) {
%>
		 		c20='<%= c20_T%>'
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
