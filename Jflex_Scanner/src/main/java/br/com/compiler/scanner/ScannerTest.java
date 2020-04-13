package br.com.compiler.scanner;

import java.io.IOException;
import java.io.StringReader;

public class ScannerTest {
	public static void main(String[] args) throws IOException {
		String expr = "-(8+12)**1*3/-4";
		LexicalAnalyzerExample lexical = new LexicalAnalyzerExample(new StringReader(expr));
		lexical.yylex();
	}
}