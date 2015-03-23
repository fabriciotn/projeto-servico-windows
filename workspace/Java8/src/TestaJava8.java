import java.util.ArrayList;
import java.util.List;

public class TestaJava8 {

	public static void main(String[] args) {
		List<String> palavras = new ArrayList<>();
		palavras.add("alura online");
		palavras.add("casa do código");
		palavras.add("caelum");

		palavras.sort((String str1, String str2) -> Integer.compare(str1.length(), str2.length()));
		palavras.sort((String str1, String str2) -> Integer.compare(str1.length(), str2.length()));

		palavras.forEach(t -> System.out.println(t));

		new Thread(() -> System.out.println("Executando um Runnable")).start();

	}
}