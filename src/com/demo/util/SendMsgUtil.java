/**
  * 文件说明
  * @Description:扩展说明
  * @Copyright: 2018 dreamtech.com.cn Inc. All right reserved
  * @Version: V6.0
  */
package com.demo.util;

import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

public class SendMsgUtil {
	
	/**
	 * 发送短信消息
	 */
	@SuppressWarnings("deprecation")
	public static String sendMsg(String phones,String content){
		//短信接口URL提交地址utf-8
		String url = "http://utf8.api.smschinese.cn";
				//"http://utf8.sms.webchinese.cn";
	
		Map<String, String> params = new HashMap<String, String>();
		//用户名，例：abc123456
		params.put("Uid", "thestore");
		//短信接口密钥 ,不是密码，例：79c3053154d313a34567
		params.put("Key", "85bd20463f9ba9c9a1e7");
		
		//手机号码，多个号码使用英文逗号进行分割
		
		params.put("smsMob", phones);
		//将短信内容进行URLEncoder编码
		params.put("smsText", URLEncoder.encode(content));
		
		return HttpRequestUtil.getRequest(url, params);
	}
	
	/**
	 * 随机生成6位随机验证码
	 */
	public static String createRandomVcode(){
		//验证码
		String vcode = "";
		for (int i = 0; i < 6; i++) {
			vcode = vcode + (int)(Math.random() * 9);
		}
		return vcode;
	}
	
	/**
	 * 测试
	 */
	public static void main(String[] args) {
		
		//多个手机号请用半角,隔开
		//例：
//		System.out.println(sendMsg("18912345678,17812345678", "尊敬的用户，您的验证码为" + SendMsgUtil.createRandomVcode() + "，有效期为60秒，如有疑虑请详询400-3023-4493（客服电话）【中国联通】"));
//		System.out.println(sendMsg("电话号码", "尊敬的用户，您的验证码为" + SendMsgUtil.createRandomVcode() + "，有效期为60秒，如有疑虑请详询400-3023-4493（客服电话）【XX公司或XX网名称】"));
	System.out.println(sendMsg("17835397968","尊敬的1号店用户，您的验证码为"+SendMsgUtil.createRandomVcode()));
	}
}
