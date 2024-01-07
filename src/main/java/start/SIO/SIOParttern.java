package start.SIO;

import lombok.Data;
import lombok.NoArgsConstructor;
import my.smartdec.detect.repaire.util.MathUtil;
import my.smartdec.detect.repaire.util.StringUtil;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Stack;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Data
@NoArgsConstructor
public class SIOParttern {

    private String expression = "amount*number+c>0";

    private  String filePath = "D:\\DectionContract\\SolidityDetection-main\\test\\overTest.txt";
    private Integer line = 10 ;
    private String firstExpression;


    public static void main(String[] args) throws IOException {
        SIOParttern sio = new SIOParttern();
        sio.SIO003(" ",0," ");
    }


    public  void SIO003(String expression,int line,String path) throws IOException {
        //String expression = "amount-number";
        this.firstExpression = StringUtil.spiltExpressionReturnFirst(this.expression);
        System.out.println(this.firstExpression);
        // 使用正则表达式匹配数字和字符变量
        String pattern = "[\\d.]+|[a-zA-Z]+";

        Pattern p = Pattern.compile(pattern);
        Matcher m = p.matcher(this.firstExpression);
        List<String> varList = new ArrayList<String>();
        System.out.println(this.firstExpression+"sssss");
        // 保存匹配到的数字和字符变量
        while (m.find()) {
           //String match = m.group();
            varList.add(m.group());
           // System.out.println(match);
        }
        System.out.println(varList);

        if(varList.size()==2){
           // twoToSafeMath(varList);
        }else{
            List<String> postfixExpression = MathUtil.ReversePolishNotation(this.firstExpression);
            System.out.println("hahha"+postfixExpression);
            moreToSafeMath(postfixExpression);
        }
    }



    public  void twoToSafeMath(List<String> varLsit) throws IOException {
        Path file = Paths.get(this.filePath);
        List<String> lines = null;
        try {
            lines = Files.readAllLines(file);

        } catch (IOException e) {
            e.printStackTrace();
        }
        // 使用正则表达式匹配运算符号
        String pattern = "[-+*]";
        Pattern p = Pattern.compile(pattern);
        Matcher m = p.matcher(this.expression);
        String lineContext =lines.get(this.line - 1);

        // 获取匹配到的运算符号
        if (m.find()) {
            String operator = m.group();

            switch (operator){
                case "-":{
                    String replaceCode = String.format("%s.sub(%s)", varLsit.get(0),varLsit.get(1));
                    System.out.println(replaceCode);
                    String newCode = lineContext.replace(this.expression ,replaceCode );
                    System.out.println(newCode);
                    lines.set(line - 1, newCode);
                    Files.write(file, lines);
                    break;
                }
                case "*":{
                    String replaceCode = String.format("%s.mul(%s)", varLsit.get(0),varLsit.get(1));
                    System.out.println(replaceCode);
                    String newCode = lineContext.replace(this.expression ,replaceCode );
                    System.out.println(newCode);
                    lines.set(line - 1, newCode);
                    Files.write(file, lines);
                    break;
                }
                case "+":{
                    String replaceCode = String.format("%s.add(%s)", varLsit.get(0),varLsit.get(1));
                    System.out.println(replaceCode);
                    String newCode = lineContext.replace(this.expression ,replaceCode );
                    System.out.println(newCode);
                    lines.set(line - 1, newCode);
                    Files.write(file, lines);
                    break;
                }
            }

            //为其添加using SafeMath for uint256;
           // for(String context:lines)
        } else {
            System.out.println("No operator found in the expression.");
        }
    }

    public void moreToSafeMath(List<String> postfixExpression){
        Stack<String> parameter = new Stack<>();
        String FMode=null;
        String LMode = null;
        String modeText = null;
        String LastParameter = null;
      //  Stack<String> operators = new Stack<>();
        for(int i =0;i<postfixExpression.size();i++){

            String e =postfixExpression.get(i);


            if (e.equals("+")||e.equals("-")||e.equals("/")||e.equals("*")){
                if(e.equals("/")){

                }else {
                    switch (e){
                        case "+":{
                            FMode = parameter.pop();
                            LMode = parameter.pop();

                            modeText = String.format("%s.add(%s)", LMode,FMode);
                            parameter.push(modeText);
                            break;
                        }
                    }


                }
            }else{
                parameter.push(e);
            }

        }
        modeText = parameter.pop();
        System.out.println(modeText);
    }


}
