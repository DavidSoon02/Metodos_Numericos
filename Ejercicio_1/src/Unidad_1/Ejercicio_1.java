/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Unidad_1;
import java.math.BigInteger;
/**
 *
 * @author fing.labcom
 */
public class Ejercicio_1 {

   //Ejercicio 1
       public static void main(String[] args) {
    // En caso de inicio calcula como 0.51 * 10^2
        double inicio = 0.50 * Math.pow(10, 2);
         double inicio2 = 0.51 * Math.pow(10, 2);
        double a = 100;
    // Luego, se calcula el error absoluto restando a de inicio y tomando el valor absoluto del resultado.
        double errorAbsoluto = Math.abs(inicio - a);
        double errorAbsoluto2 = Math.abs(inicio2 - a);
    // El error relativo se calcula dividiendo el error absoluto por inicio. Los resultados se imprimen en la consola    
        double errorRelativo = errorAbsoluto / inicio;
        double errorRelativo2 = errorAbsoluto2 / inicio2;  
        System.out.println("El error absoluto1 es: " + errorAbsoluto);
        System.out.println("El error relativo1 es: " + errorRelativo);
        
        System.out.println("El error absoluto2 es: " + errorAbsoluto2);
        System.out.println("El error relativo2 es: " + errorRelativo2);
        
     //Ejercicio 2
      String numeroBinario = "101111";
        int decimal = convertirBinarioADecimal(numeroBinario);
        System.out.println("El número decimal que corresponde a " + numeroBinario + " es: " + decimal);
        //Ejercicio3
      int numeroDecimal = 27025;
        String numeroBinario1 = convertirDecimalABinario(numeroDecimal);
        System.out.println("El número decimal correspondiente a " + numeroDecimal + " es: " + numeroBinario1);
        //Ejercicio 4
        String numeroOctal = "42"; // Número en base 8

        int numeroDecimal3 = 0;
        int power = 0;
        for (int i = numeroOctal.length() - 1; i >= 0; i--) {
            int digit = Character.getNumericValue(numeroOctal.charAt(i));
            numeroDecimal3 += digit * Math.pow(8, power);
            power++;
        }

        System.out.println("El número en base 8 " + numeroOctal + " es equivalente a decimal " + numeroDecimal3);
    
        //Ejercicio 5
            int numeroDecimal5 = 64; // Número en base 10

        StringBuilder numeroBinario5 = new StringBuilder();
        while (numeroDecimal5  > 0) {
            int remainder = numeroDecimal5  % 2;
            numeroBinario5.insert(0, remainder);
            numeroDecimal5 /= 2;
        }

        System.out.println("El número en base 10 " + numeroDecimal5  + " es equivalente a binario " + numeroBinario5.toString());
    
        //Ejercicio 6
         int numeroDecimal6 = 145; // Número en base 10

        String numeroBinario6 = convertirBiunario6(numeroDecimal6);

        System.out.println("El número en base 10 " + numeroDecimal6 + " es equivalente a binario " + numeroBinario6);
    
        //Ejercicio 7
        
    
        String numeroHex = "c16";

        BigInteger numeroDecimal7 = new BigInteger(numeroHex, 16);
        System.out.println("Número decimal: " + numeroDecimal7);
    }
    
       
           
    //Ejercicio2
    
    public static int convertirBinarioADecimal(String binario) {
        int decimal = 0;
        int longitud = binario.length();
        
        for (int i = 0; i < longitud; i++) {
            // Obtenemos el dígito en la posición i, empezando desde la derecha
            int digito = Character.getNumericValue(binario.charAt(longitud - 1 - i));
            
            // Multiplicamos el dígito por 2 elevado a la potencia correspondiente
            int potencia = (int) Math.pow(2, i);
            int valorParcial = digito * potencia;
            
            // Sumamos el valor parcial al resultado final
            decimal += valorParcial;
        }
        
        return decimal;
    }
    //Ejercicio 3
    public static String convertirDecimalABinario(int numeroDecimal) {
        StringBuilder binary = new StringBuilder();
        while (numeroDecimal > 0) {
            int remainder = numeroDecimal % 2;
            binary.insert(0, remainder);
            numeroDecimal /= 2;
        }
        return binary.toString();
    }
            
     

    public static String convertirBiunario6(int number) {
        StringBuilder binario6 = new StringBuilder();

        while (number > 0) {
            binario6 .insert(0, number % 2);
            number /= 2;
        }

        return binario6 .toString();
    }
}
