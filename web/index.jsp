<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.LivroDAO"%>
<%@page import="model.Livro"%>
<%@page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
    <head>        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROLE DE sdasdsadsadsad</title>
    </head>
    <body> 
         <form action="index.jsp" method="post">
            <label>TITULO</label><br>
            <input type="text" name="titulo"/><br>
            <button type="submit">PESQUISAR</button>               
        </form>
        <%
            try{
                out.print("<table border='1'>");
                out.print("<tr>");
                out.print("<th>CÓDIGO</th><th>TITULO</th><th>GENERO</th><th>EDITORA</th><th>EDITAR</th><th>EXCLUIR</th>");
                LivroDAO alu = new LivroDAO();         
                ArrayList<Livro> lista = alu.ListarTodos();
                for(int i = 0; i<lista.size(); i++){
                    out.print("<tr>");
                    out.print("<td>"+lista.get(i).getId_livro()+"</td>");
                    out.print("<td>"+lista.get(i).getTitulo_livro()+"</td>");
                    out.print("<td>"+lista.get(i).getGenero_livro()+"</td>");
                    out.print("<td>"+lista.get(i).getEditora_livro()+"</td>");
                    out.print("<td><a href='atualizar.jsp?codigo="+lista.get(i).getId_livro()+
                            "&titulo="+lista.get(i).getTitulo_livro()+
                            "&genero="+lista.get(i).getGenero_livro()+
                            "&editora="+lista.get(i).getEditora_livro()+"'>CLIQUE</a></td>");
                        out.print("<td><a href='excluir.jsp?codigo="+lista.get(i).getId_livro()+
                                "&nome="+lista.get(i).getTitulo_livro()+"'>CLIQUE</a></td>");
                        out.print("</tr>");                   
                    }                
                out.print("</tr>");
                out.print("</table>");            
            }catch(Exception erro){
                throw new RuntimeException("Erro 10:"+erro);
            }
        %>
        
        <a href="inserir.jsp">NOVO</a>
    </body>
</html>
