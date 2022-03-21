<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String STABLE_KD = htMethod.get("STABLE_KD");
		String EXAM_DT = htMethod.get("EXAM_DT");
		String EXAM_SQ = htMethod.get("EXAM_SQ");

		//
		if(STABLE_KD == null) { STABLE_KD = ""; }
		if(EXAM_DT == null) { EXAM_DT = ""; }
		if(EXAM_SQ == null) { EXAM_SQ = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		/*

  if :sTable_Kd = 'STMC' then
  begin
    Delete ET_CANCER_STMC
    Where  ECS_EXAM_DT = :EXAM_DT
      And  ECS_EXAM_SQ = :EXAM_SQ

    Insert Into ET_CANCER_STMC
     (ECS_EXAM_DT ,ECS_EXAM_SQ  )
     VALUES
     ( :EXAM_DT,  :EXAM_SQ)
  end
  else if :sTable_Kd = 'COLO' then
  begin
    Delete ET_CANCER_COLO
    Where  ECC_EXAM_DT = :EXAM_DT
      And  ECC_EXAM_SQ = :EXAM_SQ

    Insert Into ET_CANCER_COLO
     (ECC_EXAM_DT  ,ECC_EXAM_SQ  )
     VALUES
     ( :EXAM_DT,  :EXAM_SQ)
  end
  else if :sTable_Kd = 'LIVER' then
  begin
    Delete ET_CANCER_LIVER
    Where  ECL_EXAM_DT = :EXAM_DT
      And  ECL_EXAM_SQ = :EXAM_SQ

    Insert Into ET_CANCER_LIVER
     (ECL_EXAM_DT  ,ECL_EXAM_SQ  )
     VALUES
     ( :EXAM_DT,  :EXAM_SQ)
  end
  else if :sTable_Kd = 'BRST' then
  begin
    Delete ET_CANCER_BRST
    Where  ECB_EXAM_DT = :EXAM_DT
      And  ECB_EXAM_SQ = :EXAM_SQ

    Insert Into ET_CANCER_BRST
     (ECB_EXAM_DT  ,ECB_EXAM_SQ  )
     VALUES
     ( :EXAM_DT,  :EXAM_SQ)
  end
  else if :sTable_Kd = 'CRVC' then
  begin
    Delete ET_CANCER_CRVC
    Where  ECV_EXAM_DT = :EXAM_DT
      And  ECV_EXAM_SQ = :EXAM_SQ

    Insert Into ET_CANCER_CRVC
     (ECV_EXAM_DT  ,ECV_EXAM_SQ  )
     VALUES
     ( :EXAM_DT,  :EXAM_SQ)
  end
  else if :sTable_Kd = 'LUNG' then
  begin
    Delete ET_CANCER_LUNG
    Where  ECG_EXAM_DT = :EXAM_DT
      And  ECG_EXAM_SQ = :EXAM_SQ

    Insert Into ET_CANCER_LUNG
     (ECG_EXAM_DT  ,  ECG_EXAM_SQ)
     VALUES
     ( :EXAM_DT,  :EXAM_SQ)
  end

		*/

		if(STABLE_KD.equals("STMC")) {
			sql = "DELETE ET_CANCER_STMC";
			sql += " WHERE ECS_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ECS_EXAM_SQ = '" + EXAM_SQ + "'";

			stmtExec.executeUpdate(sql);

			sql = "INSERT INTO ET_CANCER_STMC (ECS_EXAM_DT ,ECS_EXAM_SQ ) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ")";

			stmtExec.executeUpdate(sql);
		}
		else if(STABLE_KD.equals("COLO")) {
			sql = "DELETE ET_CANCER_COLO";
			sql += " WHERE ECC_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ECC_EXAM_SQ = '" + EXAM_SQ + "'";

			stmtExec.executeUpdate(sql);

			sql = "INSERT INTO ET_CANCER_COLO (ECC_EXAM_DT ,ECC_EXAM_SQ ) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ")";

			stmtExec.executeUpdate(sql);
		}
		else if(STABLE_KD.equals("LIVER")) {
			sql = "DELETE ET_CANCER_LIVER";
			sql += " WHERE ECL_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ECL_EXAM_SQ = '" + EXAM_SQ + "'";

			stmtExec.executeUpdate(sql);

			sql = "INSERT INTO ET_CANCER_LIVER (ECL_EXAM_DT ,ECL_EXAM_SQ ) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ")";

			stmtExec.executeUpdate(sql);
		}
		else if(STABLE_KD.equals("BRST")) {
			sql = "DELETE ET_CANCER_BRST";
			sql += " WHERE ECB_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ECB_EXAM_SQ = '" + EXAM_SQ + "'";

			stmtExec.executeUpdate(sql);

			sql = "INSERT INTO ET_CANCER_BRST (ECB_EXAM_DT ,ECB_EXAM_SQ ) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ")";

			stmtExec.executeUpdate(sql);
		}
		else if(STABLE_KD.equals("CRVC")) {
			sql = "DELETE ET_CANCER_CRVC";
			sql += " WHERE ECV_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ECV_EXAM_SQ = '" + EXAM_SQ + "'";

			stmtExec.executeUpdate(sql);

			sql = "INSERT INTO ET_CANCER_CRVC (ECV_EXAM_DT ,ECV_EXAM_SQ ) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ")";

			stmtExec.executeUpdate(sql);
		}
		else if(STABLE_KD.equals("LUNG")) {
			sql = "DELETE ET_CANCER_LUNG";
			sql += " WHERE ECG_EXAM_DT = '" + EXAM_DT + "'";
			sql += " AND ECG_EXAM_SQ = '" + EXAM_SQ + "'";

			stmtExec.executeUpdate(sql);

			sql = "INSERT INTO ET_CANCER_LUNG (ECG_EXAM_DT , ECG_EXAM_SQ) VALUES (";
			sql += "  '" + EXAM_DT + "'";
			sql += ", '" + EXAM_SQ + "'";
			sql += ")";

			stmtExec.executeUpdate(sql);
		}

			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uCancer_Rslt_2020_ufCancerLoadResult_001 \n";
			G_INFO += "설명 : 암검진 기존데이타 불러오기(기초 데이타 생성) \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " STABLE_KD : " + STABLE_KD + " \n";
			G_INFO += " EXAM_DT : " + EXAM_DT + " \n";
			G_INFO += " EXAM_SQ : " + EXAM_SQ + " \n";
			G_INFO += "\n\n";

			G_INFO += "질의문 : " + sql + " \n";
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

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
