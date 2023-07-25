
package taylor;

import java.util.Scanner;

public class Taylor {
// Programa N°1
   /* public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.print("Ingrese el valor x: ");
            double dato = scanner.nextDouble();
           
            System.out.print("Ingrese el número términos: ");
            int termino = scanner.nextInt();
           
            double aproximacion = aproximacion(dato, termino);
            System.out.println("La aproximación de e^x es: " + aproximacion);
        }
    }
       static int factorial(int n) {
        if (n == 0 || n == 1) {
            return 1;
        } else {
            return n * factorial(n - 1);
        }
    }

    static double aproximacion(double x, int termino) {
        double aproximacion = 0;
        for (int i = 0; i < termino; i++) {
            aproximacion += Math.pow(x, i) / factorial(i);
        }
        return aproximacion;
    }
}*/

// Programa N°2
   /* public static void main(String[] args) {
        try (Scanner scanner = new Scanner(System.in)) {
            System.out.print("Ingrese el valor x: ");
            double dato = scanner.nextDouble();
           
            System.out.print("Ingrese el número términos: ");
            int termino = scanner.nextInt();
           
            double aproximacion = Logaritmo(dato, termino);
            System.out.println("La aproximación de ln(1 + x): " + aproximacion);
        }
    }

 static double Logaritmo(double x, int termino) {
        double respuesta = 0;
        for (int i = 1; i <= termino; i++) {
            respuesta += Math.pow(-1, i + 1) * Math.pow(x, i) / i;
        }
        return respuesta;
    }
}*/




// Programa N°3
   
    public static void main(String[] args) {
        Scanner leer = new Scanner(System.in);

        System.out.print("Ingrese el límite inferior: ");
        double valorinf = leer.nextDouble();

        System.out.print("Ingrse el límite superior: ");
        double valorsu = leer.nextDouble();

        System.out.print("Introduce el número de trapecios: ");
        int ntra = leer.nextInt();

        double aproximacion = trapecio(valorinf, valorsu, ntra);
        System.out.println("Aproximación de la integral definida: " + aproximacion);

        leer.close();
    }
// Función a integrar: f(x) = e^(-x^2)
 static double funcion(double x) {
        return Math.exp(-x * x);
    }

    // Regla del trapecio para aproximar la integral definida
    static double trapecio(double valorinf, double valorsu, int ntra) {
        double h = (valorsu - valorinf) / ntra;
        double suma = (funcion(valorinf) + funcion(valorsu)) / 2.0;

        for (int i = 1; i < ntra; i++) {
            double xi = valorinf + i * h;
            suma += funcion(xi);
        }

        return h * suma;
    }
}