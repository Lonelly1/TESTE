<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Livro"%>
<%@page import="dao.LivroDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROLE DE LIVROS</title>
    </head>
    <body>
        <%
            try{
                Livro li = new Livro();
                LivroDAO ald = new LivroDAO();
                if(request.getParameter("titulo").equals("") ||
                   request.getParameter("genero").equals("") ||
                   request.getParameter("editora").equals("") ){
                    response.sendRedirect("index.jsp");
                }else{
                   li.setTitulo_livro(request.getParameter("titulo"));
                   li.setGenero_livro(request.getParameter("genero"));
                   li.setEditora_livro(request.getParameter("editora"));
                    ald.inserir(li);
                    response.sendRedirect("index.jsp");
                }
            }catch(Exception erro){
                throw new RuntimeException("Erro 7:"+erro);
            }
        %>
    </body>
</html>
