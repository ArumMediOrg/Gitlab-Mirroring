<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;
	Statement stmtDetail = null;
	Statement stmtLoop = null;
	CallableStatement CallStmtExec = null;
	ResultSet rsDetail = null;
	ResultSet rsLoop = null;
	CRs cRsDetail = null;
	CRs cRsLoop = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String EEA_EXAM_SDT = htMethod.get("EEA_EXAM_SDT");
		String EEA_EXAM_EDT = htMethod.get("EEA_EXAM_EDT");
		String IIM_ITEM_CD = htMethod.get("IIM_ITEM_CD");

		//
		if(EEA_EXAM_SDT == null) { EEA_EXAM_SDT = ""; }
		if(EEA_EXAM_EDT == null) { EEA_EXAM_EDT = ""; }
		if(IIM_ITEM_CD == null) { IIM_ITEM_CD = ""; }

		// DB객체
		stmtExec = connect.createStatement();
		stmtDetail = connect.createStatement();
		stmtLoop = connect.createStatement();
		
		// SP사용
		sql = "{call sp_GetPanjung_Item(?, ?, ?)}";
		CallStmtExec = connect.prepareCall(sql);


		/*

with qryComm1 do
begin
  select IIM_ITEM_CD, IIM_OSCD_CD, IIM_OSRL_CD, IIM_OSSB_CD
    from It_Item
  where IIM_USE_YN = ''Y''
    and IIM_ITEM_CD = :IIM_ITEM_CD
end

if not qryComm1.Eof then
begin
  Update ET_RSLT_ITEM
     Set ERI_OCS_CD   = :qryComm1.IIM_OSCD_CD
         ERI_OSRL_CD  = :qryComm1.IIM_OSRL_CD
         ERI_OSSB_CD  = :qryComm1.IIM_OSSB_CD
   Where ERI_EXAM_DT >= :EEA_EXAM_SDT
     And ERI_EXAM_DT <= :EEA_EXAM_EDT
     And ERI_ITEM_CD  = :IIM_ITEM_CD

   with qryComm2 do
   begin
     Select ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD
       From ET_RSLT_ITEM
      Where ERI_EXAM_DT >= :EEA_EXAM_SDT
        And ERI_EXAM_DT <= :EEA_EXAM_EDT
        And ERI_ITEM_CD =  :IIM_ITEM_CD
        And NVL(ERI_CNCL_YN, ''N'') <> ''Y''
        And NVL(ERI_RSLT_VL, '' '') <> '' ''
   end

   while not qryComm2.Eof do    // qryComm2에서 조회된 내역을 순차처리
   begin
     //DB Procedure
      @sp_GetPanjung_Item(:qryComm2.ERI_EXAM_DT , :qryComm2.ERI_EXAM_SQ , :qryComm2.ERI_ITEM_CD ):
      qryComm2.Next;
   end
end
		*/

		//
		sql = "SELECT IIM_ITEM_CD, IIM_OSCD_CD, IIM_OSRL_CD, IIM_OSSB_CD";
		sql += " FROM It_Item";
		sql += " WHERE IIM_USE_YN = 'Y'";
		sql += " AND IIM_ITEM_CD = '" + IIM_ITEM_CD + "'";
		
		sql_disp = sql;
		
		rsDetail = stmtDetail.executeQuery(sql);
		cRsDetail = new CRs(rsDetail);
		if(cRsDetail.next()) {
		
			//
			sql2 = "UPDATE ET_RSLT_ITEM SET ";
			sql2 += "  ERI_OCS_CD = '" + cRsDetail.getString("IIM_OSCD_CD") + "'";
			sql2 += ", ERI_OSRL_CD = '" + cRsDetail.getString("IIM_OSRL_CD") + "'";
			sql2 += ", ERI_OSSB_CD = '" + cRsDetail.getString("IIM_OSSB_CD") + "'";
			sql2 += " WHERE ERI_EXAM_DT >= '" + EEA_EXAM_SDT + "'";
			sql2 += " AND ERI_EXAM_DT <= '" + EEA_EXAM_EDT + "'";
			sql2 += " AND ERI_ITEM_CD = '" + IIM_ITEM_CD + "'";
			
			sql_disp += " " + sql2;
			
			stmtLoop.executeUpdate(sql2);

			//
			sql2 = " SELECT ERI_EXAM_DT, ERI_EXAM_SQ, ERI_ITEM_CD";
			sql2 += " FROM ET_RSLT_ITEM";
			sql2 += " WHERE ERI_EXAM_DT >= '" + EEA_EXAM_SDT + "'";
			sql2 += " AND ERI_EXAM_DT <= '" + EEA_EXAM_EDT + "'";
			sql2 += " AND ERI_ITEM_CD = '" + IIM_ITEM_CD + "'";
			sql2 += " AND NVL(ERI_CNCL_YN, 'N') <> 'Y'";
			sql2 += " AND NVL(ERI_RSLT_VL, ' ') <> ' '";

			sql_disp += " " + sql2;

			rsLoop = stmtLoop.executeQuery(sql2);
			cRsLoop = new CRs(rsLoop);
			while(cRsLoop.next()) {
			
				// @sp_GetPanjung_Item(:qryComm2.ERI_EXAM_DT , :qryComm2.ERI_EXAM_SQ , :qryComm2.ERI_ITEM_CD ):
				
				CallStmtExec.setString(1,  cRsLoop.getString("ERI_EXAM_DT"));
				CallStmtExec.setString(2,  cRsLoop.getString("ERI_EXAM_SQ"));
				CallStmtExec.setString(3,  cRsLoop.getString("ERI_ITEM_CD"));

				CallStmtExec.executeUpdate();
			}
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uItem_Update_btnUpdateClick_001 \n";
			G_INFO += "설명 : 검사항목 OCS코드 조회 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EEA_EXAM_SDT : " + EEA_EXAM_SDT + " \n";
			G_INFO += " EEA_EXAM_EDT : " + EEA_EXAM_EDT + " \n";
			G_INFO += " IIM_ITEM_CD : " + IIM_ITEM_CD + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql_disp + " \n";
			G_INFO += "-->";

		out.clear();		// include된 파일안의 공백 제거
		response.addHeader("Content-type", "text/xml");
%><?xml version="1.0" encoding="UTF-8"?>

<%= G_INFO%>

<nurionXml>
	<resultCode>200</resultCode>
	<resultXml></resultXml>
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

		if(rsDetail != null) {
			rsDetail.close();
			rsDetail = null;
		}

		if(rsLoop != null) {
			rsLoop.close();
			rsLoop = null;
		}

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}

		if(stmtDetail != null) {
			stmtDetail.close();
			stmtDetail = null;
		}

		if(stmtLoop != null) {
			stmtLoop.close();
			stmtLoop = null;
		}

		if(CallStmtExec != null) {
			CallStmtExec.close();
			CallStmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
