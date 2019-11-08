                                                 //Classe de regras do Banco de Dados
package dao;

import model.Livro;
import java.sql.Connection;
import java.sql.PreparedStatement;
//aula II
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.Statement;

public class LivroDAO {
    
    private Connection conn;
    private PreparedStatement stmt;
    private Statement st;
    private ResultSet rs;
    private ArrayList<Livro> lista = new ArrayList<>();
    
    
    public LivroDAO(){
        conn = new Conexao().getConexao();
    }
    
    //metodo de inserir dados
    public void inserir(Livro livro){
        String sql ="INSERT INTO tb_livros(titulo_livro, genero_livro, editora_livro) VALUES (?,?,?)";
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, livro.getTitulo_livro());
            stmt.setString(2, livro.getGenero_livro());
            stmt.setString(3, livro.getEditora_livro());
            stmt.execute();
            stmt.close();
        }catch(Exception erro){
            throw new RuntimeException("ERRO 2:"+erro);
                    
        }
              
    }
        
    //metodos de pesquisar tudo
    public ArrayList<Livro> ListarTodos(){
        String sql = "SELECT * FROM tb_livros";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Livro livro = new Livro();
                livro.setId_livro(rs.getInt("Id_livro"));
                livro.setTitulo_livro(rs.getString("Titulo_livro"));
                livro.setGenero_livro(rs.getString("Genero_livro"));
                livro.setEditora_livro(rs.getString("Editora_livro"));
                lista.add(livro);
            }
            
        }catch(Exception erro){
            throw new RuntimeException("Erro 4: "+erro);
        }
        return lista;
    } 
    
    //metodos de pesquisar nome
    public ArrayList<Livro> ListarTodosNome(String valor){
        String sql = "SELECT * FROM tb_livros WHERE Nome_livro LIKE '%"+valor+"%'";
        try{
            st = conn.createStatement();
            rs = st.executeQuery(sql);
            while(rs.next()){
                Livro livro = new Livro();
                livro.setId_livro(rs.getInt("Id_livro"));
                livro.setTitulo_livro(rs.getString("titulo_livro"));
                livro.setGenero_livro(rs.getString("genero_livro"));
                livro.setEditora_livro(rs.getString("editora_livro"));
                lista.add(livro);
            }
            
        }catch(Exception erro){
            throw new RuntimeException("Erro 5: "+erro);
        }
        return lista;
    }
    
    //metodo de atualização
    public void atualizar(Livro livro){
        String sql = "UPDATE tb_livros SET titulo_livro = ?,genero_livro = ?, editora_livro = ? WHERE Id_livro = ? ";
        try{
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, livro.getTitulo_livro());
            stmt.setString(2, livro.getGenero_livro());
            stmt.setString(3, livro.getEditora_livro());
            stmt.setInt(4, livro.getId_livro());
            stmt.execute();
            stmt.close();            
        }catch(Exception erro){
            throw new RuntimeException("Erro 7: "+erro);
        }          
    }
    
    //metodo excluir
    public void excluir(int valor){
        String sql = "DELETE FROM tb_livros WHERE Id_livro = "+valor;
        try{
            st = conn.createStatement();
            st.execute(sql);
            st.close();
        }catch(Exception erro){
            throw new RuntimeException("Erro 8:"+erro);
        }
        
        
        
        
        
        
    }
}
