package my.smartdec.detect.repaire.util;

import java.util.ArrayList;
import java.util.List;
import java.util.Stack;

public class MathUtil {

    public static List<String> ReversePolishNotation (String text) {
        //测试用例
        //String str = "1+2*3-4*5-6+7*8-9"; //123*+45*-6-78*+9-
        String str = "a+b*c+(d*e+f)*g"; // abcd*-*e+fg/hij*+k-*-
        //String str = "6*(5+(2+3)*8+3)"; //6523+8*+3+*
        //String str = "a+b*c+(d*e+f)*g"; //abc*+de*f+g*f

        Stack<Character> operators = new Stack<>(); //运算符
        Stack output = new Stack(); //输出结果
        Stack inversePut = new Stack();
        rpn(operators, output, text);
        while (!output.isEmpty()) {
            Object obj = output.pop();
            System.out.println("Pop: " + obj+obj.getClass());
            inversePut.push(obj);
        }

        List<String> charList = new ArrayList<>();
        while(!inversePut.isEmpty()){
            String s = String.valueOf(inversePut.pop());
            charList.add(s);
        }

        System.out.println(output);


        System.out.println(charList);

        return charList;

    }

    public static void rpn(Stack<Character> operators, Stack output, String str) {
        char[] chars = str.toCharArray();
        int pre = 0;
        boolean digital; //是否为数字（只要不是运算符，都是数字），用于截取字符串
        int len = chars.length;
        int bracket = 0; // 左括号的数量

        for (int i = 0; i < len; ) {
            pre = i;
            digital = Boolean.FALSE;
            //截取数字
            while (i < len && !Operator.isOperator(chars[i])) {
                i++;
                digital = Boolean.TRUE;
            }

            if (digital) {
                output.push(str.substring(pre, i));
            } else {
                char o = chars[i++]; //运算符
                if (o == '(') {
                    bracket++;
                }
                if (bracket > 0) {
                    if (o == ')') {
                        while (!operators.empty()) {
                            char top = operators.pop();
                            if (top == '(') {
                                break;
                            }
                            output.push(top);
                        }
                        bracket--;
                    } else {
                        //如果栈顶为 ( ，则直接添加，不顾其优先级
                        //如果之前有 ( ，但是 ( 不在栈顶，则需判断其优先级，如果优先级比栈顶的低，则依次出栈
                        while (!operators.empty() && operators.peek() != '(' && Operator.cmp(o, operators.peek()) <= 0) {
                            output.push(operators.pop());
                        }
                        operators.push(o);
                    }
                } else {
                    while (!operators.empty() && Operator.cmp(o, operators.peek()) <= 0) {
                        output.push(operators.pop());
                    }
                    operators.push(o);
                }
            }

        }
        //遍历结束，将运算符栈全部压入output
        while (!operators.empty()) {
            output.push(operators.pop());
        }
    }
}

enum Operator {
    ADD('+', 1), SUBTRACT('-', 1),
    MULTIPLY('*', 2), DIVIDE('/', 2),
    LEFT_BRACKET('(', 3), RIGHT_BRACKET(')', 3); //括号优先级最高
    char value;
    int priority;

    Operator(char value, int priority) {
        this.value = value;
        this.priority = priority;
    }

    /**
     * 比较两个符号的优先级
     *
     * @param c1
     * @param c2
     * @return c1的优先级是否比c2的高，高则返回正数，等于返回0，小于返回负数
     */
    public static int cmp(char c1, char c2) {
        int p1 = 0;
        int p2 = 0;
        for (Operator o : Operator.values()) {
            if (o.value == c1) {
                p1 = o.priority;
            }
            if (o.value == c2) {
                p2 = o.priority;
            }
        }
        return p1 - p2;
    }

    /**
     * 枚举出来的才视为运算符，用于扩展
     *
     * @param c
     * @return
     */
    public static boolean isOperator(char c) {
        for (Operator o : Operator.values()) {
            if (o.value == c) {
                return true;
            }
        }
        return false;
    }




}
