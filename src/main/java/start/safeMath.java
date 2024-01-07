package start;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class safeMath {
    public static void main(String[] args) {
        String input = "uint256 a = 1; uint256 public b = 2; int c;";

        // Define a regular expression pattern to match variable declarations
        Pattern pattern = Pattern.compile("(\\w+(?:\\s+\\w+)*)\\s+(\\w+)\\s*(?:=\\s*(.*?))?;");

        // Create a Matcher to find matches in the input string
        Matcher matcher = pattern.matcher(input);

        // Iterate through matches and extract type, name, and initial value
        while (matcher.find()) {
            String type = matcher.group(1);
            String name = matcher.group(2);
            String initialValue = matcher.group(3);

            // If initialValue is null, set it to a default value
            if (initialValue == null) {
                initialValue = "null";
            }

            // Output the extracted information
            System.out.println("Type: " + type);
            System.out.println("Name: " + name);
            System.out.println("Initial Value: " + initialValue);
        }
    }
}
