/**
  * 鏂囦欢璇存槑
  * @Description:鎵╁睍璇存槑
  * @Copyright: 2018 dreamtech.com.cn Inc. All right reserved
  * @Version: V6.0
  */
package com.util;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class SendMsgUtil {
	
	/**
	 * 鍙戦�鐭俊娑堟伅
	 */
	@SuppressWarnings("deprecation")
	public static String sendMsg(String phones,String content){
		//鐭俊鎺ュ彛URL鎻愪氦鍦板潃utf-8
		String url = "http://utf8.api.smschinese.cn";
				//"http://utf8.sms.webchinese.cn";
	
		Map<String, String> params = new HashMap<String, String>();
		//鐢ㄦ埛鍚嶏紝渚嬶細abc123456
		params.put("Uid", "yihaodian");
		//鐭俊鎺ュ彛瀵嗛挜 ,涓嶆槸瀵嗙爜锛屼緥锛�9c3053154d313a34567
		params.put("Key", "8136ea32ff371a127396");
		
		//鎵嬫満鍙风爜锛屽涓彿鐮佷娇鐢ㄨ嫳鏂囬�鍙疯繘琛屽垎鍓�
		
		params.put("smsMob", phones);
		//灏嗙煭淇″唴瀹硅繘琛孶RLEncoder缂栫爜
		params.put("smsText", URLEncoder.encode(content));
		
		return HttpRequestUtil.getRequest(url, params);
	}
	
	/**
	 * 闅忔満鐢熸垚6浣嶉殢鏈洪獙璇佺爜
	 */
	public static String createRandomVcode(){
		//楠岃瘉鐮�
		String vcode = "";
		for (int i = 0; i < 6; i++) {
			vcode = vcode + (int)(Math.random() * 9);
		}
		return vcode;
	}
	
	/**
	 * 娴嬭瘯
	 */
	/*public static void main(String[] args) {
		
		//澶氫釜鎵嬫満鍙疯鐢ㄥ崐瑙�闅斿紑
		//渚嬶細
//		System.out.println(sendMsg("18912345678,17812345678", "灏婃暚鐨勭敤鎴凤紝鎮ㄧ殑楠岃瘉鐮佷负" + SendMsgUtil.createRandomVcode() + "锛屾湁鏁堟湡涓�0绉掞紝濡傛湁鐤戣檻璇疯璇�00-3023-4493锛堝鏈嶇數璇濓級銆愪腑鍥借仈閫氥�"));
//		System.out.println(sendMsg("鐢佃瘽鍙风爜", "灏婃暚鐨勭敤鎴凤紝鎮ㄧ殑楠岃瘉鐮佷负" + SendMsgUtil.createRandomVcode() + "锛屾湁鏁堟湡涓�0绉掞紝濡傛湁鐤戣檻璇疯璇�00-3023-4493锛堝鏈嶇數璇濓級銆怷X鍏徃鎴朮X缃戝悕绉般�"));
	System.out.println(sendMsg("17835397968","灏婃暚鐨�鍙峰簵鐢ㄦ埛锛屾偍鐨勯獙璇佺爜涓�+SendMsgUtil.createRandomVcode()));
	}*/
	
public String send(String phoneNumber) {
		
		//澶氫釜鎵嬫満鍙疯鐢ㄥ崐瑙�闅斿紑
		//渚嬶細
//		System.out.println(sendMsg("18912345678,17812345678", "灏婃暚鐨勭敤鎴凤紝鎮ㄧ殑楠岃瘉鐮佷负" + SendMsgUtil.createRandomVcode() + "锛屾湁鏁堟湡涓�0绉掞紝濡傛湁鐤戣檻璇疯璇�00-3023-4493锛堝鏈嶇數璇濓級銆愪腑鍥借仈閫氥�"));
//		System.out.println(sendMsg("鐢佃瘽鍙风爜", "灏婃暚鐨勭敤鎴凤紝鎮ㄧ殑楠岃瘉鐮佷负" + SendMsgUtil.createRandomVcode() + "锛屾湁鏁堟湡涓�0绉掞紝濡傛湁鐤戣檻璇疯璇�00-3023-4493锛堝鏈嶇數璇濓級銆怷X鍏徃鎴朮X缃戝悕绉般�"));
		String yznum = SendMsgUtil.createRandomVcode();
		System.out.println("鎴戞槸楠岃瘉鐮�"+yznum);
		/*CodeService codeService = new CodeServiceImpl();
		
		try {
			codeService.yzNum(phoneNumber, yznum);
		} catch (Exception e) {
			
			e.printStackTrace();
		}*/
	    sendMsg(phoneNumber,"灏婃暚鐨�鍙峰簵鐢ㄦ埛锛屾偍鐨勯獙璇佺爜涓�"+ yznum);
	
	    return yznum;
	}
}
