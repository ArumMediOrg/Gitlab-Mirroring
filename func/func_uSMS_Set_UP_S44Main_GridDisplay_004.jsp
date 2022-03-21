<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%!
	public String func_uSMS_Set_UP_S44Main_GridDisplay_004(Statement argStmtExec, HashMap argHtMethod) throws Exception {

		String sql = "";
		String sql2 = "";
		String sql_disp = "";

		try {


			//

			//

			sql = "INSERT INTO CR_SMS_AUTO_SET VALUES('11','예약접수 안내','1','','05','','','[아름누리병원]%NAME님 %DATE일 %TIME분 검진 예약되었습니다.','','Y','ADMIN',SYSDATE,'','','')";
			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO CR_SMS_AUTO_SET VALUES('12','예약변경 안내','1','','10','','','[아름누리병원]%NAME님 검진일이 %DATE일 %TIME분으로 변경되었습니다.','','Y','ADMIN',SYSDATE,'','','')";
			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO CR_SMS_AUTO_SET VALUES('21','예약일자 사전안내 1차','2','','','3','18','[아름누리병원]%NAME님 %DATE일 %TIME분 검진예약일입니다.','','Y','ADMIN',SYSDATE,'','','')";
			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO CR_SMS_AUTO_SET VALUES('22','예약일자 사전안내 2차','2','','','2','18','[아름누리병원]%NAME님 %DATE일 %TIME분 검진예약일입니다.','','Y','ADMIN',SYSDATE,'','','')";
			argStmtExec.executeUpdate(sql);

			sql = "INSERT INTO CR_SMS_AUTO_SET VALUES('23','예약일자 사전안내 3차','2','','','1','17','[아름누리병원]','','Y','ADMIN',SYSDATE,'','','')";
			argStmtExec.executeUpdate(sql);

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
