<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/CallNCF.jsp"%>
<%!
	public String func_NCF_InsMedpnt(HashMap argHtMethod) throws Exception {
		
		String sql = "";
		String ReturnXml = "";

		NcfInsMedpntVO InsMedPntVO_Sender = null;

		try {

			String EMPL_NUMB = (String) argHtMethod.get("EMPL_NUMB");
			String MEPN_DATE = (String) argHtMethod.get("MEPN_DATE");
			String MEDI_PNTX = (String) argHtMethod.get("MEDI_PNTX");
			String FMLY_NAME = (String) argHtMethod.get("FMLY_NAME");
			String USED_WECD = (String) argHtMethod.get("USED_WECD");
			String INST_USID = (String) argHtMethod.get("INST_USID");
			String MEPN_REMK = (String) argHtMethod.get("MEPN_REMK");
			String WAGE_ENCD = (String) argHtMethod.get("WAGE_ENCD");
			String FREL_CODE = (String) argHtMethod.get("FREL_CODE");	

			//
			if(EMPL_NUMB == null) { EMPL_NUMB = ""; }
			if(MEPN_DATE == null) { MEPN_DATE = ""; }
			if(MEDI_PNTX == null) { MEDI_PNTX = ""; }
			if(FMLY_NAME == null) { FMLY_NAME = ""; }
			if(USED_WECD == null) { USED_WECD = ""; }
			if(INST_USID == null) { INST_USID = ""; }
			if(MEPN_REMK == null) { MEPN_REMK = ""; }
			if(WAGE_ENCD == null) { WAGE_ENCD = ""; }
			if(FREL_CODE == null) { FREL_CODE = ""; }

			//
			EMPL_NUMB = CTr.Replace(EMPL_NUMB, "'", "''");
			MEPN_DATE = CTr.Replace(MEPN_DATE, "'", "''");
			MEDI_PNTX = CTr.Replace(MEDI_PNTX, "'", "''");
			FMLY_NAME = CTr.Replace(FMLY_NAME, "'", "''");
			USED_WECD = CTr.Replace(USED_WECD, "'", "''");
			INST_USID = CTr.Replace(INST_USID, "'", "''");
			MEPN_REMK = CTr.Replace(MEPN_REMK, "'", "''");
			WAGE_ENCD = CTr.Replace(WAGE_ENCD, "'", "''");
			FREL_CODE = CTr.Replace(FREL_CODE, "'", "''");

			InsMedPntVO_Sender = new NcfInsMedpntVO();

			InsMedPntVO_Sender.setEmpl_numb(EMPL_NUMB);
			InsMedPntVO_Sender.setMepn_date(MEPN_DATE);
			InsMedPntVO_Sender.setMedi_pntx(MEDI_PNTX);
			InsMedPntVO_Sender.setFmly_name(FMLY_NAME);
			InsMedPntVO_Sender.setUsed_wecd(USED_WECD);
			InsMedPntVO_Sender.setInst_usid(INST_USID);
			InsMedPntVO_Sender.setMepn_remk(MEPN_REMK);
			InsMedPntVO_Sender.setWage_encd(WAGE_ENCD);
			InsMedPntVO_Sender.setFrel_code(FREL_CODE);

			ReturnXml = func_InsMedpnt(InsMedPntVO_Sender);

			sql = "EMPL_NUMB : " + EMPL_NUMB + "\n";
			sql += "MEPN_DATE : " + MEPN_DATE + "\n";
			sql += "MEDI_PNTX : " + MEDI_PNTX + "\n";
			sql += "FMLY_NAME : " + FMLY_NAME + "\n";
			sql += "USED_WECD : " + USED_WECD + "\n";
			sql += "INST_USID : " + INST_USID + "\n";
			sql += "MEPN_REMK : " + MEPN_REMK + "\n";
			sql += "WAGE_ENCD : " + WAGE_ENCD + "\n";
			sql += "FREL_CODE : " + FREL_CODE;

		} catch (Exception e) {

			throw new FuncException(e.toString(), sql);
		}

		return sql;
	}
%>
