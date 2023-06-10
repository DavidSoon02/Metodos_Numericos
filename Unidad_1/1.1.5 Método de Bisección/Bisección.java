
package Biseccion;

import java.util.Scanner;

public class Biseccion {

    public static void main(String[] args) {
             Scanner scanner = new Scanner(System.in);

        // Ingresar los valores iniciales
        System.out.print("Ingrese el Pirmer valor: ");
        double valor = scanner.nextDouble();

        System.out.print("Ingrese el segundo valor: ");
        double valor1 = scanner.nextDouble();

        System.out.print("Ingrese la tolerancia: ");
        double tolerancia = scanner.nextDouble();

        // Llamada al método de bisección
        double root = bisectionMethod(valor, valor1, tolerancia);

        // Mostrar el resultado
        System.out.println("La raiz aproximada es: " + root);
    }

    public static double bisectionMethod(double valor, double valor1, double tolerancia) {
        double c = (valor + valor1) / 2;

        while (Math.abs(valor - valor1) > tolerancia) {
            if (function(valor) * function(c) < 0) {
                valor1 = c;
            } else {
                valor = c;
            }

            c = (valor + valor1) / 2;
        }

        return c;
    }

    // Función de ejemplo: f(x) = x^3 - x - 2
    public static double function(double x) {
        return Math.pow(x, 3) - x - 2;
    }
}
