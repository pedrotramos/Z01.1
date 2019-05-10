/**
 * Curso: Elementos de Sistemas
 * Arquivo: Parser.java
 */

package assembler;

import com.sun.org.apache.xpath.internal.operations.Bool;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.PatternSyntaxException;

/**
 * Encapsula o código de leitura. Carrega as instruções na linguagem assembly,
 * analisa, e oferece acesso as partes da instrução  (campos e símbolos).
 * Além disso, remove todos os espaços em branco e comentários.
 */
public class Parser {

    public String currentCommand = "";  // comando atual
    public String inputFile;		    // arquivo de leitura
    public int lineNumber = 0;			// linha atual do arquivo (nao do codigo gerado)
    public String currentLine;			// linha de codigo atual
    private BufferedReader fileReader;  // leitor de arquivo


    /** Enumerator para os tipos de comandos do Assembler. */
    public enum CommandType {
        A_COMMAND,      // comandos LEA, que armazenam no registrador A
        C_COMMAND,      // comandos de calculos
        L_COMMAND       // comandos de Label (símbolos)
    }

    /**
     * Abre o arquivo de entrada NASM e se prepara para analisá-lo.
     * @param file arquivo NASM que será feito o parser.
     */
    public Parser(String file) throws FileNotFoundException {
        this.lineNumber = 0;
        this.inputFile = file;
        this.fileReader = new BufferedReader(new FileReader(file));
    }

    /**
     * Carrega uma instrução e avança seu apontador interno para o próxima
     * linha do arquivo de entrada. Caso não haja mais linhas no arquivo de
     * entrada o método retorna "Falso", senão retorna "Verdadeiro".
     * @return Verdadeiro se ainda há instruções, Falso se as instruções terminaram.
     */
    public Boolean advance() {
        Boolean proximo;
        try {
            currentLine = fileReader.readLine();
            if (currentLine != null) {
                proximo = true;
            }
            else {
                proximo = false;
            }
            while (proximo) {
                if (currentLine.length() == 0 || currentLine.charAt(0) == ';') {
                    currentLine = fileReader.readLine();
                    if (currentLine != null) {
                        proximo = true;
                    }
                    else {
                        proximo = false;
                        return null;
                    }
                }
                else {
                    return proximo;
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
        return proximo;
    }

    /**
     * Retorna o comando "intrução" atual (sem o avanço)
     * @return a instrução atual para ser analilisada
     */
    public String command() {
        currentCommand = currentLine;
        int contador = 0;
        for (char letra: currentLine.toCharArray()) {
            if (letra == ';') {
                currentCommand = currentCommand.substring(0, currentCommand.indexOf(letra));
                for (char letter: currentCommand.toCharArray()) {
                    if (letter == ' ') {
                        contador += 1;
                    }
                }
                for (int i = 0; i < contador - 1; i++) {
                    currentCommand = currentCommand.substring(0, currentCommand.lastIndexOf(' '));
                }
            }
        }
        return currentCommand;
    }

    /**
     * Retorna o tipo da instrução passada no argumento:
     *  A_COMMAND para leaw, por exemplo leaw $1,%A
     *  L_COMMAND para labels, por exemplo Xyz: , onde Xyz é um símbolo.
     *  C_COMMAND para todos os outros comandos
     * @param  command instrução a ser analisada.
     * @return o tipo da instrução.
     */
    public CommandType commandType(String command) {
        if (command.substring(0,1).equals("l")) {
            return CommandType.A_COMMAND;
        } else if (command.substring(command.length()-1).equals(":")) {
            return CommandType.L_COMMAND;
        } else {
            return CommandType.C_COMMAND;
        }
    }

    /**
     * Retorna o símbolo ou valor numérico da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é A_COMMAND.
     * @param  command instrução a ser analisada.
     * @return somente o símbolo ou o valor número da instrução.
     */
    public String symbol(String command) {
        int start = command.indexOf("$");
        int finish = command.indexOf(",");
        String symbol = command.substring(start+1, finish);

        if (commandType(command).equals(CommandType.A_COMMAND)) {
            return symbol;
        } else {
            return "";
        }
    }

    /**
     * Retorna o símbolo da instrução passada no argumento.
     * Deve ser chamado somente quando commandType() é L_COMMAND.
     * @param  command instrução a ser analisada.
     * @return o símbolo da instrução (sem os dois pontos).
     */
    public String label(String command) {
        if (commandType(command).equals(CommandType.L_COMMAND)) {
            return command.substring(0, command.indexOf(":"));
        } else {
            return "";
        }
    }

    /**
     * Separa os mnemônicos da instrução fornecida em tokens em um vetor de Strings.
     * Deve ser chamado somente quando CommandType () é C_COMMAND.
     * @param  command instrução a ser analisada.
     * @return um vetor de string contento os tokens da instrução (as partes do comando).
     */
    public String[] instruction(String command) {
        String replace = command.replace(",", " ");
        String[] split = replace.split(" ");
        if (!commandType(command).equals(CommandType.L_COMMAND)) {
            return split;
        } else {
            return new String[1];
        }
    }

    // fecha o arquivo de leitura
    public void close() throws IOException {
        fileReader.close();
    }


}
