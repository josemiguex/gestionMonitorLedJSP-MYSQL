package proyectofp;

import java.io.IOException;
import java.net.URLDecoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import javax.swing.JOptionPane;

/**
 * Servlet implementation class MainServlet
 */

public class MainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MainServlet() {
		super();
		// TODO Auto-generated constructor stub

	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Context ctx;
		Connection connection = null;
		Statement stmt = null;
		String action = request.getParameter("action");
		MonitorLED[] monitorled = null;
		MonitorLED mled = null;
		String nextJSP = "";
		switch (action) {

		case "main":

			if (request.getParameter("duplicado") != null && request.getParameter("duplicado").equals("true")) {
				request.setAttribute("duplicado", true);
			}

			int i = 0;
			MonitorLED[] monitorledaux = new MonitorLED[100];
			try {

				ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MonitorLED");
				connection = ds.getConnection();

				String query = "SELECT * FROM MonitorLED";
				stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(query);

				while (rs.next()) {
					String modelo = rs.getString("MODELO");
					String precio = rs.getString("PRECIO");
					String pulgadas = rs.getString("PULGADAS");
					String marca = rs.getString("MARCA");
					String tipo = rs.getString("TIPO");
					String cantidad = rs.getString("CANTIDAD");

					monitorledaux[i] = new MonitorLED(modelo, precio, pulgadas, marca, tipo, cantidad);
					i++;

				}

			} catch (NamingException e) {
				response.getWriter().append(e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
				response.getWriter().append(e.getMessage());
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			monitorled = new MonitorLED[i];
			for (int j = 0; j < i; j++) {
				monitorled[j] = new MonitorLED(monitorledaux[j].getModelo(), monitorledaux[j].getPrecio(),
						monitorledaux[j].getPulgadas(), monitorledaux[j].getMarca(), monitorledaux[j].getTipo(),
						monitorledaux[j].getCantidad());
			}
			request.setAttribute("monitorled", monitorled);
			nextJSP = "/index.jsp";

			break;
		case "addmonitorled":
			nextJSP = "/añadirUsuario.jsp";
			break;
		case "modifymonitorled":
			try {

				ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MonitorLED");
				connection = ds.getConnection();

				String query = "SELECT * FROM MonitorLED where MODELO='" + request.getParameter("modelo") + "'";
				stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(query);

				while (rs.next()) {
					String modelo = rs.getString("MODELO");
					String precio = rs.getString("PRECIO");
					String pulgadas = rs.getString("PULGADAS");
					String marca = rs.getString("MARCA");
					String tipo = rs.getString("TIPO");
					String cantidad = rs.getString("CANTIDAD");

					mled = new MonitorLED(modelo, precio, pulgadas, marca, tipo, cantidad);

				}

			} catch (NamingException e) {
				response.getWriter().append(e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
				response.getWriter().append(e.getMessage());
			} finally {
				if (stmt != null) {
					try {
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			request.setAttribute("monitorled", mled);
			nextJSP = "/modificarUsuario.jsp";
			break;
		case "deletemonitorled":
			nextJSP = "/confirmarEliminacion.jsp?modelo=" + request.getParameter("modelo");
			break;
		}
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Context ctx;
		Connection connection = null;
		Statement stmt = null;
		Statement stmt2 = null;
		boolean repetido = false;

		String action = request.getParameter("action");
		switch (action) {
		case "addedmonitorled":

			try {
				ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MonitorLED");
				connection = ds.getConnection();

				String query1 = "SELECT MODELO FROM MonitorLED";
				stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(query1);

				while (rs.next()) {
					if (rs.getString("MODELO").equals(request.getParameter("modelo"))) {
						repetido = true;
					}
				}

				if (!repetido) {
					String query2 = "INSERT INTO MonitorLED (MODELO, PRECIO, PULGADAS, MARCA, TIPO, CANTIDAD) VALUES ('"
							+ request.getParameter("modelo") + "','" + request.getParameter("precio") + "','"
							+ request.getParameter("pulgadas") + "','" + request.getParameter("marca") + "','"
							+ request.getParameter("tipo") + "','" + request.getParameter("cantidad") + "')";
					stmt2 = connection.createStatement();
					int insert = stmt2.executeUpdate(query2);
				}

			} catch (NamingException e) {
				response.getWriter().append(e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
				response.getWriter().append(e.getMessage());
			} finally {
				if (stmt != null) {
					try {
						if (!repetido) {
							response.sendRedirect(request.getContextPath() + "/MainServlet?action=main");
						} else {
							response.sendRedirect(request.getContextPath() + "/MainServlet?action=main&duplicado=true");
						}
						connection.close();
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			break;
		case "deletedmonitorled":
			try {
				ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MonitorLED");
				connection = ds.getConnection();

				String query = "DELETE FROM MonitorLED WHERE MODELO='" + request.getParameter("modelo") + "'";
				stmt = connection.createStatement();
				int insert = stmt.executeUpdate(query);

				// response.getWriter().append("</table>");
			} catch (NamingException e) {
				response.getWriter().append(e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
				response.getWriter().append(e.getMessage());
			} finally {
				if (stmt != null) {
					try {
						response.sendRedirect(request.getContextPath() + "/MainServlet?action=main");

						connection.close();
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			break;
		case "modifiedmonitorled":
			try {

				ctx = new InitialContext();
				DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/MonitorLED");
				connection = ds.getConnection();

				String query1 = "SELECT MODELO FROM MonitorLED";
				stmt = connection.createStatement();
				ResultSet rs = stmt.executeQuery(query1);

				while (rs.next()) {
					if (rs.getString("MODELO").equals(request.getParameter("modelo"))
							&& !rs.getString("MODELO").equals(request.getParameter("modeloantiguo"))) {
						repetido = true;
					}
				}

				if (!repetido) {
					String query = "UPDATE MonitorLED SET MODELO='" + request.getParameter("modelo") + "', PRECIO="
							+ request.getParameter("precio") + ", TIPO='" + request.getParameter("tipo")
							+ "', PULGADAS='" + request.getParameter("pulgadas") + "', MARCA='"
							+ request.getParameter("marca") + "', CANTIDAD='" + request.getParameter("cantidad")
							+ "' WHERE MODELO='" + request.getParameter("modeloantiguo") + "'";
					stmt = connection.createStatement();
					int insert = stmt.executeUpdate(query);
				}
				// response.getWriter().append("</table>");
			} catch (NamingException e) {
				response.getWriter().append(e.getMessage());
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
				response.getWriter().append(e.getMessage());
			} finally {
				if (stmt != null) {
					try {
						if (!repetido) {
							response.sendRedirect(request.getContextPath() + "/MainServlet?action=main");
						} else {
							response.sendRedirect(request.getContextPath() + "/MainServlet?action=main&duplicado=true");
						}
						connection.close();
						stmt.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			}
			break;
		}

	}

}
