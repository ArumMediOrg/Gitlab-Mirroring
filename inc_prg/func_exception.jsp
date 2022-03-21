<%!
	// 사용자 정의 Exception
	public class FuncException extends Exception {

		String sql;

		public FuncException(String argMsg, String argSql) {

			super(argMsg);
			this.sql = argSql;
		}

		public String getSql() {

			return sql;
		}
	}
%>