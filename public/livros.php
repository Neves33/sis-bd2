<!DOCTYPE html>

<head>
    <style>
        .content {
            max-width: 500px;
            margin: auto;
        }
    </style>
</head>

<html>

<body>
    <div class="content">
        <h1>Bibliófilo's</h1>

        <h2>Livros</h2>
        <?php
        require 'mysql_server.php';

        $conexao = RetornaConexao();

        /*TODO-1: Adicione uma variavel para cada coluna */
        $nome = 'nome';
        $data_primeira_publicacao = 'data_primeira_publicacao';
        $categoria = 'categoria';
        $classificacao = 'classificacao';
        $autor = 'autor';


        $sql =
             /*TODO-2: Adicione cada variavel a consulta abaixo */
            'SELECT ' . $nome .
            '     , ' . $data_primeira_publicacao .
            '     , ' . $categoria .
            '     , ' . $classificacao .
            '     , ' . $autor .
            '  FROM livros';


        $resultado = mysqli_query($conexao, $sql);
        if (!$resultado) {
            echo mysqli_error($conexao);
        }



        $cabecalho =
            '<table>' .
            '    <tr>' .
            /* TODO-3: Adicione as variaveis ao cabeçalho da tabela */
            '        <th>' . $nome . '</th>' .
            '        <th>' . $data_primeira_publicacao . '</th>' .
            '        <th>' . $categoria . '</th>' .
            '        <th>' . $classificacao . '</th>' .
            '        <th>' . $autor . '</th>' .

            '    </tr>';

        echo $cabecalho;

        if (mysqli_num_rows($resultado) > 0) {

            while ($registro = mysqli_fetch_assoc($resultado)) {
                echo '<tr>';

                /* TODO-4: Adicione a tabela os novos registros. */
                echo '<td>' . $registro[$nome] . '</td>' .
                    '<td>' . $registro[$data_primeira_publicacao] . '</td>' .
                    '<td>' . $registro[$categoria] . '</td>'.
                    '<td>' . $registro[$classificacao] . '</td>'.
                    '<td>' . $registro[$autor] . '</td>';

                echo '</tr>';
            }
            echo '</table>';
        } else {
            echo '';
        }
        FecharConexao($conexao);
        ?>
    </div>
</body>

</html>