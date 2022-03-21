<%!
	// 변환함수
	public static class CTr {

		// null처리
		public static String IfNullTo(String argSrc, String argDst) {
		
			return (argSrc == null ? argDst : argSrc);
		}
		public static String IfNullTo(String argSrc) {
		
			return IfNullTo(argSrc, "");
		}

		// 문자열 가공
		public static String Left(String argStr, int argLen) {

			argStr = IfNullTo(argStr);
			if(argStr.length() < argLen) {

				return argStr;
			}

			return argStr.substring(0, argLen);
		}

		public static String Right(String argStr, int argLen) {

			argStr = IfNullTo(argStr);
			if(argStr.equals("")) {

				return "";
			}

			return argStr.substring(Math.max(0, argStr.length() - argLen));
		}

		public static String Replace(String argStr, String argSrc, String argReplace) {
			
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
	}
%>