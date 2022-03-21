<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uRsvn_Acpt_btnSaveClick_012(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		Connection connect = argStmtExec.getConnection();
		CallableStatement CallStmtExec = null;

		try {

			String RSVN_NO = (String) argHtMethod.get("RSVN_NO");
			String CHART_NO = (String) argHtMethod.get("CHART_NO");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String CUST_NO = (String) argHtMethod.get("CUST_NO");
			String PSNL_ID = (String) argHtMethod.get("PSNL_ID");
			String PSNL_NM = (String) argHtMethod.get("PSNL_NM");
			String SEX_CD = (String) argHtMethod.get("SEX_CD");
			String ZIP_CD = (String) argHtMethod.get("ZIP_CD");
			String ZIP_SQ = (String) argHtMethod.get("ZIP_SQ");
			String ZIP_AR = (String) argHtMethod.get("ZIP_AR");
			String DETAIL_AR = (String) argHtMethod.get("DETAIL_AR");
			String BLDG_NO = (String) argHtMethod.get("BLDG_NO");
			String TEL_NO = (String) argHtMethod.get("TEL_NO");
			String MOBL_NO = (String) argHtMethod.get("MOBL_NO");
			String EMAIL_AR = (String) argHtMethod.get("EMAIL_AR");

			//
			if(RSVN_NO == null) { RSVN_NO = ""; }
			if(CHART_NO == null) { CHART_NO = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(CUST_NO == null) { CUST_NO = ""; }
			if(PSNL_ID == null) { PSNL_ID = ""; }
			if(PSNL_NM == null) { PSNL_NM = ""; }
			if(SEX_CD == null) { SEX_CD = ""; }
			if(ZIP_CD == null) { ZIP_CD = ""; }
			if(ZIP_SQ == null) { ZIP_SQ = ""; }
			if(ZIP_AR == null) { ZIP_AR = ""; }
			if(DETAIL_AR == null) { DETAIL_AR = ""; }
			if(BLDG_NO == null) { BLDG_NO = ""; }
			if(TEL_NO == null) { TEL_NO = ""; }
			if(MOBL_NO == null) { MOBL_NO = ""; }
			if(EMAIL_AR == null) { EMAIL_AR = ""; }

			sql += " UPDATE RT_RSVT ";
			sql += " SET RRT_PSNL_ID = ?, ";
			sql += " 	RRT_PSNL_NM = ?, ";
			sql += " 	RRT_CUST_NO = ?, ";
			sql += " 	RRT_SEX_CD = ?, ";
			sql += " 	RRT_ZIP_CD = ?, ";
			sql += " 	RRT_ZIP_SQ = ?, ";
			sql += " 	RRT_ZIP_AR = ?, ";
			sql += " 	RRT_ROAD_AR = ?, ";
			sql += " 	RRT_BLDG_NO = ?, ";
			sql += " 	RRT_TEL_NO = ?, ";
			sql += " 	RRT_MOBL_NO = ?, ";
			sql += " 	RRT_EMAIL_AR = ? ";


			if(!RSVN_NO.equals("")){
				sql += " WHERE RRT_RSVN_NO = ? ";
			} else {
				sql += " WHERE RRT_CHART_NO = ? ";
			}

			sql += " AND RRT_EXAM_DT >= ? ";

			CallStmtExec = connect.prepareCall(sql);

			CallStmtExec.setString(1, PSNL_ID);
			CallStmtExec.setString(2, PSNL_NM);
			CallStmtExec.setString(3, CUST_NO);
			CallStmtExec.setString(4, SEX_CD);
			CallStmtExec.setString(5, ZIP_CD);
			CallStmtExec.setString(6, ZIP_SQ);
			CallStmtExec.setString(7, ZIP_AR);
			CallStmtExec.setString(8, DETAIL_AR);
			CallStmtExec.setString(9, BLDG_NO);
			CallStmtExec.setString(10, TEL_NO);
			CallStmtExec.setString(11, MOBL_NO);
			CallStmtExec.setString(12, EMAIL_AR);

			if(!RSVN_NO.equals("")){
				CallStmtExec.setString(13, RSVN_NO);
			} else {
				CallStmtExec.setString(13, CHART_NO);
			}

			CallStmtExec.setString(14, EXAM_DT);


			CallStmtExec.executeUpdate();

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
