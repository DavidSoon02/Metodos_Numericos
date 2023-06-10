
package errores;
import java.util.Scanner;
public class Bolzano {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        System.out.println("Ingrese el extremo inferior del intervalo:");
        double dato = scanner.nextDouble();

        System.out.println("Ingrese el extremo superior del intervalo:");
        double dato1 = scanner.nextDouble();

        System.out.println("Ingrese la tolerancia:");
        double tolerancia = scanner.nextDouble();

        double respuesta = encontrarCero(dato, dato1, tolerancia);

        if (Double.isNaN(respuesta)) {
            System.out.println("No se encontró ningún punto en el intervalo donde la funcion se anule.");
        } else {
            System.out.println("Existe al menos un punto en el intervalo donde la funcion se anula.");
            System.out.println("Punto donde se anula: " + respuesta);
        }
    }

    public static double funcion(double x) {
        // Aquí defines tu propia función
        return x * x - 4;
    }

    public static double encontrarCero(double dato, double dato1, double tolerancia) {
        double puntoMedio;

        do {
            puntoMedio = (dato + dato1) / 2;

            if (Math.abs(funcion(puntoMedio)) <= tolerancia) {
                return puntoMedio;
            } else if (funcion(dato) * funcion(puntoMedio) < 0) {
                dato1 = puntoMedio;
            } else {
                dato = puntoMedio;
            }
        } while (Math.abs(dato1 - dato) > tolerancia);

        return Double.NaN; // No se encontró ningún punto donde la función se anule
    }
}



  