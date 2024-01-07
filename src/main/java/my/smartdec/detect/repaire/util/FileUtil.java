package my.smartdec.detect.repaire.util;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardOpenOption;
import java.util.ArrayList;
import java.util.List;

public class FileUtil {
    public static void RemoveEmptyLinesAndComments(String filename){
        String f = PropertiesUtil.contractsFile+filename;
        Path file = Paths.get(f);

        try {
            List<String> lines = Files.readAllLines(file);
            List<String> filteredLines = new ArrayList<>();

            for (String line : lines) {
                // 去除空行和以双斜杠（//）开始的单行注释
                if (!line.trim().isEmpty() && !line.trim().startsWith("//")&& !line.trim().startsWith("/*")&& !line.trim().startsWith("*")) {
                    filteredLines.add(line);
                }
            }

            // 输出去除空行和注释后的文本
//            for (String filteredLine : filteredLines) {
//                System.out.println(filteredLine);
//            }
            Files.write(file, filteredLines, StandardOpenOption.WRITE, StandardOpenOption.TRUNCATE_EXISTING);
        } catch (IOException e) {
            System.err.println("无法读取文件：" + e.getMessage());
        }
    }
}
