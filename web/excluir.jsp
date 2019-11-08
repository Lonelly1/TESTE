
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>CONTROLE DE LIVROS</title>
    </head>
    <body>
        <form action="executa_excluir.jsp" method="post">
            <label>CÓDIGO</label><br>
            <input type="text" name="codigo" value="<%=request.getParameter("codigo")%>"/><br>
            <label>TITULO</label><br>
            <input type="text" name="titulo" value="<%=request.getParameter("titulo")%>"/><br>                   
            <button type="submit">OK</button>
    </body>
</html>
