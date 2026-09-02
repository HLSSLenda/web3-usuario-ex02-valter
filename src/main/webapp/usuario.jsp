<%@ page import="br.edu.ifpr.irati.ads.model.Usuario" %>
<%@ page import="org.hibernate.Session" %>
<%@ page import="br.edu.ifpr.irati.ads.dao.HibernateUtil" %>
<%@ page import="br.edu.ifpr.irati.ads.dao.GenericDao" %>
<%@ page import="br.edu.ifpr.irati.ads.dao.Dao" %>
<%@ page import="org.hibernate.HibernateException" %>
<%@ page import="java.time.LocalDate" %>
<%
    try (Session bdSession = HibernateUtil.getSessionFactory().openSession()) {
        Dao<Usuario> usuarioDao = new GenericDao<>(Usuario.class, bdSession);

        String operation = request.getParameter("operation");
        Long id = null;
        try{
            id = Long.parseLong(request.getParameter("id"));
        } catch (NumberFormatException nfe) { }

        Usuario usuarioSessao;
        if (operation != null && operation.equals("delete")) {
            Usuario usuarioExcluir = usuarioDao.buscarPorId(id);
            usuarioDao.excluir(usuarioExcluir);
            usuarioSessao = new Usuario();
        } else if (operation != null && operation.equals("update")) {
            usuarioSessao = usuarioDao.buscarPorId(id);
        } else {
            String nome = request.getParameter("nome");
            String email = request.getParameter("email");
            String cpf = request.getParameter("cpf");
            String dataNascimentoRaw = request.getParameter("dataNascimento");

            LocalDate dataNascimento;
            if (dataNascimentoRaw == null || dataNascimentoRaw.isBlank())
                dataNascimento = null;
            else {
                try {
                    dataNascimento = LocalDate.parse(dataNascimentoRaw);
                } catch (Exception e) {
                    dataNascimento = null;
                }
            }

            if (id != null && id == 0) { // salvar novo
                Usuario usuario = new Usuario(id, nome, email, cpf, dataNascimento);
                usuarioDao.salvar(usuario);
                usuarioSessao = new Usuario();
            } else if (id != null) { // atualizar registro
                Usuario usuario = usuarioDao.buscarPorId(id);
                usuario.setNome(nome);
                usuario.setEmail(email);
                usuario.setCpf(cpf);
                usuario.setDataNascimento(dataNascimento);
                usuarioDao.alterar(usuario);
                usuarioSessao = new Usuario();
            } else { // request sem passagem de parâmetros
                usuarioSessao = new Usuario();
            }
        }
        session.setAttribute("usuario", usuarioSessao);
        session.setAttribute("usuarios", usuarioDao.buscarTodos());
        response.sendRedirect("index.jsp");
    } catch (HibernateException he) {
        throw new Exception("Conexão com o banco de dados indisponível.", he);
    }
%>