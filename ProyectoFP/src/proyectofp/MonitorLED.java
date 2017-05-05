package proyectofp;

public class MonitorLED {
	String modelo;
	String precio;
	String resolucion;
	String marca;
	String tipo;
	String cantidad;
	
	public MonitorLED(String mo, String p, String r, String ma, String t, String c) {
		this.modelo = mo;
		this.precio = p;
		this.resolucion = r;
		this.marca = ma;
		this.tipo = t;
		this.cantidad = c;
		
	}

	public String getCantidad() {
		return cantidad;
	}

	public void setCantidad(String cantidad) {
		this.cantidad = cantidad;
	}

	public String getModelo() {
		return modelo;
	}

	public void setModelo(String modelo) {
		this.modelo = modelo;
	}

	public String getPrecio() {
		return precio;
	}

	public void setPrecio(String precio) {
		this.precio = precio;
	}

	public String getResolucion() {
		return resolucion;
	}

	public void setResolucion(String resolucion) {
		this.resolucion = resolucion;
	}

	public String getMarca() {
		return marca;
	}

	public void setMarca(String marca) {
		this.marca = marca;
	}

	public String getTipo() {
		return tipo;
	}

	public void setTipo(String tipo) {
		this.tipo = tipo;
	}
	
	
}
