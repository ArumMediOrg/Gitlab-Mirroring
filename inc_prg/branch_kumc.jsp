<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.HashMap"%>
<%!
	HashMap htBranch = new HashMap();
%>
<%
	htBranch.put("GetCustomerKey", 				"/kumc/GetCustomerKey.jsp");					// 01. 환자번호 조회 생성
	htBranch.put("GetItemList", 				"/kumc/GetItemList.jsp");						// 02. 건강검진 검진목록 조회
	htBranch.put("GetCompanyList", 				"/kumc/GetCompanyList.jsp");					// 03. 기업코드 목록 조회
	htBranch.put("GetCompanyCustomer", 			"/kumc/GetCompanyCustomer.jsp");				// 04. 기업 건강검진 사원 확인
	htBranch.put("GetPackList", 				"/kumc/GetPackList.jsp");						// 05. 개인 건강검진 프로그램 목록
	htBranch.put("GetCompanyPackList", 			"/kumc/GetCompanyPackList.jsp");				// 06. 기업 건강검진 프로그램 목록
	htBranch.put("GetPackItemList", 			"/kumc/GetPackItemList.jsp");					// 07. 개인 건강검진 프로그램별 검진 목록
	htBranch.put("GetCompanyPackItemList", 		"/kumc/GetCompanyPackItemList.jsp");			// 08. 기업 건강검진 프로그램별 검진 목록
	htBranch.put("SetEachReserve", 				"/kumc/SetEachReserve.jsp");					// 09. 개인 건강검진 예약 입력
	htBranch.put("SetCompanyEachReserve", 		"/kumc/SetCompanyEachReserve.jsp");				// 10. 기업 건강검진 예약 입력
	htBranch.put("SetReserveCustomerInfo", 		"/kumc/SetReserveCustomerInfo.jsp");			// 11. 건강검진 예약내역 환자정보 수정
	htBranch.put("GetReservedList", 			"/kumc/GetReservedList.jsp");					// 12. 건강검진 예약내역 목록
	htBranch.put("GetReservedDetailInfo", 		"/kumc/GetReservedDetailInfo.jsp");				// 13. 건강검진 예약내역 상세 조회
	htBranch.put("GetResultList", 				"/kumc/GetResultList.jsp");						// 14. 건강검진 완료내역 목록 조회
	htBranch.put("GetResultDetailInfo", 		"/kumc/GetResultDetailInfo.jsp");				// 15. 건강검진 완료내역 상세 조회
	htBranch.put("GetReservedNumber", 			"/kumc/GetReservedNumber.jsp");					// 16. 건강검진 예약 건수
	htBranch.put("GetExamList", 				"/kumc/GetExamList.jsp");						// 17. 건강검진 검사목록 조회
	htBranch.put("DeleteReserveInfo", 			"/kumc/DeleteReserveInfo.jsp");					// 18. 건강검진 가예약 삭제
%>