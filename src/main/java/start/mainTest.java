package start;
import java.io.*;
import java.nio.file.*;
import java.util.*;
public class mainTest {
    public static void main(String[] args) throws IOException {
        Path file = Paths.get("D:\\DectionContract\\SolidityDetection-main\\test\\test11.sol");

        try {
            List<String> lines = Files.readAllLines(file);
            List<String> filteredLines = new ArrayList<>();

            for (String line : lines) {
                // 去除空行和以双斜杠（//）开始的单行注释
                if (!line.trim().isEmpty() && !line.trim().startsWith("//")) {
                    filteredLines.add(line);
                }
            }

            // 输出去除空行和注释后的文本
            for (String filteredLine : filteredLines) {
                System.out.println(filteredLine);
            }
            Files.write(file, filteredLines, StandardOpenOption.WRITE, StandardOpenOption.TRUNCATE_EXISTING);
        } catch (IOException e) {
            System.err.println("无法读取文件：" + e.getMessage());
        }

    }

}
