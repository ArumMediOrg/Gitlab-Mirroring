<%!
	public String func_uItem_Update_btnUpdateClick_001(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {

			String EEA_EXAM_SDT = (String) argHtMethod.get("EEA_EXAM_SDT");
			String EEA_EXAM_EDT = (String) argHtMethod.get("EEA_EXAM_EDT");
			String IIM_ITEM_CD = (String) argHtMethod.get("IIM_ITEM_CD");

			//
			if(EEA_EXAM_SDT == null) { EEA_EXAM_SDT = ""; }
			if(EEA_EXAM_EDT == null) { EEA_EXAM_EDT = ""; }
			if(IIM_ITEM_CD == null) { IIM_ITEM_CD = ""; }

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

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
