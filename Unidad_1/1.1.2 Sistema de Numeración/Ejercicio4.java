public class Ejercicio40 {
    public static void main(String[] args) {
        int number = 42;
        int base = 8;

        String binaryNumber = baseToBinary(number, base);

        System.out.println("Numero binario: " + binaryNumber);
    }

    private static String baseToBinary(int number, int base) {
        StringBuilder result = new StringBuilder();

        while (number > 0) {
            int remainder = number % 2; // Obtener el residuo de dividir por 2
            result.insert(0, remainder); // Agregar el residuo al inicio de la cadena
            number /= 2; // Dividir el número entre 2
        }

        return result.toString();
    }
}
