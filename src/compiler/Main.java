package compiler;

import java.io.FileNotFoundException;
import java.io.Reader;
import java.io.FileInputStream;
import java.io.InputStreamReader;

public class Main {
	public static void main(String[] args) throws Exception{
		try {
			Reader reader = new InputStreamReader(new FileInputStream("programs/sin_01.txt"));
		    Parser p = new Parser(new Scanner(reader));
		    p.parse();
		    
		    if(p.error_count > 0){
		    	System.out.println("Foram encontrados "+ p.error_count +" durante a execução do compilador. Verifique as mensagens.");
		    	System.exit(0);
		    }
		} catch (FileNotFoundException e) {
			System.out.println("Erro na leitura do arquivo.");
			System.exit(0);
		} catch (Exception e) {
	        System.out.println("Erro durante a execução do compilador. Verifique as mensagens.");
	        System.exit(0);
		}
		
		System.out.println("Nenhum erro foi encontrado durante a checagem.");
	}
}
