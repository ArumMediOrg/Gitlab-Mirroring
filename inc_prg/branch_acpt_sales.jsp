<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%
	htBranch.put("uAcpt_Sales_UP_Exam_Kd_002", 		"/method/acpt_sales/uAcpt_Sales_UP_Exam_Kd_002.jsp");
	htBranch.put("uAcpt_Sales_UP_Exam_Kd_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Exam_Kd_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Date_Kd_002", 		"/method/acpt_sales/uAcpt_Sales_UP_Date_Kd_002.jsp");
	htBranch.put("uAcpt_Sales_UP_Date_Kd_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Date_Kd_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Comp_Stat_002", 		"/method/acpt_sales/uAcpt_Sales_UP_Comp_Stat_002.jsp");
	htBranch.put("uAcpt_Sales_UP_Exam_Etc_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Exam_Etc_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Age_Stat_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Age_Stat_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Comp_Stat_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Comp_Stat_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Sales_Stat_002", 		"/method/acpt_sales/uAcpt_Sales_UP_Sales_Stat_002.jsp");
	htBranch.put("uAcpt_Sales_UP_Sales_Stat_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Sales_Stat_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Sales_Rep_002", 		"/method/acpt_sales/uAcpt_Sales_UP_Sales_Rep_002.jsp");
	htBranch.put("uAcpt_Sales_UP_Sales_Rep_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Sales_Rep_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Disc_Stat_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Disc_Stat_001.jsp");
	htBranch.put("uAcpt_Sales_UP_OcsDv_Stat_001", 		"/method/acpt_sales/uAcpt_Sales_UP_OcsDv_Stat_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Region_Stat_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Region_Stat_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Demand_Kd_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Demand_Kd_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Cancer_Dr_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Cancer_Dr_001.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Stat_001", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Stat_001.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Stat_002", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Stat_002.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Stat_003", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Stat_003.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Stat_004", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Stat_004.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Stat_005", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Stat_005.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Stat_006", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Stat_006.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Stat_007", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Stat_007.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Day_001", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Day_001.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Day_003", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Day_003.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Day_002", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Day_002.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Day_004", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Day_004.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Day_005", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Day_005.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Month_001", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Month_001.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Month_002", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Month_002.jsp");
	htBranch.put("uAcpt_Sales_UP_Date_Kd_003", 		"/method/acpt_sales/uAcpt_Sales_UP_Date_Kd_003.jsp");
	htBranch.put("uAcpt_Sales_UP_Date_Sales_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Date_Sales_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Date_Sales_002", 		"/method/acpt_sales/uAcpt_Sales_UP_Date_Sales_002.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Stat_008", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Stat_008.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Month_003", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Month_003.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Stat_010", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Stat_010.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Stat_009", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Stat_009.jsp");
	htBranch.put("uAcpt_Sales_UP_Comp_Stat_003", 		"/method/acpt_sales/uAcpt_Sales_UP_Comp_Stat_003.jsp");
	htBranch.put("uAcpt_Sales_UP_Disc_Stat_002", 		"/method/acpt_sales/uAcpt_Sales_UP_Disc_Stat_002.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Item_001", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Item_001.jsp");
	htBranch.put("uAcpt_Sales_upGetUnCheckOldAndNewPr_001", 		"/method/acpt_sales/uAcpt_Sales_upGetUnCheckOldAndNewPr_001.jsp");
	htBranch.put("uAcpt_Sales_upGetUnCheckNewPr_001", 		"/method/acpt_sales/uAcpt_Sales_upGetUnCheckNewPr_001.jsp");
	htBranch.put("uAcpt_Sales_upGetPsnlUnCheckNewPr_001", 		"/method/acpt_sales/uAcpt_Sales_upGetPsnlUnCheckNewPr_001.jsp");
	htBranch.put("uAcpt_Sales_upGetDateUnCheckNewPr_001", 		"/method/acpt_sales/uAcpt_Sales_upGetDateUnCheckNewPr_001.jsp");
	htBranch.put("uAcpt_Sales_upGetDoctorUnCheckNewPr_001", 		"/method/acpt_sales/uAcpt_Sales_upGetDoctorUnCheckNewPr_001.jsp");
	htBranch.put("uAcpt_Sales_upGetSalesUnCheckNewPr_001", 		"/method/acpt_sales/uAcpt_Sales_upGetSalesUnCheckNewPr_001.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Year_001", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Year_001.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Year_002", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Year_002.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Year_003", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Year_003.jsp");
	htBranch.put("uAcpt_Sales_UP_KUMC_Year_004", 		"/method/acpt_sales/uAcpt_Sales_UP_KUMC_Year_004.jsp");
	htBranch.put("uAcpt_Sales_UP_Comp_Kd_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Comp_Kd_001.jsp");
	htBranch.put("uAcpt_Sales_UP_Pack2_Kd_001", 		"/method/acpt_sales/uAcpt_Sales_UP_Pack2_Kd_001.jsp");
%>
