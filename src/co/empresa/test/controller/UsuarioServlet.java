package co.empresa.test.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.empresa.test.dao.UsuarioDao;
import co.empresa.test.modelo.Usuario;

/**
 * Servlet implementation class UsuarioServlet
 */
@WebServlet("/")
public class UsuarioServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private UsuarioDao userDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UsuarioServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		this.userDao = new UsuarioDao();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		try {
			switch (action) {
				case "/new":
					showNewForm(request, response);
					break;
				case "/insert":
					insertarUsuario(request, response);
					break;
				case "/delete":
					eliminarUsuario(request, response);
					break;
				case "/edit":
					showEditForm(request, response);
					break;
				case "/update":
					actualizarUsuario(request, response);
					break;
				default:
					listUsuarios(request, response);
					break;
			}
		} catch (SQLException e) {
			// TODO: handle exception
			throw new ServletException();
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	private void showNewForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("usuario.jsp");
		dispatcher.forward(request, response);
	}

	private void insertarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("email");
		String pais = request.getParameter("pais");

		Usuario usuario = new Usuario(nombre, email, pais);

		this.userDao.insert(usuario);

		response.sendRedirect("list");
	}
	
	private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		this.userDao.delete(id);
		
		response.sendRedirect("list");
	}
	
	private void showEditForm(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		
		Usuario user = this.userDao.select(id);
		
		request.setAttribute("usuario", user);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("usuario.jsp");
		dispatcher.forward(request, response);
	}
	
	private void actualizarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		int id = Integer.parseInt(request.getParameter("id"));
		String nombre = request.getParameter("nombre");
		String email = request.getParameter("email");
		String pais = request.getParameter("pais");

		Usuario usuario = new Usuario(id, nombre, email, pais);

		this.userDao.update(usuario);

		response.sendRedirect("list");
	}
	
	private void listUsuarios(HttpServletRequest request, HttpServletResponse response)
			throws SQLException, IOException, ServletException {
		List<Usuario> listUsuarios = this.userDao.selectAll();
		
		request.setAttribute("listUsuarios", listUsuarios);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("usuariolist.jsp");
		dispatcher.forward(request, response);
	}

}
