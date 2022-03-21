<%!
	// 사용자 정의 Exception
	public class CustomException extends Exception {

		int value;

		public CustomException(String argMsg, int argValue) {

			super(argMsg);
			this.value = argValue;
		}

		public int getValue() {

			return value;
		}
	}
%>