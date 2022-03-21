<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%@ include file="/inc_prg/common.jsp"%>
<%
	// 전달자료
	HashMap<String, Object> htData = null;
	HashMap<String, String> htMethod = null;

	// DB객체
	Statement stmtExec = null;
	PreparedStatement pstmt = null;

	//
	String G_INFO = "";

	try {
%>
<%@ include file="/inc_prg/connect.jsp"%>
<%
		// 전달자료
		htData = (HashMap<String, Object>)request.getAttribute("htData");
		htMethod = (HashMap<String, String>)request.getAttribute("htMethod_1");

		String EMP_NO = htMethod.get("EMP_NO");
		String PASS_WD = htMethod.get("PASS_WD");
		String MANA_KD = htMethod.get("MANA_KD");
		String PENL_ID = htMethod.get("PENL_ID");
		String PENL_NM = htMethod.get("PENL_NM");
		String DEPT_CD = htMethod.get("DEPT_CD");
		String POSI_CD = htMethod.get("POSI_CD");
		String LICEN1_CD = htMethod.get("LICEN1_CD");
		String LICEN2_CD = htMethod.get("LICEN2_CD");
		String LICEN1_NO = htMethod.get("LICEN1_NO");
		String LICEN2_NO = htMethod.get("LICEN2_NO");
		String MOBL_NO = htMethod.get("MOBL_NO");
		String EMAI_AR = htMethod.get("EMAI_AR");
		String BIRH_DT = htMethod.get("BIRH_DT");
		String ENTR_DT = htMethod.get("ENTR_DT");
		String RETIR_DT = htMethod.get("RETIR_DT");
		String ACCP_KD = htMethod.get("ACCP_KD");
		String ACCP1_ID = htMethod.get("ACCP1_ID");
		String ACCP2_ID = htMethod.get("ACCP2_ID");
		String ADDR_KD = htMethod.get("ADDR_KD");
		String ZIP_CD = htMethod.get("ZIP_CD");
		String ZIP_AR = htMethod.get("ZIP_AR");
		String ROAD_AR = htMethod.get("ROAD_AR");
		String MARY_DT = htMethod.get("MARY_DT");
		String SIGN_IM = htMethod.get("SIGN_IM");
		String STOMA_DR = htMethod.get("STOMA_DR");
		String COLON_DR = htMethod.get("COLON_DR");
		String LIVER_DR = htMethod.get("LIVER_DR");
		String BAST_DR = htMethod.get("BAST_DR");
		String UTER_DR = htMethod.get("UTER_DR");
		String LUNG_DR = htMethod.get("LUNG_DR");
		String USER_TX = htMethod.get("USER_TX");
		String AUTH_GP = htMethod.get("AUTH_GP");
		String USE_YN = htMethod.get("USE_YN");
		String INPT_ID = htMethod.get("INPT_ID");
		String MODI_ID = htMethod.get("MODI_ID");
		String ENTR_ID = htMethod.get("ENTR_ID");
		String ENCRYP_GB = htMethod.get("ENCRYP_GB");
		String SEND_CD = htMethod.get("SEND_CD");
		String PLCE_CD = htMethod.get("PLCE_CD");
		String DIVI_CD = htMethod.get("DIVI_CD");
		String CKUP_DR = htMethod.get("CKUP_DR");
		String PATH_DR = htMethod.get("PATH_DR");
		String DECI_DR = htMethod.get("DECI_DR");
		String DPAN_DR = htMethod.get("DPAN_DR");
		String COLL_DR = htMethod.get("COLL_DR");
		String ANOTHER_NO = htMethod.get("ANOTHER_NO");

		//
		if(EMP_NO == null) { EMP_NO = ""; }
		if(PASS_WD == null) { PASS_WD = ""; }
		if(MANA_KD == null) { MANA_KD = ""; }
		if(PENL_ID == null) { PENL_ID = ""; }
		if(PENL_NM == null) { PENL_NM = ""; }
		if(DEPT_CD == null) { DEPT_CD = ""; }
		if(POSI_CD == null) { POSI_CD = ""; }
		if(LICEN1_CD == null) { LICEN1_CD = ""; }
		if(LICEN2_CD == null) { LICEN2_CD = ""; }
		if(LICEN1_NO == null) { LICEN1_NO = ""; }
		if(LICEN2_NO == null) { LICEN2_NO = ""; }
		if(MOBL_NO == null) { MOBL_NO = ""; }
		if(EMAI_AR == null) { EMAI_AR = ""; }
		if(BIRH_DT == null) { BIRH_DT = ""; }
		if(ENTR_DT == null) { ENTR_DT = ""; }
		if(RETIR_DT == null) { RETIR_DT = ""; }
		if(ACCP_KD == null) { ACCP_KD = ""; }
		if(ACCP1_ID == null) { ACCP1_ID = ""; }
		if(ACCP2_ID == null) { ACCP2_ID = ""; }
		if(ADDR_KD == null) { ADDR_KD = ""; }
		if(ZIP_CD == null) { ZIP_CD = ""; }
		if(ZIP_AR == null) { ZIP_AR = ""; }
		if(ROAD_AR == null) { ROAD_AR = ""; }
		if(MARY_DT == null) { MARY_DT = ""; }
		if(SIGN_IM == null) { SIGN_IM = ""; }
		if(STOMA_DR == null) { STOMA_DR = ""; }
		if(COLON_DR == null) { COLON_DR = ""; }
		if(LIVER_DR == null) { LIVER_DR = ""; }
		if(BAST_DR == null) { BAST_DR = ""; }
		if(UTER_DR == null) { UTER_DR = ""; }
		if(LUNG_DR == null) { LUNG_DR = ""; }
		if(USER_TX == null) { USER_TX = ""; }
		if(AUTH_GP == null) { AUTH_GP = ""; }
		if(USE_YN == null) { USE_YN = ""; }
		if(INPT_ID == null) { INPT_ID = ""; }
		if(MODI_ID == null) { MODI_ID = ""; }
		if(ENTR_ID == null) { ENTR_ID = ""; }
		if(ENCRYP_GB == null) { ENCRYP_GB = ""; }
		if(SEND_CD == null) { SEND_CD = ""; }
		if(PLCE_CD == null) { PLCE_CD = ""; }
		if(DIVI_CD == null) { DIVI_CD = ""; }
		if(CKUP_DR == null) { CKUP_DR = ""; }
		if(PATH_DR == null) { PATH_DR = ""; }
		if(DECI_DR == null) { DECI_DR = ""; }
		if(DPAN_DR == null) { DPAN_DR = ""; }
		if(COLL_DR == null) { COLL_DR = ""; }
		if(ANOTHER_NO == null) { ANOTHER_NO = ""; }

		// DB객체
		stmtExec = connect.createStatement();

		/*

 INSERT INTO IT_AUTH_USER                                                                        
( IAU_EMP_NO,IAU_PASS_WD,IAU_MANA_KD,IAU_PENL_ID,IAU_PENL_NM,IAU_DEPT_CD,IAU_POSI_CD,            
  IAU_LICEN1_CD,IAU_LICEN2_CD,IAU_LICEN1_NO,IAU_LICEN2_NO,IAU_MOBL_NO,                           
  IAU_EMAI_AR,IAU_BIRH_DT,IAU_ENTR_DT,IAU_RETIR_DT,IAU_ACCP_KD,IAU_ACCP1_ID,                     
  IAU_ACCP2_ID,IAU_ADDR_KD,IAU_ZIP_CD,IAU_ZIP_AR,IAU_ROAD_AR,IAU_MARY_DT,IAU_SIGN_IM,            
         IAU_STOMA_DR,IAU_COLON_DR,IAU_LIVER_DR,IAU_BAST_DR, IAU_UTER_DR, IAU_LUNG_DR,                  
  IAU_USER_TX,IAU_AUTH_GP,IAU_USE_YN,IAU_INPT_ID,IAU_INPT_DTT,IAU_MODI_ID,IAU_MODI_DTT,          
  IAU_ENTR_ID, IAU_ENCRYP_GB, IAU_SEND_CD, IAU_PLCE_CD, IAU_DIVI_CD,                             
  IAU_CKUP_DR, IAU_PATH_DR, IAU_DECI_DR, IAU_DPAN_DR, IAU_COLL_DR, IAU_ANOTHER_NO )              
VALUES                                                                                           
( :EMP_NO, :PASS_WD,:MANA_KD,:PENL_ID,:PENL_NM,:DEPT_CD,                 
  :POSI_CD,:LICEN1_CD,:LICEN2_CD,:LICEN1_NO,:LICEN2_NO,:MOBL_NO,         
  :EMAI_AR,:BIRH_DT,:ENTR_DT,:RETIR_DT,:ACCP_KD,:ACCP1_ID,:ACCP2_ID, 
  :ADDR_KD,:ZIP_CD,:ZIP_AR,:ROAD_AR,:MARY_DT, :SIGN_IM,                  
  :STOMA_DR,:COLON_DR,:LIVER_DR,:BAST_DR ,:UTER_DR, :LUNG_DR,            
  :USER_TX,:AUTH_GP,:USE_YN,:INPT_ID, SYSDATE,:MODI_ID, SYSDATE,         
  :ENTR_ID,:ENCRYP_GB, :SEND_CD, :PLCE_CD, :DIVI_CD,                         
  :CKUP_DR,:PATH_DR, :DECI_DR, :DPAN_DR, :COLL_DR, :ANOTHER_NO )         

		*/

		sql = "INSERT INTO IT_AUTH_USER (IAU_EMP_NO,IAU_PASS_WD,IAU_MANA_KD,IAU_PENL_ID,IAU_PENL_NM,IAU_DEPT_CD,IAU_POSI_CD, IAU_LICEN1_CD,IAU_LICEN2_CD,IAU_LICEN1_NO,IAU_LICEN2_NO,IAU_MOBL_NO, IAU_EMAI_AR,IAU_BIRH_DT,IAU_ENTR_DT,IAU_RETIR_DT,IAU_ACCP_KD,IAU_ACCP1_ID, IAU_ACCP2_ID,IAU_ADDR_KD,IAU_ZIP_CD,IAU_ZIP_AR,IAU_ROAD_AR,IAU_MARY_DT,IAU_SIGN_IM, IAU_STOMA_DR,IAU_COLON_DR,IAU_LIVER_DR,IAU_BAST_DR, IAU_UTER_DR, IAU_LUNG_DR, IAU_USER_TX,IAU_AUTH_GP,IAU_USE_YN,IAU_INPT_ID,IAU_INPT_DTT,IAU_MODI_ID,IAU_MODI_DTT, IAU_ENTR_ID, IAU_ENCRYP_GB, IAU_SEND_CD, IAU_PLCE_CD, IAU_DIVI_CD, IAU_CKUP_DR, IAU_PATH_DR, IAU_DECI_DR, IAU_DPAN_DR, IAU_COLL_DR, IAU_ANOTHER_NO) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SYSDATE, ?, SYSDATE, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		pstmt = connect.prepareStatement(sql);

		pstmt.setString(1, EMP_NO);
		pstmt.setString(2, PASS_WD);
		pstmt.setString(3, MANA_KD);
		pstmt.setString(4, PENL_ID);
		pstmt.setString(5, PENL_NM);
		pstmt.setString(6, DEPT_CD);
		pstmt.setString(7, POSI_CD);
		pstmt.setString(8, LICEN1_CD);
		pstmt.setString(9, LICEN2_CD);
		pstmt.setString(10, LICEN1_NO);
		pstmt.setString(11, LICEN2_NO);
		pstmt.setString(12, MOBL_NO);
		pstmt.setString(13, EMAI_AR);
		pstmt.setString(14, BIRH_DT);
		pstmt.setString(15, ENTR_DT);
		pstmt.setString(16, RETIR_DT);
		pstmt.setString(17, ACCP_KD);
		pstmt.setString(18, ACCP1_ID);
		pstmt.setString(19, ACCP2_ID);
		pstmt.setString(20, ADDR_KD);
		pstmt.setString(21, ZIP_CD);
		pstmt.setString(22, ZIP_AR);
		pstmt.setString(23, ROAD_AR);
		pstmt.setString(24, MARY_DT);
		pstmt.setBytes(25, SIGN_IM.getBytes());
		pstmt.setString(26, STOMA_DR);
		pstmt.setString(27, COLON_DR);
		pstmt.setString(28, LIVER_DR);
		pstmt.setString(29, BAST_DR);
		pstmt.setString(30, UTER_DR);
		pstmt.setString(31, LUNG_DR);
		pstmt.setString(32, USER_TX);
		pstmt.setString(33, AUTH_GP);
		pstmt.setString(34, USE_YN);
		pstmt.setString(35, INPT_ID);
		pstmt.setString(36, MODI_ID);
		pstmt.setString(37, ENTR_ID);
		pstmt.setString(38, ENCRYP_GB);
		pstmt.setString(39, SEND_CD);
		pstmt.setString(40, PLCE_CD);
		pstmt.setString(41, DIVI_CD);
		pstmt.setString(42, CKUP_DR);
		pstmt.setString(43, PATH_DR);
		pstmt.setString(44, DECI_DR);
		pstmt.setString(45, DPAN_DR);
		pstmt.setString(46, COLL_DR);
		pstmt.setString(47, ANOTHER_NO);

		pstmt.executeUpdate();
			//
			G_INFO += "<!-- \n";
			G_INFO += "서비스명 : uIT_User_re_Up_Insert_002 \n";
			G_INFO += "설명 : 사용자 정보 입력 \n";
			G_INFO += "\n\n";

			G_INFO += "전달인자 : \n";
			G_INFO += " EMP_NO : " + EMP_NO + " \n";
			G_INFO += " PASS_WD : " + PASS_WD + " \n";
			G_INFO += " MANA_KD : " + MANA_KD + " \n";
			G_INFO += " PENL_ID : " + PENL_ID + " \n";
			G_INFO += " PENL_NM : " + PENL_NM + " \n";
			G_INFO += " DEPT_CD : " + DEPT_CD + " \n";
			G_INFO += " POSI_CD : " + POSI_CD + " \n";
			G_INFO += " LICEN1_CD : " + LICEN1_CD + " \n";
			G_INFO += " LICEN2_CD : " + LICEN2_CD + " \n";
			G_INFO += " LICEN1_NO : " + LICEN1_NO + " \n";
			G_INFO += " LICEN2_NO : " + LICEN2_NO + " \n";
			G_INFO += " MOBL_NO : " + MOBL_NO + " \n";
			G_INFO += " EMAI_AR : " + EMAI_AR + " \n";
			G_INFO += " BIRH_DT : " + BIRH_DT + " \n";
			G_INFO += " ENTR_DT : " + ENTR_DT + " \n";
			G_INFO += " RETIR_DT : " + RETIR_DT + " \n";
			G_INFO += " ACCP_KD : " + ACCP_KD + " \n";
			G_INFO += " ACCP1_ID : " + ACCP1_ID + " \n";
			G_INFO += " ACCP2_ID : " + ACCP2_ID + " \n";
			G_INFO += " ADDR_KD : " + ADDR_KD + " \n";
			G_INFO += " ZIP_CD : " + ZIP_CD + " \n";
			G_INFO += " ZIP_AR : " + ZIP_AR + " \n";
			G_INFO += " ROAD_AR : " + ROAD_AR + " \n";
			G_INFO += " MARY_DT : " + MARY_DT + " \n";
			G_INFO += " SIGN_IM : " + SIGN_IM + " \n";
			G_INFO += " STOMA_DR : " + STOMA_DR + " \n";
			G_INFO += " COLON_DR : " + COLON_DR + " \n";
			G_INFO += " LIVER_DR : " + LIVER_DR + " \n";
			G_INFO += " BAST_DR : " + BAST_DR + " \n";
			G_INFO += " UTER_DR : " + UTER_DR + " \n";
			G_INFO += " LUNG_DR : " + LUNG_DR + " \n";
			G_INFO += " USER_TX : " + USER_TX + " \n";
			G_INFO += " AUTH_GP : " + AUTH_GP + " \n";
			G_INFO += " USE_YN : " + USE_YN + " \n";
			G_INFO += " INPT_ID : " + INPT_ID + " \n";
			G_INFO += " MODI_ID : " + MODI_ID + " \n";
			G_INFO += " ENTR_ID : " + ENTR_ID + " \n";
			G_INFO += " ENCRYP_GB : " + ENCRYP_GB + " \n";
			G_INFO += " SEND_CD : " + SEND_CD + " \n";
			G_INFO += " PLCE_CD : " + PLCE_CD + " \n";
			G_INFO += " DIVI_CD : " + DIVI_CD + " \n";
			G_INFO += " CKUP_DR : " + CKUP_DR + " \n";
			G_INFO += " PATH_DR : " + PATH_DR + " \n";
			G_INFO += " DECI_DR : " + DECI_DR + " \n";
			G_INFO += " DPAN_DR : " + DPAN_DR + " \n";
			G_INFO += " COLL_DR : " + COLL_DR + " \n";
			G_INFO += " ANOTHER_NO : " + ANOTHER_NO + " \n";
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
	<sql><![CDATA[<%= sql%>]]></sql>
</nurionXml>

<%
	} finally {

		if(stmtExec != null) {
			stmtExec.close();
			stmtExec = null;
		}

		if(pstmt != null) {
			pstmt.close();
			pstmt = null;
		}
%>
<%@ include file="/inc_prg/disconnect.jsp"%>
<%
	}
%>
