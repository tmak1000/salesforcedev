public class TemperatureConverter {
    
	// takes a fahrenheit temprature
    public static Decimal FahrenheitToCelsius(Decimal fh) {
		Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
    
}