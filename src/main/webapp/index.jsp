<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="br.edu.ifpr.irati.ads.model.Usuario" %>
<%@ page import="java.util.List" %>
<%
    List<Usuario> usuarios = (List<Usuario>) session.getAttribute("usuarios");
    if (usuarios == null){
        response.sendRedirect("usuario.jsp");
        return;
    }
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        usuario = new Usuario();
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>Cadastro de Usuários</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">

    <% if (usuario.getId() != null && usuario.getId() != 0){ %>
    <script type="text/javascript">
        window.onload = () => new bootstrap.Modal('#cadastroModal').show();
    </script>
    <%}%>

</head>
<body>
<div class="container mt-4">
    <div class="row">
        <div class="col">
            <table class="table table-hover table-responsive">
                <thead>
                <tr>
                    <th scope="col">Nome</th>
                    <th scope="col">E-mail</th>
                    <th scope="col">CPF</th>
                    <th scope="col">Data de Nascimento</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <% for (Usuario u: usuarios) { %>
                <tr>
                    <td><%= u.getNome() != null ? u.getNome() : "" %></td>
                    <td><%= u.getEmail() != null ? u.getEmail() : "" %></td>
                    <td><%= u.getCpf() != null ? u.getCpf() : "" %></td>
                    <td><%= u.getDataNascimento() != null ? u.getDataNascimento() : "" %></td>
                    <td class="text-end">
                        <a class="btn btn-success" href="usuario.jsp?operation=update&id=<%=u.getId()%>" role="button">Alterar</a>
                        <a class="btn btn-danger" href="usuario.jsp?operation=delete&id=<%=u.getId()%>" role="button">Excluir</a>
                    </td>
                </tr>
                <%}%>

                </tbody>
            </table>
            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#cadastroModal">
                Novo usuário
            </button>
        </div>
    </div>
</div>

<form action="usuario.jsp" method="get">
    <div class="modal" tabindex="-1" id="cadastroModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Usuário</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input type="hidden"
                           class="form-control"
                           id="id"
                           name="id"
                           value="<%= usuario.getId() != null ? usuario.getId() : 0 %>">

                    <div class="mb-3">
                        <label for="nome" class="form-label">Nome</label>
                        <input type="text"
                               class="form-control"
                               id="nome"
                               aria-describedby="nomeHelp"
                               name="nome"
                               value="<%= usuario.getNome() != null ? usuario.getNome() : "" %>">
                        <div id="nomeHelp" class="form-text">Digite o nome completo.</div>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">E-mail</label>
                        <input type="email"
                               class="form-control"
                               id="email"
                               aria-describedby="emailHelp"
                               name="email"
                               value="<%= usuario.getEmail() != null ? usuario.getEmail() : "" %>">
                        <div id="emailHelp" class="form-text">Digite um e-mail válido.</div>
                    </div>

                    <div class="mb-3">
                        <label for="cpf" class="form-label">CPF</label>
                        <input type="text"
                               class="form-control"
                               id="cpf"
                               aria-describedby="cpfHelp"
                               name="cpf"
                               value="<%= usuario.getCpf() != null ? usuario.getCpf() : "" %>">
                        <div id="cpfHelp" class="form-text">Digite um CPF válido.</div>
                    </div>

                    <div class="mb-3">
                        <label for="dataNascimento" class="form-label">Data de Nascimento</label>
                        <input type="date"
                               class="form-control"
                               id="dataNascimento"
                               aria-describedby="dataNascimentoHelp"
                               name="dataNascimento"
                               value="<%= usuario.getDataNascimento() != null ? usuario.getDataNascimento() : "" %>">
                        <div id="dataNascimentoHelp" class="form-text">Informe a data de nascimento.</div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button id="cancel" type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancelar</button>
                    <button type="submit" class="btn btn-primary">Salvar</button>
                </div>
            </div>
        </div>
    </div>
</form>

<script type="text/javascript">
    document.getElementById("cancel").addEventListener("click", () => window.location.href = "usuario.jsp");
</script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
</body>
</html>