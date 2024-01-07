package my.smartdec.detect.repaire.util;

import java.io.*;

public class ProjectUtil {
    public static String i1 = null ;
    public static String i2 = null;
    public static String i3 = null;
    public static  void prettier(String fileName) {

        try {
            // 指定工作目录
           // String workingDirectory = "D:\\DectionContract\\SolidityDetection-main\\test";

//            String cmdCommand = "npx prettier --write --plugin=prettier-plugin-solidity D:\\DectionContract\\SolidityDetection-main\\"+fileName;
            String cmdCommand = "npx prettier --write --plugin=prettier-plugin-solidity "+PropertiesUtil.contractsFile+fileName;
            // 调用CMD命令
            ProcessBuilder processBuilder = new ProcessBuilder("cmd.exe", "/c", cmdCommand);

            // 设置工作目录
            processBuilder.directory(new File(PropertiesUtil.contractsFile));

            // 将错误输出流与标准输出流合并
            processBuilder.redirectErrorStream(true);

            // 启动进程
            Process process = processBuilder.start();

            // 获取命令输出结果
            InputStream inputStream = process.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream, "GBK"));
            String line;
            while ((line = reader.readLine()) != null) {
                if (i1==null){
                    i1 = line;
                }else if (i2==null){
                    i2 = line;
                }else if(i3==null){
                    i3 = line;
                }
                System.out.println(line);
            }

            // 等待命令执行完成
            process.waitFor();
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
