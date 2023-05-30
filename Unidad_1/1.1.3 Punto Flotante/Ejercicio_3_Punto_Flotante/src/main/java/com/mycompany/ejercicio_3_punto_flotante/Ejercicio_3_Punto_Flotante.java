/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Project/Maven2/JavaApp/src/main/java/${packagePath}/${mainClassName}.java to edit this template
 */

package com.mycompany.ejercicio_3_punto_flotante;

/**
 *
 * @author Daniel A
 */
public class Ejercicio_3_Punto_Flotante {
public static void main(String[] args) {
        int a = 150; // Valor máximo para un entero
        int b = 260; // Valor a sumar
        
        int sum = a + b; // Realizar la suma
        
        // Verificar si se produce un desbordamiento
        if ((a > 0 && b > 0 && sum < 0) || (a < 0 && b < 0 && sum >= 0)) {
            System.out.println("Desbordamiento detectado.");
        } else {
            System.out.println("No se produjo desbordamiento.");
        }
    }

    
}
