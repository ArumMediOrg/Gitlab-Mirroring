<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=9"><!-- IE문서모드를 강제로 IE9로 셋팅 -->
	<meta http-equiv="Expires"content="-1"/>
	<meta http-equiv="Pragma"content="no-cache"/>
	<meta http-equiv="Cache-Control"content="no-Cache"/>

	<title>::: 아름누리메디컴 :::</title>

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
		}
	</style>
</head>

<form action="NurionAPI_001.jsp" method="post" target="_blank">

<table>
<tbody>
<tr>
	<th>접속주소</th>
	<td>
		/NurionAPI_001.jsp
	</td>
<tr>
<tr>
	<th>XML 예시 1)</th>
	<td>
		&lt;?xml version="1.0"?&gt;<br/>
		&lt;nurionXml&gt;<br/>
			&lt;dataType&gt;single&lt;/dataType&gt;<br/>
			&lt;count&gt;1&lt;/count&gt;<br/>
			&lt;schemaCode&gt;1&lt;/schemaCode&gt;<br/>
			&lt;data_1&gt;<br/>
				&lt;methodName&gt;&lt;![CDATA[uItem_dsItemListDataChange_001]]&gt;&lt;/methodName&gt;<br/>
				&lt;IIM_TRLT_CD&gt;&lt;![CDATA[Z04]]&gt;&lt;/IIM_TRLT_CD&gt;<br/>
			&lt;/data_1&gt;<br/>
		&lt;/nurionXml&gt;
	</td>
<tr>
<tr>
	<th>XML 예시 2)</th>
	<td>
		&lt;?xml version="1.0"?&gt;<br/>
		&lt;nurionXml&gt;<br/>
			&lt;data_1&gt;<br/>
				&lt;methodName&gt;&lt;![CDATA[uItem_ufDeleteItem_001]]&gt;&lt;/methodName&gt;<br/>
				&lt;IIM_ITEM_CD&gt;&lt;![CDATA[A01]]&gt;&lt;/IIM_ITEM_CD&gt;<br/>
			&lt;/data_1&gt;<br/>
			&lt;data_2&gt;<br/>
				&lt;methodName&gt;&lt;![CDATA[uItem_ufDeleteItem_002]]&gt;&lt;/methodName&gt;<br/>
				&lt;IIP_ITEM_CD&gt;&lt;![CDATA[A01]]&gt;&lt;/IIP_ITEM_CD&gt;<br/>
			&lt;/data_2&gt;<br/>
			&lt;data_3&gt;<br/>
				&lt;methodName&gt;&lt;![CDATA[uItem_ufDeleteItem_003]]&gt;&lt;/methodName&gt;<br/>
				&lt;IIR_ITEM_CD&gt;&lt;![CDATA[A01]]&gt;&lt;/IIR_ITEM_CD&gt;<br/>
			&lt;/data_3&gt;<br/>
			&lt;data_4&gt;<br/>
				&lt;methodName&gt;&lt;![CDATA[uItem_ufDeleteItem_004]]&gt;&lt;/methodName&gt;<br/>
				&lt;IIV_ITEM_CD&gt;&lt;![CDATA[A01]]&gt;&lt;/IIV_ITEM_CD&gt;<br/>
			&lt;/data_4&gt;<br/>
			&lt;dataType&gt;multi&lt;/dataType&gt;<br/>
			&lt;count&gt;4&lt;/count&gt;<br/>
			&lt;schemaCode&gt;1&lt;/schemaCode&gt;<br/>
		&lt;/nurionXml&gt;
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
		<input type="submit" value="전송">
	</td>
<tr>
<tr>
	<th>성공 결과</th>
	<td>
		&lt;nurionXml&gt;<br/>
			&lt;resultCode&gt;200&lt;/resultCode&gt;<br/>
			&lt;resultXml&gt;&lt;/resultXml&gt;<br/>
			&lt;errorMsg&gt;&lt;/errorMsg&gt;<br/>
		&lt;/nurionXml&gt;
	</td>
<tr>
<tr>
	<th>오류 결과</th>
	<td>
		&lt;nurionXml&gt;<br/>
			&lt;resultCode&gt;400&lt;/resultCode&gt;<br/>
			&lt;resultXml&gt;&lt;/resultXml&gt;<br/>
			&lt;errorMsg&gt;&lt;![CDATA[오류 메시지]]&gt;&lt;/errorMsg&gt;<br/>
		&lt;/nurionXml&gt;
	</td>
<tr>
</tbody>
</table>

</form>

