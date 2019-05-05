package com.chinasofti.utils;

import java.util.Random;

/**
 * @Description CodeUtil
 * @Author WYR
 * @CreateTime 2019-04-14 18:11
 */
public class CreateCode {

    /**
     * 定义图片上显示验证码的个数
     */
    private static int codeCount = 4;

    private static char[] codeSequence = {'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R',
            'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z','0', '1', '2', '3', '4', '5', '6', '7', '8', '9'};

    /**
     * 生成一个map集合
     * code为生成的验证码
     * codePic为生成的验证码BufferedImage对象
     *
     * @return
     */
    public static String generateCode() {
        // 创建一个随机数生成器类
        Random random = new Random();

        // randomCode用于保存随机产生的验证码，以便用户登录后进行验证。
        StringBuffer randomCode = new StringBuffer();

        // 随机产生codeCount数字的验证码。
        for (int i = 0; i < codeCount; i++) {
            // 得到随机产生的验证码数字。
            String code = String.valueOf(codeSequence[random.nextInt(36)]);

            // 将产生的四个随机数组合在一起。
            randomCode.append(code);
        }
        //存放验证码
//        map.put("code", randomCode);
        //  System.out.println(map);
        String code = randomCode.toString();
        return code;
    }

    public static void main(String[] args) throws Exception {
        //创建文件输出流对象
//        OutputStream out = new FileOutputStream("D://imgCode/" + System.currentTimeMillis() + ".jpg");
        String code = CreateCode.generateCode();
//        ImageIO.write((RenderedImage) map.get("codePic"), "jpeg", out);
        System.out.println("验证码的值为：" + code);
    }
}
