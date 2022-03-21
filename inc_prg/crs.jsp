<%!
	// 변환함수
	public class CRs {

		private ResultSet Rs;
		
		// 생성자
		public CRs(ResultSet argRs) {
		
			Rs = argRs;
		}
		
		// null처리
		public String IfNullTo(String argSrc, String argDst) {
		
			return (argSrc == null ? argDst : argSrc);
		}
		public String IfNullTo(String argSrc) {
		
			return IfNullTo(argSrc, "");
		}

		// 문자열 가공
		public String Left(String argStr, int argLen) {

			argStr = IfNullTo(argStr);
			if(argStr.length() < argLen) {

				return argStr;
			}

			return argStr.substring(0, argLen);
		}

		public String Right(String argStr, int argLen) {

			argStr = IfNullTo(argStr);
			if(argStr.equals("")) {

				return "";
			}

			return argStr.substring(Math.max(0, argStr.length() - argLen));
		}

		public String Replace(String argStr, String argSrc, String argReplace) {
			
			argStr = IfNullTo(argStr);
			if(argStr.equals("")) {
				
				return "";
			}

			StringBuffer sb = new StringBuffer();
			int sidx = 0;
			int eidx = 0;
			
			while((eidx = argStr.indexOf(argSrc, sidx)) != -1) {
				
				sb.append(argStr.substring(sidx, eidx));
				sb.append(argReplace);
				sidx = eidx + argSrc.length();
			}
			sb.append(argStr.substring(sidx, argStr.length()));
			
			return sb.toString();
		}

		//
		public String getString(String argName) {
		
			String str = "";
		
			try {
			
				str = IfNullTo(Rs.getString(argName));
				str = Replace(str, "&", "&#x26;");
				str = Replace(str, "'", "&#x27;");
				str = Replace(str, "<", "&#x3c;");
				str = Replace(str, ">", "&#x3e;");
				
				return str;
			} catch (Exception e) {

				return "";
			}
		}

		public String getDate2(String argName) {

			String str = getString(argName);

			str = Left(str, 19);
			str = Replace(str, " ", "T");
		
			return str;
		}

		public int getInt(String argName) {
		
			try {
			
				return Rs.getInt(argName);
			} catch (Exception e) {

				return 0;
			}
		}
		public double getFloat(String argName) {
		
			try {
			
				return Math.floor(Rs.getFloat(argName) * 100000000) * 0.00000001;
			} catch (Exception e) {

				return 0;
			}
		}
		public double getDouble(String argName) {
		
			try {
			
				return Rs.getDouble(argName);
			} catch (Exception e) {

				return 0;
			}
		}
		public boolean beforeFirst() {
		
			try {
			
				Rs.beforeFirst();
				return true;
			} catch (Exception e) {

				return false;
			}
		}
		public boolean next() {
		
			try {
			
				return Rs.next();
			} catch (Exception e) {

				return false;
			}
		}
		public void close() {
		
			try {
			
				Rs.close();
				Rs = null;
			} catch (Exception e) { }
		}
	}
%>