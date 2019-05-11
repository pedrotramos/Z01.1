/**
 * Curso: Elementos de Sistemas
 * Arquivo: Assemble.java
 * Created by Luciano <lpsoares@insper.edu.br>
 * Date: 04/02/2017
 * <p>
 * 2018 @ Rafael Corsi
 */

package assembler;

import java.io.*;

/**
 * Faz a geração do código gerenciando os demais módulos
 */
public class Assemble {
    File hackFile = null;                  // arquivo de saída hack
    boolean debug;                         // flag que especifica se mensagens de debug são impressas
    private String inputFile;              // arquivo de entrada nasm
    private PrintWriter outHACK = null;    // grava saida do código de máquina em Hack
    private SymbolTable table;             // tabela de símbolos (variáveis e marcadores)

    /**
     * Retorna o código binário do mnemônico para realizar uma operação de cálculo.
     *
     * @param mnemonic vetor de mnemônicos "instrução" a ser analisada.
     * @return Opcode (String de 7 bits) com código em linguagem de máquina para a instrução.
     */
    public Assemble(String inFile, String outFileHack, boolean debug) throws IOException {
        this.debug = debug;
        inputFile = inFile;
        hackFile = new File(outFileHack);                      // Cria arquivo de saída .hack
        outHACK = new PrintWriter(new FileWriter(hackFile));  // Cria saída do print para
        // o arquivo hackfile
        table = new SymbolTable();                          // Cria e inicializa a tabela de simbolos
    }

    /**
     * primeiro passo para a construção da tabela de símbolos de marcadores (labels)
     * varre o código em busca de Símbolos novos Labels e Endereços de memórias
     * e atualiza a tabela de símbolos com os endereços.
     * <p>
     * Dependencia : Parser, SymbolTable
     */
    public SymbolTable fillSymbolTable() throws FileNotFoundException, IOException {
        //Verifica Labels comuns (com ":")
        Parser parser = new Parser(inputFile);
        int current_line = 0;

        while (parser.advance()) {
            if (parser.commandType(parser.command()).equals(Parser.CommandType.L_COMMAND)) {
                String new_label = parser.label(parser.command());
                table.addEntry(new_label, current_line);
            } else {
                current_line++;
            }
        }

        //Verifica labels no meio de leaws
        Parser parser2 = new Parser(inputFile);
        int label_number = 16;

        while (parser2.advance()) {
            if (parser2.commandType(parser2.command()).equals(Parser.CommandType.A_COMMAND)) {
                String symbol = parser2.symbol(parser2.command());
                boolean numeric = true;
                try {
                    Double num = Double.parseDouble(symbol);
                } catch (NumberFormatException e) {
                    numeric = false;
                }
                if (!numeric) {
                    if (!table.contains(symbol)) {
                        table.addEntry(symbol, label_number);
                        label_number++;
                    }
                }
            }
        }

        return table;
    }

    /**
     * Segundo passo para a geração do código de máquina
     * Varre o código em busca de instruções do tipo A, C
     * gerando a linguagem de máquina a partir do parse das instruções.
     * <p>
     * Dependencias : Parser, Code
     */
    public void generateMachineCode() throws FileNotFoundException, IOException {
        Parser parser = new Parser(inputFile);  // abre o arquivo e aponta para o começo
        String instruction = null;
        String bit_17_16;
        String dest, comp, jump, symbol, binary;
        /**
         * Aqui devemos varrer o código nasm linha a linha
         * e gerar a string 'instruction' para cada linha
         * de instrução válida do nasm
         */
        while (parser.advance()) {
            String[] command = parser.instruction(parser.command());
            switch (parser.commandType(parser.command())) {
                case C_COMMAND:
                    bit_17_16 = "10";
                    dest = Code.dest(command);
                    comp = Code.comp(command);
                    jump = Code.jump(command);
                    instruction = bit_17_16 + comp + dest + jump;
                    break;
                case A_COMMAND:
                    bit_17_16 = "00";
                    symbol = parser.symbol(parser.command());
                    if (table.contains(symbol)) {
                        int symbol_value = table.getAddress(symbol);
                        binary = Code.toBinary(Integer.toString(symbol_value));
                    } else {
                        binary = Code.toBinary(symbol);
                    }
                    instruction = bit_17_16 + binary;
                    break;
                default:
                    continue;
            }
            // Escreve no arquivo .hack a instrução
            if (outHACK != null) {
                outHACK.println(instruction);
            }
        }

    }

    /**
     * Fecha arquivo de escrita
     */
    public void close() throws IOException {
        if (outHACK != null) {
            outHACK.close();
        }
    }

    /**
     * Remove o arquivo de .hack se algum erro for encontrado
     */
    public void delete() {
        try {
            if (hackFile != null) {
                hackFile.delete();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
