import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.Scanner;

public class PropagacionErrores {
    public static void main(String[] args) {
        // Configuración de precisión arbitraria
        MathContext precision = new MathContext(50, RoundingMode.HALF_UP);

        // Obtener el valor de x desde la entrada del usuario
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese el valor de x: ");
        BigDecimal x = scanner.nextBigDecimal();

        // Calcular e^x y e^x-1
        BigDecimal ex = exp(x, precision);
        BigDecimal exMinus1 = ex.subtract(BigDecimal.ONE);

        // Calcular el resultado
        BigDecimal resultado = ex.divide(exMinus1, precision);

        // Imprimir el resultado
        System.out.println("El resultado es: " + resultado);
    }

    // Calcular la función exponencial utilizando la expansión en serie de Taylor
    private static BigDecimal exp(BigDecimal x, MathContext precision) {
        BigDecimal result = BigDecimal.ONE;
        BigDecimal term = BigDecimal.ONE;
        BigDecimal factorial = BigDecimal.ONE;

        for (int i = 1; i <= precision.getPrecision(); i++) {
            term = term.multiply(x).divide(factorial, precision);
            result = result.add(term);
            factorial = factorial.multiply(BigDecimal.valueOf(i));
        }

        return result.round(precision);
    }
}
