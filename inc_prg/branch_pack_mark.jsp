<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%
	htBranch.put("uPack_Mark_Up_ExamSetting_002", 		"/method/pack_mark/uPack_Mark_Up_ExamSetting_002.jsp");
	htBranch.put("uPack_Mark_Up_ExamSetting_003", 		"/method/pack_mark/uPack_Mark_Up_ExamSetting_003.jsp");
	htBranch.put("uPack_Mark_Up_ExamSetting_001", 		"/method/pack_mark/uPack_Mark_Up_ExamSetting_001.jsp");
	htBranch.put("uPack_Mark_Up_SickDisplay_001", 		"/method/pack_mark/uPack_Mark_Up_SickDisplay_001.jsp");
	htBranch.put("uPack_Mark_AlvMarkSelectItem_001", 		"/method/pack_mark/uPack_Mark_AlvMarkSelectItem_001.jsp");
	htBranch.put("uPack_Mark_btnSave_PtClick_005_TRAN004", 		"/method/pack_mark/uPack_Mark_btnSave_PtClick_005_TRAN004.jsp");
	htBranch.put("uPack_Mark_btnSave_MkClick_005_TRAN004", 		"/method/pack_mark/uPack_Mark_btnSave_MkClick_005_TRAN004.jsp");
	htBranch.put("uPack_Mark_btnSave_VwClick_005_TRAN004", 		"/method/pack_mark/uPack_Mark_btnSave_VwClick_005_TRAN004.jsp");
	htBranch.put("uPack_Mark_AlvPrntSelectItem_002", 		"/method/pack_mark/uPack_Mark_AlvPrntSelectItem_002.jsp");
	htBranch.put("uPack_Mark_AlvViewSelectItem_002", 		"/method/pack_mark/uPack_Mark_AlvViewSelectItem_002.jsp");
	htBranch.put("uPack_Mark_AlvMarkSelectItem_002", 		"/method/pack_mark/uPack_Mark_AlvMarkSelectItem_002.jsp");
	htBranch.put("uPack_Mark_btnSave_PtClick_004_TRAN003", 		"/method/pack_mark/uPack_Mark_btnSave_PtClick_004_TRAN003.jsp");
	htBranch.put("uPack_Mark_btnSave_MkClick_004_TRAN003", 		"/method/pack_mark/uPack_Mark_btnSave_MkClick_004_TRAN003.jsp");
	htBranch.put("uPack_Mark_btnSave_VwClick_004_TRAN003", 		"/method/pack_mark/uPack_Mark_btnSave_VwClick_004_TRAN003.jsp");
	htBranch.put("uPack_Mark_btnUse_PtClick_002_TRAN002", 		"/method/pack_mark/uPack_Mark_btnUse_PtClick_002_TRAN002.jsp");
	htBranch.put("uPack_Mark_btnUse_PtClick_004_TRAN004", 		"/method/pack_mark/uPack_Mark_btnUse_PtClick_004_TRAN004.jsp");
	htBranch.put("uPack_Mark_btnUse_MkClick_002_TRAN002", 		"/method/pack_mark/uPack_Mark_btnUse_MkClick_002_TRAN002.jsp");
	htBranch.put("uPack_Mark_btnUse_MkClick_004_TRAN004", 		"/method/pack_mark/uPack_Mark_btnUse_MkClick_004_TRAN004.jsp");
	htBranch.put("uPack_Mark_btnSave_PtClick_001", 		"/method/pack_mark/uPack_Mark_btnSave_PtClick_001.jsp");
	htBranch.put("uPack_Mark_btnSave_MkClick_001", 		"/method/pack_mark/uPack_Mark_btnSave_MkClick_001.jsp");
	htBranch.put("uPack_Mark_btnSave_VwClick_001", 		"/method/pack_mark/uPack_Mark_btnSave_VwClick_001.jsp");
	htBranch.put("uPack_Mark_btnSave_PtClick_003_TRAN002", 		"/method/pack_mark/uPack_Mark_btnSave_PtClick_003_TRAN002.jsp");
	htBranch.put("uPack_Mark_btnSave_MkClick_002_TRAN001", 		"/method/pack_mark/uPack_Mark_btnSave_MkClick_002_TRAN001.jsp");
	htBranch.put("uPack_Mark_btnSave_MkClick_003_TRAN002", 		"/method/pack_mark/uPack_Mark_btnSave_MkClick_003_TRAN002.jsp");
	htBranch.put("uPack_Mark_btnSave_VwClick_002_TRAN001", 		"/method/pack_mark/uPack_Mark_btnSave_VwClick_002_TRAN001.jsp");
	htBranch.put("uPack_Mark_btnSave_VwClick_003_TRAN002", 		"/method/pack_mark/uPack_Mark_btnSave_VwClick_003_TRAN002.jsp");
	htBranch.put("uPack_Mark_btnSave_PtClick_002_TRAN001", 		"/method/pack_mark/uPack_Mark_btnSave_PtClick_002_TRAN001.jsp");
	htBranch.put("uPack_Mark_btnUse_PtClick_001_TRAN001", 		"/method/pack_mark/uPack_Mark_btnUse_PtClick_001_TRAN001.jsp");
	htBranch.put("uPack_Mark_btnUse_PtClick_003_TRAN003", 		"/method/pack_mark/uPack_Mark_btnUse_PtClick_003_TRAN003.jsp");
	htBranch.put("uPack_Mark_btnUse_MkClick_001_TRAN001", 		"/method/pack_mark/uPack_Mark_btnUse_MkClick_001_TRAN001.jsp");
	htBranch.put("uPack_Mark_btnUse_MkClick_003_TRAN003", 		"/method/pack_mark/uPack_Mark_btnUse_MkClick_003_TRAN003.jsp");
	htBranch.put("uPack_Mark_btnUse_VwClick_001_TRAN001", 		"/method/pack_mark/uPack_Mark_btnUse_VwClick_001_TRAN001.jsp");
	htBranch.put("uPack_Mark_btnUse_VwClick_002_TRAN002", 		"/method/pack_mark/uPack_Mark_btnUse_VwClick_002_TRAN002.jsp");
	htBranch.put("uPack_Mark_btnSearchClick_001", 		"/method/pack_mark/uPack_Mark_btnSearchClick_001.jsp");
	htBranch.put("uPack_Mark_btnSearchClick_002", 		"/method/pack_mark/uPack_Mark_btnSearchClick_002.jsp");
	htBranch.put("uPack_Mark_btnSearchClick_003", 		"/method/pack_mark/uPack_Mark_btnSearchClick_003.jsp");
	htBranch.put("uPack_Mark_AlvPrntSelectItem_001", 		"/method/pack_mark/uPack_Mark_AlvPrntSelectItem_001.jsp");
	htBranch.put("uPack_Mark_AlvViewSelectItem_001", 		"/method/pack_mark/uPack_Mark_AlvViewSelectItem_001.jsp");
	htBranch.put("uPack_Mark_AlvExamSelectItem_001", 		"/method/pack_mark/uPack_Mark_AlvExamSelectItem_001.jsp");
	htBranch.put("uPack_Mark_Up_ExamSetting_004", 		"/method/pack_mark/uPack_Mark_Up_ExamSetting_004.jsp");
	htBranch.put("uPack_Mark_updateAlvMark_001", 		"/method/pack_mark/uPack_Mark_updateAlvMark_001.jsp");
%>
