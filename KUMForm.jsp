<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9"><!-- IE문서모드를 강제로 IE9로 셋팅 -->
	<meta http-equiv="Expires"content="-1"/>
	<meta http-equiv="Pragma"content="no-cache"/>
	<meta http-equiv="Cache-Control"content="no-Cache"/>

	<title>::: 아름누리메디컴 > 테스트 화면 :::</title>

	<style type="text/css">
		table {
			border-collapse:collapse;
		}
		table th {
			width:100px;
			border:1px solid #333333;
		}
		table td {
			padding:7px;
			border:1px solid #333333;
		}

		textarea[name=strXml] {
			width:700px;
			height:300px;
			border:1px solid #EEEEEE;
		}
		iframe[name=ifr] {
			width:700px;
			height:300px;
			border:1px solid #EEEEEE;
		}
	</style>
</head>

<!-- <form name="frm_test" action="http://arume.cocoeye.co.kr:4780/KUMCOnlineReservation.jsp" method="post" target="_blank"> -->
<form name="frm_test" action="KUMCOnlineReservation.jsp" method="post" target="_blank">

<table>
<tbody>
<tr>
	<th>URL</th>
	<td>
		<!-- http://arume.cocoeye.co.kr:4780/KUMCOnlineReservation.jsp -->
		http://192.168.50.51:8088/KUMCOnlineReservation.jsp
	</td>
<tr>
<tr>
	<th>strXml</th>
	<td>
		<textarea name="strXml"></textarea>
	</td>
<tr>
<tr>
	<th></th>
	<td>
		<input type="submit" value="테스트">
	</td>
<tr>
<!--
<tr>
	<th>결과</th>
	<td>
		<iframe id="ifr" name="ifr"></iframe>
	</td>
<tr>
-->
</tbody>
</table>

</form>
