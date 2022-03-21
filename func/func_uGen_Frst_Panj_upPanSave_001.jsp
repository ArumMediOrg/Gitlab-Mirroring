<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uGen_Frst_Panj_upPanSave_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String SMODE = (String) argHtMethod.get("SMODE");
			String EXAM_DT = (String) argHtMethod.get("EXAM_DT");
			String EXAM_SQ = (String) argHtMethod.get("EXAM_SQ");
			String HISJIN = (String) argHtMethod.get("HISJIN");
			String HISMED = (String) argHtMethod.get("HISMED");
			String LIVEGBN = (String) argHtMethod.get("LIVEGBN");
			String LIVESMK = (String) argHtMethod.get("LIVESMK");
			String LIVEDRK = (String) argHtMethod.get("LIVEDRK");
			String LIVESPT = (String) argHtMethod.get("LIVESPT");
			String LIVEWET = (String) argHtMethod.get("LIVEWET");
			String SEDPLIST = (String) argHtMethod.get("SEDPLIST");
			String RVIEW = (String) argHtMethod.get("RVIEW");
			String BVIEW = (String) argHtMethod.get("BVIEW");
			String EXINJUR = (String) argHtMethod.get("EXINJUR");
			String DEPRESS = (String) argHtMethod.get("DEPRESS");
			String CNDTION = (String) argHtMethod.get("CNDTION");
			String OPIN1 = (String) argHtMethod.get("OPIN1");
			String OPIN2 = (String) argHtMethod.get("OPIN2");
			String OPIN3 = (String) argHtMethod.get("OPIN3");
			String OPIN4 = (String) argHtMethod.get("OPIN4");
			String CGNTION = (String) argHtMethod.get("CGNTION");
			String RESULTB_1 = (String) argHtMethod.get("RESULTB_1");
			String RESULTB_2 = (String) argHtMethod.get("RESULTB_2");
			String RESULTB_3 = (String) argHtMethod.get("RESULTB_3");
			String RESULTB_4 = (String) argHtMethod.get("RESULTB_4");
			String RESULTB_5 = (String) argHtMethod.get("RESULTB_5");
			String RESULTB_6 = (String) argHtMethod.get("RESULTB_6");
			String RESULTB_7 = (String) argHtMethod.get("RESULTB_7");
			String RESULTB_8 = (String) argHtMethod.get("RESULTB_8");
			String RESULTB_9 = (String) argHtMethod.get("RESULTB_9");
			String RESULTB_10 = (String) argHtMethod.get("RESULTB_10");
			String RESULTB_11 = (String) argHtMethod.get("RESULTB_11");
			String RESULTR1_1 = (String) argHtMethod.get("RESULTR1_1");
			String RESULTR1_2 = (String) argHtMethod.get("RESULTR1_2");
			String RESULTR1_3 = (String) argHtMethod.get("RESULTR1_3");
			String RESULTR1_4 = (String) argHtMethod.get("RESULTR1_4");
			String RESULTR1_5 = (String) argHtMethod.get("RESULTR1_5");
			String RESULTR1_6 = (String) argHtMethod.get("RESULTR1_6");
			String RESULTR1_7 = (String) argHtMethod.get("RESULTR1_7");
			String RESULTR1_8 = (String) argHtMethod.get("RESULTR1_8");
			String RESULTR1_9 = (String) argHtMethod.get("RESULTR1_9");
			String RESULTR1_10 = (String) argHtMethod.get("RESULTR1_10");
			String RESULTR2_1 = (String) argHtMethod.get("RESULTR2_1");
			String RESULTR2_2 = (String) argHtMethod.get("RESULTR2_2");
			String RESULTRD_1 = (String) argHtMethod.get("RESULTRD_1");
			String RESULTRD_2 = (String) argHtMethod.get("RESULTRD_2");
			String RESULTRD_3 = (String) argHtMethod.get("RESULTRD_3");
			String RESULTRD_4 = (String) argHtMethod.get("RESULTRD_4");
			String RESULTRD_5 = (String) argHtMethod.get("RESULTRD_5");
			String RESULTRD_ETC = (String) argHtMethod.get("RESULTRD_ETC");
			String TRANC_DATE = (String) argHtMethod.get("TRANC_DATE");
			String RESULT_DATE = (String) argHtMethod.get("RESULT_DATE");
			String RESULT8_ETC = (String) argHtMethod.get("RESULT8_ETC");
			String DOCTORFIR = (String) argHtMethod.get("DOCTORFIR");
			String DOCTORQQN = (String) argHtMethod.get("DOCTORQQN");
			String PANRETA = (String) argHtMethod.get("PANRETA");
			String PANRETB = (String) argHtMethod.get("PANRETB");
			String PANRETR1 = (String) argHtMethod.get("PANRETR1");
			String PANRETR2 = (String) argHtMethod.get("PANRETR2");
			String PANRETRD = (String) argHtMethod.get("PANRETRD");
			String FIX_YN = (String) argHtMethod.get("FIX_YN");
			String USER_ID = (String) argHtMethod.get("USER_ID");

			//
			if(SMODE == null) { SMODE = ""; }
			if(EXAM_DT == null) { EXAM_DT = ""; }
			if(EXAM_SQ == null) { EXAM_SQ = ""; }
			if(HISJIN == null) { HISJIN = ""; }
			if(HISMED == null) { HISMED = ""; }
			if(LIVEGBN == null) { LIVEGBN = ""; }
			if(LIVESMK == null) { LIVESMK = ""; }
			if(LIVEDRK == null) { LIVEDRK = ""; }
			if(LIVESPT == null) { LIVESPT = ""; }
			if(LIVEWET == null) { LIVEWET = ""; }
			if(SEDPLIST == null) { SEDPLIST = ""; }
			if(RVIEW == null) { RVIEW = ""; }
			if(BVIEW == null) { BVIEW = ""; }
			if(EXINJUR == null) { EXINJUR = ""; }
			if(DEPRESS == null) { DEPRESS = ""; }
			if(CNDTION == null) { CNDTION = ""; }
			if(OPIN1 == null) { OPIN1 = ""; }
			if(OPIN2 == null) { OPIN2 = ""; }
			if(OPIN3 == null) { OPIN3 = ""; }
			if(OPIN4 == null) { OPIN4 = ""; }
			if(CGNTION == null) { CGNTION = ""; }
			if(RESULTB_1 == null) { RESULTB_1 = ""; }
			if(RESULTB_2 == null) { RESULTB_2 = ""; }
			if(RESULTB_3 == null) { RESULTB_3 = ""; }
			if(RESULTB_4 == null) { RESULTB_4 = ""; }
			if(RESULTB_5 == null) { RESULTB_5 = ""; }
			if(RESULTB_6 == null) { RESULTB_6 = ""; }
			if(RESULTB_7 == null) { RESULTB_7 = ""; }
			if(RESULTB_8 == null) { RESULTB_8 = ""; }
			if(RESULTB_9 == null) { RESULTB_9 = ""; }
			if(RESULTB_10 == null) { RESULTB_10 = ""; }
			if(RESULTB_11 == null) { RESULTB_11 = ""; }
			if(RESULTR1_1 == null) { RESULTR1_1 = ""; }
			if(RESULTR1_2 == null) { RESULTR1_2 = ""; }
			if(RESULTR1_3 == null) { RESULTR1_3 = ""; }
			if(RESULTR1_4 == null) { RESULTR1_4 = ""; }
			if(RESULTR1_5 == null) { RESULTR1_5 = ""; }
			if(RESULTR1_6 == null) { RESULTR1_6 = ""; }
			if(RESULTR1_7 == null) { RESULTR1_7 = ""; }
			if(RESULTR1_8 == null) { RESULTR1_8 = ""; }
			if(RESULTR1_9 == null) { RESULTR1_9 = ""; }
			if(RESULTR1_10 == null) { RESULTR1_10 = ""; }
			if(RESULTR2_1 == null) { RESULTR2_1 = ""; }
			if(RESULTR2_2 == null) { RESULTR2_2 = ""; }
			if(RESULTRD_1 == null) { RESULTRD_1 = ""; }
			if(RESULTRD_2 == null) { RESULTRD_2 = ""; }
			if(RESULTRD_3 == null) { RESULTRD_3 = ""; }
			if(RESULTRD_4 == null) { RESULTRD_4 = ""; }
			if(RESULTRD_5 == null) { RESULTRD_5 = ""; }
			if(RESULTRD_ETC == null) { RESULTRD_ETC = ""; }
			if(TRANC_DATE == null) { TRANC_DATE = ""; }
			if(RESULT_DATE == null) { RESULT_DATE = ""; }
			if(RESULT8_ETC == null) { RESULT8_ETC = ""; }
			if(DOCTORFIR == null) { DOCTORFIR = ""; }
			if(DOCTORQQN == null) { DOCTORQQN = ""; }
			if(PANRETA == null) { PANRETA = ""; }
			if(PANRETB == null) { PANRETB = ""; }
			if(PANRETR1 == null) { PANRETR1 = ""; }
			if(PANRETR2 == null) { PANRETR2 = ""; }
			if(PANRETRD == null) { PANRETRD = ""; }
			if(FIX_YN == null) { FIX_YN = ""; }
			if(USER_ID == null) { USER_ID = ""; }

			//
			SMODE = CTr.Replace(SMODE, "'", "''");
			EXAM_DT = CTr.Replace(EXAM_DT, "'", "''");
			EXAM_SQ = CTr.Replace(EXAM_SQ, "'", "''");
			HISJIN = CTr.Replace(HISJIN, "'", "''");
			HISMED = CTr.Replace(HISMED, "'", "''");
			LIVEGBN = CTr.Replace(LIVEGBN, "'", "''");
			LIVESMK = CTr.Replace(LIVESMK, "'", "''");
			LIVEDRK = CTr.Replace(LIVEDRK, "'", "''");
			LIVESPT = CTr.Replace(LIVESPT, "'", "''");
			LIVEWET = CTr.Replace(LIVEWET, "'", "''");
			SEDPLIST = CTr.Replace(SEDPLIST, "'", "''");
			RVIEW = CTr.Replace(RVIEW, "'", "''");
			BVIEW = CTr.Replace(BVIEW, "'", "''");
			EXINJUR = CTr.Replace(EXINJUR, "'", "''");
			DEPRESS = CTr.Replace(DEPRESS, "'", "''");
			CNDTION = CTr.Replace(CNDTION, "'", "''");
			OPIN1 = CTr.Replace(OPIN1, "'", "''");
			OPIN2 = CTr.Replace(OPIN2, "'", "''");
			OPIN3 = CTr.Replace(OPIN3, "'", "''");
			OPIN4 = CTr.Replace(OPIN4, "'", "''");
			CGNTION = CTr.Replace(CGNTION, "'", "''");
			RESULTB_1 = CTr.Replace(RESULTB_1, "'", "''");
			RESULTB_2 = CTr.Replace(RESULTB_2, "'", "''");
			RESULTB_3 = CTr.Replace(RESULTB_3, "'", "''");
			RESULTB_4 = CTr.Replace(RESULTB_4, "'", "''");
			RESULTB_5 = CTr.Replace(RESULTB_5, "'", "''");
			RESULTB_6 = CTr.Replace(RESULTB_6, "'", "''");
			RESULTB_7 = CTr.Replace(RESULTB_7, "'", "''");
			RESULTB_8 = CTr.Replace(RESULTB_8, "'", "''");
			RESULTB_9 = CTr.Replace(RESULTB_9, "'", "''");
			RESULTB_10 = CTr.Replace(RESULTB_10, "'", "''");
			RESULTB_11 = CTr.Replace(RESULTB_11, "'", "''");
			RESULTR1_1 = CTr.Replace(RESULTR1_1, "'", "''");
			RESULTR1_2 = CTr.Replace(RESULTR1_2, "'", "''");
			RESULTR1_3 = CTr.Replace(RESULTR1_3, "'", "''");
			RESULTR1_4 = CTr.Replace(RESULTR1_4, "'", "''");
			RESULTR1_5 = CTr.Replace(RESULTR1_5, "'", "''");
			RESULTR1_6 = CTr.Replace(RESULTR1_6, "'", "''");
			RESULTR1_7 = CTr.Replace(RESULTR1_7, "'", "''");
			RESULTR1_8 = CTr.Replace(RESULTR1_8, "'", "''");
			RESULTR1_9 = CTr.Replace(RESULTR1_9, "'", "''");
			RESULTR1_10 = CTr.Replace(RESULTR1_10, "'", "''");
			RESULTR2_1 = CTr.Replace(RESULTR2_1, "'", "''");
			RESULTR2_2 = CTr.Replace(RESULTR2_2, "'", "''");
			RESULTRD_1 = CTr.Replace(RESULTRD_1, "'", "''");
			RESULTRD_2 = CTr.Replace(RESULTRD_2, "'", "''");
			RESULTRD_3 = CTr.Replace(RESULTRD_3, "'", "''");
			RESULTRD_4 = CTr.Replace(RESULTRD_4, "'", "''");
			RESULTRD_5 = CTr.Replace(RESULTRD_5, "'", "''");
			RESULTRD_ETC = CTr.Replace(RESULTRD_ETC, "'", "''");
			TRANC_DATE = CTr.Replace(TRANC_DATE, "'", "''");
			RESULT_DATE = CTr.Replace(RESULT_DATE, "'", "''");
			RESULT8_ETC = CTr.Replace(RESULT8_ETC, "'", "''");
			DOCTORFIR = CTr.Replace(DOCTORFIR, "'", "''");
			DOCTORQQN = CTr.Replace(DOCTORQQN, "'", "''");
			PANRETA = CTr.Replace(PANRETA, "'", "''");
			PANRETB = CTr.Replace(PANRETB, "'", "''");
			PANRETR1 = CTr.Replace(PANRETR1, "'", "''");
			PANRETR2 = CTr.Replace(PANRETR2, "'", "''");
			PANRETRD = CTr.Replace(PANRETRD, "'", "''");
			FIX_YN = CTr.Replace(FIX_YN, "'", "''");
			USER_ID = CTr.Replace(USER_ID, "'", "''");

			if(SMODE.equals("I")) {
				sql = "INSERT INTO PT_FIR_PANJUNG ( PFP_EXAM_DT, PFP_EXAM_SQ, PFP_HISJIN, PFP_HISMED, PFP_LIVEGBN , PFP_LIVESMK, PFP_LIVEDRK, PFP_LIVESPT, PFP_LIVEWET, PFP_SEDPLIST , PFP_RVIEW, PFP_BVIEW, PFP_EXINJUR, PFP_DEPRESS, PFP_CNDTION , PFP_OPIN1, PFP_OPIN2, PFP_OPIN3, PFP_OPIN4 , PFP_CGNTION, PFP_RESULTB_1, PFP_RESULTB_2, PFP_RESULTB_3, PFP_RESULTB_4 , PFP_RESULTB_5, PFP_RESULTB_6, PFP_RESULTB_7, PFP_RESULTB_8, PFP_RESULTB_9 , PFP_RESULTB_10, PFP_RESULTB_11, PFP_RESULTR1_1, PFP_RESULTR1_2, PFP_RESULTR1_3 , PFP_RESULTR1_4, PFP_RESULTR1_5, PFP_RESULTR1_6, PFP_RESULTR1_7, PFP_RESULTR1_8 , PFP_RESULTR1_9, PFP_RESULTR1_10, PFP_RESULTR2_1, PFP_RESULTR2_2, PFP_RESULTRD_1 , PFP_RESULTRD_2, PFP_RESULTRD_3, PFP_RESULTRD_4, PFP_RESULTRD_5, PFP_RESULTRD_ETC , PFP_TRANC_DATE, PFP_RESULT_DATE, PFP_RESULT8_ETC, PFP_DOCTORFIR, PFP_DOCTORQQN , PFP_PANRETA, PFP_PANRETB, PFP_PANRETR1, PFP_PANRETR2, PFP_PANRETRD , PFP_FIX_YN, PFP_INPUT_ID, PFP_INPUT_DTT ) VALUES (";
				sql += "  '" + EXAM_DT + "'";
				sql += ", '" + EXAM_SQ + "'";
				sql += ", '" + HISJIN + "'";
				sql += ", '" + HISMED + "'";
				sql += ", '" + LIVEGBN + "'";
				sql += ", '" + LIVESMK + "'";
				sql += ", '" + LIVEDRK + "'";
				sql += ", '" + LIVESPT + "'";
				sql += ", '" + LIVEWET + "'";
				sql += ", '" + SEDPLIST + "'";
				sql += ", '" + RVIEW + "'";
				sql += ", '" + BVIEW + "'";
				sql += ", '" + EXINJUR + "'";
				sql += ", '" + DEPRESS + "'";
				sql += ", '" + CNDTION + "'";
				sql += ", '" + OPIN1 + "'";
				sql += ", '" + OPIN2 + "'";
				sql += ", '" + OPIN3 + "'";
				sql += ", '" + OPIN4 + "'";
				sql += ", '" + CGNTION + "'";
				sql += ", '" + RESULTB_1 + "'";
				sql += ", '" + RESULTB_2 + "'";
				sql += ", '" + RESULTB_3 + "'";
				sql += ", '" + RESULTB_4 + "'";
				sql += ", '" + RESULTB_5 + "'";
				sql += ", '" + RESULTB_6 + "'";
				sql += ", '" + RESULTB_7 + "'";
				sql += ", '" + RESULTB_8 + "'";
				sql += ", '" + RESULTB_9 + "'";
				sql += ", '" + RESULTB_10 + "'";
				sql += ", '" + RESULTB_11 + "'";
				sql += ", '" + RESULTR1_1 + "'";
				sql += ", '" + RESULTR1_2 + "'";
				sql += ", '" + RESULTR1_3 + "'";
				sql += ", '" + RESULTR1_4 + "'";
				sql += ", '" + RESULTR1_5 + "'";
				sql += ", '" + RESULTR1_6 + "'";
				sql += ", '" + RESULTR1_7 + "'";
				sql += ", '" + RESULTR1_8 + "'";
				sql += ", '" + RESULTR1_9 + "'";
				sql += ", '" + RESULTR1_10 + "'";
				sql += ", '" + RESULTR2_1 + "'";
				sql += ", '" + RESULTR2_2 + "'";
				sql += ", '" + RESULTRD_1 + "'";
				sql += ", '" + RESULTRD_2 + "'";
				sql += ", '" + RESULTRD_3 + "'";
				sql += ", '" + RESULTRD_4 + "'";
				sql += ", '" + RESULTRD_5 + "'";
				sql += ", '" + RESULTRD_ETC + "'";
				sql += ", '" + TRANC_DATE + "'";
				sql += ", '" + RESULT_DATE + "'";
				sql += ", '" + RESULT8_ETC + "'";
				sql += ", '" + DOCTORFIR + "'";
				sql += ", '" + DOCTORQQN + "'";
				sql += ", '" + PANRETA + "'";
				sql += ", '" + PANRETB + "'";
				sql += ", '" + PANRETR1 + "'";
				sql += ", '" + PANRETR2 + "'";
				sql += ", '" + PANRETRD + "'";
				sql += ", '" + FIX_YN + "'";
				sql += ", '" + USER_ID + "'";
				sql += ", SYSDATE";
				sql += ")";

				argStmtExec.executeUpdate(sql);

			} else if(SMODE.equals("U")) {
				sql = "UPDATE PT_FIR_PANJUNG SET ";
				sql += "  PFP_HISJIN = '" + HISJIN + "'";
				sql += ", PFP_HISMED = '" + HISMED + "'";
				sql += ", PFP_LIVEGBN = '" + LIVEGBN + "'";
				sql += ", PFP_LIVESMK = '" + LIVESMK + "'";
				sql += ", PFP_LIVEDRK = '" + LIVEDRK + "'";
				sql += ", PFP_LIVESPT = '" + LIVESPT + "'";
				sql += ", PFP_LIVEWET = '" + LIVEWET + "'";
				sql += ", PFP_SEDPLIST = '" + SEDPLIST + "'";
				sql += ", PFP_RVIEW = '" + RVIEW + "'";
				sql += ", PFP_BVIEW = '" + BVIEW + "'";
				sql += ", PFP_EXINJUR = '" + EXINJUR + "'";
				sql += ", PFP_DEPRESS = '" + DEPRESS + "'";
				sql += ", PFP_CNDTION = '" + CNDTION + "'";
				sql += ", PFP_OPIN1 = '" + OPIN1 + "'";
				sql += ", PFP_OPIN2 = '" + OPIN2 + "'";
				sql += ", PFP_OPIN3 = '" + OPIN3 + "'";
				sql += ", PFP_OPIN4 = '" + OPIN4 + "'";
				sql += ", PFP_CGNTION = '" + CGNTION + "'";
				sql += ", PFP_RESULTB_1 = '" + RESULTB_1 + "'";
				sql += ", PFP_RESULTB_2 = '" + RESULTB_2 + "'";
				sql += ", PFP_RESULTB_3 = '" + RESULTB_3 + "'";
				sql += ", PFP_RESULTB_4 = '" + RESULTB_4 + "'";
				sql += ", PFP_RESULTB_5 = '" + RESULTB_5 + "'";
				sql += ", PFP_RESULTB_6 = '" + RESULTB_6 + "'";
				sql += ", PFP_RESULTB_7 = '" + RESULTB_7 + "'";
				sql += ", PFP_RESULTB_8 = '" + RESULTB_8 + "'";
				sql += ", PFP_RESULTB_9 = '" + RESULTB_9 + "'";
				sql += ", PFP_RESULTB_10 = '" + RESULTB_10 + "'";
				sql += ", PFP_RESULTB_11 = '" + RESULTB_11 + "'";
				sql += ", PFP_RESULTR1_1 = '" + RESULTR1_1 + "'";
				sql += ", PFP_RESULTR1_2 = '" + RESULTR1_2 + "'";
				sql += ", PFP_RESULTR1_3 = '" + RESULTR1_3 + "'";
				sql += ", PFP_RESULTR1_4 = '" + RESULTR1_4 + "'";
				sql += ", PFP_RESULTR1_5 = '" + RESULTR1_5 + "'";
				sql += ", PFP_RESULTR1_6 = '" + RESULTR1_6 + "'";
				sql += ", PFP_RESULTR1_7 = '" + RESULTR1_7 + "'";
				sql += ", PFP_RESULTR1_8 = '" + RESULTR1_8 + "'";
				sql += ", PFP_RESULTR1_9 = '" + RESULTR1_9 + "'";
				sql += ", PFP_RESULTR1_10 = '" + RESULTR1_10 + "'";
				sql += ", PFP_RESULTR2_1 = '" + RESULTR2_1 + "'";
				sql += ", PFP_RESULTR2_2 = '" + RESULTR2_2 + "'";
				sql += ", PFP_RESULTRD_1 = '" + RESULTRD_1 + "'";
				sql += ", PFP_RESULTRD_2 = '" + RESULTRD_2 + "'";
				sql += ", PFP_RESULTRD_3 = '" + RESULTRD_3 + "'";
				sql += ", PFP_RESULTRD_4 = '" + RESULTRD_4 + "'";
				sql += ", PFP_RESULTRD_5 = '" + RESULTRD_5 + "'";
				sql += ", PFP_RESULTRD_ETC = '" + RESULTRD_ETC + "'";
				sql += ", PFP_TRANC_DATE = '" + TRANC_DATE + "'";
				sql += ", PFP_RESULT_DATE = '" + RESULT_DATE + "'";
				sql += ", PFP_RESULT8_ETC = '" + RESULT8_ETC + "'";
				sql += ", PFP_DOCTORFIR = '" + DOCTORFIR + "'";
				sql += ", PFP_DOCTORQQN = CASE WHEN '" + DOCTORQQN + "' <> ' ' ";
				sql += " 					   THEN '" + DOCTORQQN + "' ";
				sql += "        		  ELSE (SELECT PFP_DOCTORQQN FROM PT_FIR_PANJUNG ";
				sql += " 				 		WHERE PFP_EXAM_DT = '" + EXAM_DT + "' ";
				sql += " 						AND   PFP_EXAM_SQ = '" + EXAM_SQ + "') END ";
				sql += ", PFP_PANRETA = '" + PANRETA + "'";
				sql += ", PFP_PANRETB = '" + PANRETB + "'";
				sql += ", PFP_PANRETR1 = '" + PANRETR1 + "'";
				sql += ", PFP_PANRETR2 = '" + PANRETR2 + "'";
				sql += ", PFP_PANRETRD = '" + PANRETRD + "'";
				sql += ", PFP_FIX_YN = '" + FIX_YN + "'";
				sql += ", PFP_MODI_DTT = SYSDATE";
				sql += ", PFP_MODI_ID = '" + USER_ID + "'";
				sql += " WHERE PFP_EXAM_DT = '" + EXAM_DT + "'";
				sql += " AND PFP_EXAM_SQ = '" + EXAM_SQ + "'";

				argStmtExec.executeUpdate(sql);

			}
		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
