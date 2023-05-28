package com.mycompany.ejercicio_4_punto_flotante;

import java.util.Scanner;

/**
 * Esta clase realiza la conversión de un número entero a su representación en formato IEEE754 de 32 bits.
 */
public class Ejercicio_4_Punto_Flotante {
    
    /**
     * El método principal que se ejecuta al iniciar el programa.
     * Solicita al usuario ingresar un número entero, calcula su representación en formato IEEE754 y la muestra en la consola.
     *
     * @param args Los argumentos de la línea de comandos. No se utilizan en este programa.
     */
    public static void main(String[] args) {
        // Declaración de variables necesarias para la conversión
        int number;            // número entero 
        String signo;           // signo de la representación IEEE754
        String binario;         // número binario del número ingresado
        int exponente;          // exponente con normalización
        String exponente_binario; // representación binaria del exponente con normalización
        String mantisa;       // mantisa
        String ieee754;        // representación IEEE754 

        // Aquí se solicita al usuario ingresar un número entero
        System.out.println("Ingrese el número decimal:");
        Scanner leer = new Scanner(System.in);
        number = leer.nextInt();

        // Obtenemos el signo del número
        if (number < 0) {
            signo = "1";   // Si el número es negativo, establecemos el bit de signo en 1
            number = -number;  // Convertimos el número a su valor absoluto para realizar los cálculos
        } else {
            signo = "0";   // Si el número es positivo o cero, establecemos el bit de signo en 0
        }
        System.out.println("El signo es: " + signo);

        // Convertimos el número a su representación binaria
        binario = Integer.toBinaryString(number);
        System.out.println("El número binario del número ingresado es: " + binario);

        // Calculamos el exponente con normalización
        exponente = binario.length() - 1;   // El exponente se obtiene restando 1 a la longitud del número binario
        exponente_binario = Integer.toBinaryString(exponente + 127);   // Se suma 127 para obtener el valor del exponente con sesgo
        System.out.println("El exponente con normalización es: " + exponente);

        // Obtenemos la mantisa del número
        mantisa = binario.substring(1);   // La mantisa se obtiene eliminando el bit más significativo (el bit de signo)
        while (mantisa.length() < 23) {
            mantisa += "0";   // Se agrega ceros a la mantisa hasta que tenga una longitud de 23 bits
        }
        System.out.println("La mantisa es: " + mantisa);

        // Construimos la representación IEEE754 del número
        ieee754 = signo + exponente_binario + mantisa;   // Se concatenan el bit de signo, el exponente con sesgo y la mantisa
        System.out.println("El número en estándar IEEE754: " + ieee754);
    }
}
