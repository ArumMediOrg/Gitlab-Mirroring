<%!
	public String getSql(HashMap argHtMethod) {
	
		String strMethodName = (String) argHtMethod.get("methodName");
		String strSql = "";
		
		strSql += "SELECT *";
		strSql += " FROM " + strMethodName;

		return strSql;
	}
%>