public class Ejercicio5 {
    public static void main(String[] args) {
        String number = "145";
        int base = 10;

        int decimalNumber = baseToDecimal(number, base);

        System.out.println("Numero decimal: " + decimalNumber);
    }

    private static int baseToDecimal(String number, int base) {
        int decimalNumber = 0;
        int power = 0;

        for (int i = number.length() - 1; i >= 0; i--) {
            int digit = Character.getNumericValue(number.charAt(i));
            decimalNumber += digit * Math.pow(base, power);
            power++;
        }

        return decimalNumber;
    }
}
