import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Dimension;
import java.math.BigDecimal;
import java.math.MathContext;
import java.math.RoundingMode;
import java.util.Scanner;
import javax.swing.JFrame;
import javax.swing.JPanel;
import org.jfree.chart.ChartFactory;
import org.jfree.chart.ChartPanel;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.xy.DefaultXYDataset;

public class propagacionerrores {
    public static void main(String[] args) {
        // Obtener el valor de x desde la entrada del usuario
        Scanner scanner = new Scanner(System.in);
        System.out.print("Ingrese el valor de x: ");
        double valorX = scanner.nextDouble();

        // Calcular (e^x) / (e^x-1)
        BigDecimal x = BigDecimal.valueOf(valorX);
        BigDecimal ex = calcularExponencial(x);
        BigDecimal exMenos1 = ex.subtract(BigDecimal.ONE);
        BigDecimal resultado = ex.divide(exMenos1, new MathContext(50, RoundingMode.HALF_UP));

        // Imprimir el resultado en la consola con todos los decimales
        System.out.println("El resultado es: " + resultado.toPlainString());

        // Calcular los valores de (e^x) / (e^x-1) para la gráfica
        double[] valoresX = new double[1000];
        for (int i = 0; i < valoresX.length; i++) {
            valoresX[i] = valorX - 250 + (i * 0.1);
        }

        double[] valoresY = new double[valoresX.length];
        for (int i = 0; i < valoresY.length; i++) {
            double xGrafica = valoresX[i];
            BigDecimal exGrafica = calcularExponencial(BigDecimal.valueOf(xGrafica));
            BigDecimal exMenos1Grafica = exGrafica.subtract(BigDecimal.ONE);
            valoresY[i] = exGrafica.divide(exMenos1Grafica, new MathContext(50, RoundingMode.HALF_UP)).doubleValue();
        }

        // Crear el conjunto de datos XY para la gráfica
        DefaultXYDataset dataset = new DefaultXYDataset();
        dataset.addSeries("Función", new double[][] { valoresX, valoresY });

        // Crear el gráfico
        JFreeChart chart = ChartFactory.createXYLineChart(
                "Gráfica", // Título del gráfico
                "x", // Etiqueta del eje x
                "(e^x) / (e^x-1)", // Etiqueta del eje y
                dataset, // Conjunto de datos
                PlotOrientation.VERTICAL, // Orientación del gráfico
                true, // Mostrar leyenda
                true, // Mostrar tooltips
                false // No generar URLs
        );

        // Personalizar la apariencia del gráfico
        XYPlot plot = chart.getXYPlot();
        plot.setBackgroundPaint(Color.WHITE);
        plot.setRangeGridlinePaint(Color.LIGHT_GRAY);

        // Ajustar el rango del eje y para mostrar la curvatura
        NumberAxis rangeAxis = (NumberAxis) plot.getRangeAxis();
        rangeAxis.setAutoRangeIncludesZero(false);
        rangeAxis.setRange(0, 2); // Ajustar el rango del eje y como se desee

        // Personalizar la apariencia de la línea de la función
        XYLineAndShapeRenderer renderer = (XYLineAndShapeRenderer) plot.getRenderer();
        renderer.setSeriesStroke(0, new BasicStroke(2f));
        renderer.setSeriesPaint(0, Color.BLUE);

        // Crear el panel de la gráfica y mostrarla en una ventana
        ChartPanel chartPanel = new ChartPanel(chart);
        chartPanel.setPreferredSize(new Dimension(800, 600));

        JFrame frame = new JFrame("Gráfica");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setContentPane(chartPanel);
        frame.pack();
        frame.setVisible(true);
    }

    // Calcular la función exponencial utilizando la expansión en serie de Taylor
    private static BigDecimal calcularExponencial(BigDecimal x) {
        BigDecimal resultado = BigDecimal.ONE;
        BigDecimal termino = BigDecimal.ONE;
        BigDecimal factorial = BigDecimal.ONE;

        for (int i = 1; i <= 50; i++) {
            termino = termino.multiply(x).divide(factorial, new MathContext(50, RoundingMode.HALF_UP));
            resultado = resultado.add(termino);
            factorial = factorial.multiply(BigDecimal.valueOf(i));
        }

        return resultado.round(new MathContext(50, RoundingMode.HALF_UP));
    }
}

