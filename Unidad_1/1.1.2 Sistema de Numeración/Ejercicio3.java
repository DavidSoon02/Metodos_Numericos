public class Ejercicio3 {
    public static void main(String[] args) {
        double number = 42;
        int integerPart = (int) number; // Parte entera del número
        double fractionalPart = number - integerPart; // Parte fraccionaria del número

        String binaryIntegerPart = decimalToBase(integerPart, 2); // Convertir parte entera a binario
        String binaryFractionalPart = decimalFractionToBase(fractionalPart, 2); // Convertir parte fraccionaria a binario

        String binaryNumber = binaryIntegerPart + "." + binaryFractionalPart; // Concatenar parte entera y fraccionaria

        System.out.println("Número binario: " + binaryNumber);
    }

    private static String decimalToBase(int number, int base) {
        return Integer.toString(number, base);
    }

    private static String decimalFractionToBase(double number, int base) {
        StringBuilder result = new StringBuilder();
        int precision = 16; // Precisión deseada para la parte fraccionaria

        while (number != 0 && precision > 0) {
            number *= base;
            int digit = (int) number;
            result.append(digit);
            number -= digit;
            precision--;
        }

        return result.toString();
    }
}
