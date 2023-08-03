package io.renren.modules.app.controller;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import io.swagger.annotations.Api;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

@RestController
@RequestMapping("/app")
@Api("APP支付接口")
public class AppPayController {
//    @Autowired
//    DonaItemService donaItemService;
//    @Autowired
//    DonaService donaService;
    //appid
    private final String APP_ID = "2021000121697812";
    //应用私钥
    private final String APP_PRIVATE_KEY = "MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDhqh+ZhjM/j++a5P+Mw48j9xseXu0PBtz2s9pjmtoCKo5+rPZuYBNtiB8LTN931gEtWQYf7Ccdf9dtcUfAOiTAd8IEjD62IYqnWnQQ8Hqhz/qVDbmhcnlpP9svW17i4T2PdmOBXlF7YwO9Fnq8u9ZdU6ol3Ajj3KLjjtxB+PxW8/Sdk1TQNMNUQRQzFMMMgytxCI+vJug5vNQSGwIJJ8KxCQF8TlaP6ctNx1smYqK7oTkONmdD7Y4CWUmP8Ajg4jZvB+MBg2Ym7YTS0EuztFt7VTfHYSZSLntpnQlpUfu2x6ccvpZIG9wfDZEtsLjG7gVnQKgtdQ6MH4eC1RDMKGWBAgMBAAECggEBAJXofbVvAPxokbNEDL9l6eDqdolmZfRlisQYFiu04r4tpxtfqxUHneBVXMoU9x6Ue5O0X+0044clNebuKcv41BFHfQuoXsB+56zk2dWm6tAzaTM7OuWVNjJEyUZcXFw7ZLm428FE9rwQupsSI9bcsTquKYmc8grstwiUDp2E2Zyok1uq5OglD7B2h8sMZrR30mMHWOZ8ozzgzeh9XCF30zi3WhRViYCthZqnW7lJa/XUnYX5Ct7yGrIQqxP4NXWjbZccXsJLfFzFCd7Ezodxqby5J24EqceGj1zSP81LT5KTt8bLiMoLQn+GLFDzgIfAs6n2cf5WgYuXFq5uz74SvAECgYEA+5Uo/S7bB3nSmgL2EdQgkx8xUG6CRbJBPaV7cXunqpapCBo6xtFq1Nl62jh9n9Kksjagi0LnwtLyvkJ+O87UwB7aeOcCsAuGrK/mKWRgmJk7nHnNFsLPiKn0ILeEqjL9psE4iCDox2hKd2Ga5mkS0LgxHmw/nq6qAVrnIeRHitkCgYEA5aB2wgU1RxBN+FgUnXUr5HaR7oq/fEaKq+oobaeh16cnsjAGx2edsOD7jgDGZ00WYT2gfF5e7YA+w4lzQD2npTLb524VFpZ0QlVx6WljFwDBDNGxpq4KO6SmAyJyvB+SPkvi6u7p/6uD5sMl/s0+TV1uZclwJT6wsF3mmwCDdukCgYEA0TuveEnEvcXygkYeMpuyb8lMcTFHRQHIQqXjMXF+82ATunpeEcZPTDCHfP/ocsh0UwcdpFSDfcOFQPj6FXGh/Rpr5otx78nWOr6b9CbYM3GVY0DlcZ2ZjnaSY7ddLVP1Iv+lrYl5L4asD/dsJV6T2GSn7T5n9uga2b+pZMV/PpkCgYAhpnZA0IqSM215q066FGWuQUH5dxPAnoXL07DBAQPSmohSsH8N0b1mIlI66RoqIT3aWjGeiCXZICYSeZ4OF/rtVpqrO5KTkNDQt7zNu8ftowqnWkNybabKPsKlSvMNZoMD5hMG4qQf936I3qg+ws0SgVKgT/jDPICgF+KnbFfXoQKBgQCaJ7tSOdHsitSMaxyD9CEdO6oejPv9bZEUZjnkGLU05yE/W+5w2+aEdwmQUvrxN9jpbOXd24TfuznESBOldiF1StVmyUm7i2/9/P0kdZy2Om4YP3KU82OEwD4bAwq8Vnxn7olzn9GfnOLdr640J50a34Guga5W+rI32xHn6L4g3A==";
    private final String CHARSET = "UTF-8";
    // 支付宝公钥
    private final String ALIPAY_PUBLIC_KEY = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAjFfcRBfcDjKd6BydlkqkHnevqJeoISurT6w09WDfmjfnipr505ePIPIsIPudck5lnPevQJvyRIuNX2H2bSExDyTzJeamGUHuuIJgrRn2AdCOzHgyQdKXsu+9QiGwQIGR+zwWwOFJV7Op0w200iEEDQ83wC6LdL00UoJUwNm/Xj28E70rLJuzluvbcHeYPATgPvZqIXM5GR5h3FcqfiVTfweWwXEtyrS7pZLHZ3Juo36+F856vHDskhjQVI9RCbnTGL418OJbqsCmsLNc5wGQsM+PYhm2zDwMOeoRw31RHtBxXnFQj2amGcBNtM7UNjMs2RzsyKSf0UGBZzswIif3CwIDAQAB";
    //这是沙箱接口路径,正式路径为https://openapi.alipay.com/gateway.do
    private final String GATEWAY_URL ="https://openapi.alipaydev.com/gateway.do";
    private final String FORMAT = "JSON";
    //签名方式
    private final String SIGN_TYPE = "RSA2";
    //支付宝异步通知路径,付款完毕后会异步调用本项目的方法,必须为公网地址
//    private final String NOTIFY_URL = "http://127.0.0.1/notifyUrl";
    //支付宝同步通知路径,也就是当付款完毕后跳转本项目的页面,可以不是公网地址
    private final String RETURN_URL = "http://localhost:8080/app/returnUrl";


    @ResponseBody
    @RequestMapping("/pay/beforePay")
    public String beforePay(Long feeId){
        //请求支付 feeId对应的记录
        //检查数据库，状态是否已经支付过，业务上要参考一下百度，避免和处理一些异常情况。暂时先简单写一下
        //1.拿到feeId对应的记录
        //2.为空则返回：支付状态异常 请刷新
        //3.不为空，检查状态字段，状态字段为0未支付，若为1，返回该订单已支付
        //4.根据拿到的实体类，得到其中的 totalFee，返回给前端需要跳转的支付页面
        return "http://localhost:8080/app/pay/alipay?dona_money=11900&dona_id=1";

    }

    //必须加ResponseBody注解，否则spring会寻找thymeleaf页面
    @ResponseBody
    @RequestMapping("/pay/alipay")
    public String alipay(HttpSession session,
                         Model model,
                         @RequestParam("dona_money") float dona_money,
                         @RequestParam("dona_id") int dona_id) throws AlipayApiException {

//        把dona_id项目id 放在session中
        session.setAttribute("dona_id",dona_id);

        //生成订单号（支付宝的要求？）
        String time = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
        String user = UUID.randomUUID().toString().replace("-","").toUpperCase();

        String OrderNum = time+user;

        //调用封装好的方法（给支付宝接口发送请求）
        return sendRequestToAlipay(OrderNum,dona_money,"ghjk");
    }

    /*
参数1：订单号
参数2：订单金额
参数3：订单名称
 */
    //支付宝官方提供的接口
    private String sendRequestToAlipay(String outTradeNo,Float totalAmount,String subject) throws AlipayApiException {
        //获得初始化的AlipayClient
        AlipayClient alipayClient = new DefaultAlipayClient(GATEWAY_URL,APP_ID,APP_PRIVATE_KEY,FORMAT,CHARSET,ALIPAY_PUBLIC_KEY,SIGN_TYPE);

        //设置请求参数
        AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
        alipayRequest.setReturnUrl(RETURN_URL);
//        alipayRequest.setNotifyUrl(NOTIFY_URL);

        //商品描述（可空）
        String body="学费缴纳";
        alipayRequest.setBizContent("{\"out_trade_no\":\"" + outTradeNo + "\","
                + "\"total_amount\":\"" + totalAmount + "\","
                + "\"subject\":\"" + subject + "\","
                + "\"body\":\"" + body + "\","
                + "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
        //请求
        String result = alipayClient.pageExecute(alipayRequest).getBody();
        return result;
    }

//    @ResponseBody
//    @RequestMapping("/pay/success")
//    public String success() {
//        //支付成功业务操作
//
//        System.out.println("pay success");
//        //支付成功页面回显
//        return "pay success!";
//    }
    @RequestMapping("/returnUrl")
    @ResponseBody
    public String returnUrlMethod(HttpServletRequest request, HttpSession session, Model model) throws AlipayApiException, UnsupportedEncodingException {
        System.out.println("=================================同步回调=====================================");

        // 获取支付宝GET过来反馈信息
        Map<String, String> params = new HashMap<String, String>();
        Map<String, String[]> requestParams = request.getParameterMap();
        for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
            String name = (String) iter.next();
            String[] values = (String[]) requestParams.get(name);
            String valueStr = "";
            for (int i = 0; i < values.length; i++) {
                valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
            }
            // 乱码解决，这段代码在出现乱码时使用
            valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
            params.put(name, valueStr);
        }

        System.out.println(params);//查看参数都有哪些
        //验证签名（支付宝公钥）
        boolean signVerified = AlipaySignature.rsaCheckV1(params, ALIPAY_PUBLIC_KEY, CHARSET, SIGN_TYPE); // 调用SDK验证签名
        //验证签名通过
        if(signVerified){
            // 商户订单号
            String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

            // 支付宝交易流水号
            String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

            // 付款金额
            float money = Float.parseFloat(new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8"));

            System.out.println("商户订单号="+out_trade_no);
            System.out.println("支付宝交易号="+trade_no);
            System.out.println("付款金额="+money);

            //在这里编写自己的业务代码（对数据库的操作）
			/*
			################################
			*/
            //跳转到提示页面（成功或者失败的提示页面）
            model.addAttribute("flag",1);
            model.addAttribute("msg","支持");
            return "pay success";
        }else{
//            //跳转到提示页面（成功或者失败的提示页面）
            model.addAttribute("flag",0);
            model.addAttribute("msg","支持");
            return "pay failed";
        }
    }


}