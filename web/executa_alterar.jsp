<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="model.Livro"%>
<%@page import="dao.LivroDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTOLE DE LIVROS</title>
    </head>
    <body>
        <%
            try{
                Livro alu = new Livro();
                LivroDAO ald = new LivroDAO();
                if(request.getParameter("titulo").equals("") ||
                   request.getParameter("genero").equals("") ||
                   request.getParameter("editora").equals("")){
                    response.sendRedirect("index.jsp");
                }else{
                    alu.setTitulo_livro(request.getParameter("titulo"));
                    alu.setGenero_livro(request.getParameter("genero"));
                    alu.setEditora_livro(request.getParameter("editora"));
                    alu.setId_livro(Integer.parseInt(request.getParameter("codigo")));
                    ald.atualizar(alu);
                  out.print("<script>alert('Atualizado com sucesso');</script>");
                  out.print("<script>window.location.href='index.jsp'</script>");
                  response.sendRedirect("index.jsp");
             
                }
            }catch(Exception erro){
                throw new RuntimeException("Erro 8:"+erro);
            }
        %>
    </body>
</html>
