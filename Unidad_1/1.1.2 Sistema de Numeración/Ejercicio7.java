public class Ejercicio70 {
    public static void main(String[] args) {
        String number = "C";
        int base = 16;

        int decimalNumber = baseToDecimal(number, base);

        System.out.println("Número decimal: " + decimalNumber);
    }

    private static int baseToDecimal(String number, int base) {
        int decimalNumber = 0;
        int power = 0;

        for (int i = number.length() - 1; i >= 0; i--) {
            char digit = number.charAt(i);
            int decimalValue = getDecimalValue(digit);
            decimalNumber += decimalValue * Math.pow(base, power);
            power++;
        }

        return decimalNumber;
    }

    private static int getDecimalValue(char digit) {
        if (Character.isDigit(digit)) {
            return digit - '0';
        } else {
            return digit - 'A' + 10;
        }
    }
}
