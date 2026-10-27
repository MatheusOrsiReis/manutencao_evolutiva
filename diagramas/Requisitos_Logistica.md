# Logistica Express

## Requisitos funcionais

| Código | Requisito |
|---|---|
| RF01 | Autenticar funcionário por e-mail e senha. |
| RF02 | Encerrar o acesso após 180 minutos do login. |
| RF03 | Identificar o funcionário na página principal. |
| RF04 | Disponibilizar navegação no topo e logout. |
| RF05 | Cadastrar motorista com nome, CNH, CPF e telefone. |
| RF06 | Listar motoristas em tabela. |
| RF07 | Consultar motorista pelo código em tabela. |
| RF08 | Buscar motoristas pelo nome. |
| RF09 | Atualizar motorista. |
| RF10 | Apagar motorista. |
| RF11 | Cadastrar carga com descrição, peso, volume, rastreio e motorista. |
| RF12 | Listar cargas em tabela. |
| RF13 | Cadastrar entrega com carga, cidade, status, data e hora. |
| RF14 | Atualizar os dados e o status da entrega. |
| RF15 | Listar entregas em tabela com filtro de intervalo e ordenação por data e hora. |
| RF16 | Descriptografar CPF e CNH para consulta e listagem; nunca apresentar senha. |
| RF17 | Cadastrar funcionário com nome, e-mail e senha criptografada. |

## Requisitos não funcionais

| Código | Requisito |
|---|---|
| RNF01 | Usar banco relacional MySQL chamado db_logistica. |
| RNF02 | Manter backend JavaScript, Node.js, Express e Sequelize. |
| RNF03 | Usar HTML, CSS e JavaScript com fetch, mantendo a estrutura da base. |
| RNF04 | Proteger as rotas de dados com autenticação. |
| RNF05 | Armazenar senha, CPF e CNH criptografados com CryptoJS AES. |
| RNF06 | Restringir a implantação à rede interna; o servidor local escuta localhost. |
| RNF07 | Escapar textos recebidos do banco antes de inseri-los nas tabelas HTML. |
| RNF08 | Disponibilizar rotas de teste em teste.http. |

## Regras de negócio

| Código | Regra |
|---|---|
| RN01 | Apenas funcionários previamente cadastrados podem acessar os dados. |
| RN02 | A sessão vence 180 minutos após o login, sem renovação automática. |
| RN03 | O CPF deve conter 11 dígitos, mantendo a validação da base. |
| RN04 | Carga deve estar vinculada a motorista existente. |
| RN05 | O rastreio deve conter somente números. É armazenado como texto para preservar zeros iniciais. |
| RN06 | A carga deve informar descrição, peso em kg e volume em m³. |
| RN07 | Entrega deve estar vinculada a carga existente. |
| RN08 | Os únicos status permitidos são ENTREGUE e TRANSITO. |
| RN09 | Entrega deve conter cidade destino, data e horário válidos. |
| RN10 | Os relacionamentos usam exclusão em cascata, mantendo o comportamento da base. |
| RN11 | O filtro inclui as datas inicial e final; a ordem pode ser crescente ou decrescente. |
| RN12 | O cadastro de funcionário fica disponível na tela de login, no mesmo padrão do cadastro de cliente da base. |

## Infraestrutura

| Item | Tecnologia / versão |
|---|---|
| Banco | MySQL Community Server 8.0.46, db_logistica |
| Linguagem backend | JavaScript, Node.js 22.18.0 |
| Servidor local | Express, versão fixada em package-lock.json, porta 3000 |
| Frontend | HTML5, CSS e JavaScript, aberto com Go Live (Live Server), como na base |
| Dependências | Sequelize, mysql2, cors e crypto-js, mesmas bibliotecas da base |
| Teste da API | teste.http com REST Client do VS Code |
| Navegador disponível | Microsoft Edge 156.0.4314.42 |
| Ambiente | Windows, MySQL local, acesso interno |

## Execução

1. Importar `db_logistica.sql` no MySQL. Ele contém três registros fictícios por tabela, com senha, CPF e CNH criptografados.
2. A conexão está em `backend/db/conn.js`, no formato da base: localhost, porta 3306, usuário root e senha root.
3. Na pasta backend, executar `node index.js`.
4. Abrir `frontend/index.html` com Go Live (Live Server). A API permanece em `http://localhost:3000`. Login: `ana@logistica.local`, senha: `Logistica@123`. Bruno e Carla também possuem essa senha de demonstração.
5. Executar os pedidos de `backend/teste.http` na ordem indicada. O login fornece o token usado nas outras rotas.

`sync.js` sincroniza tabelas sem apagá-las. Os dados iniciais estão no script SQL.

O ambiente já possuía um db_logistica com três registros por tabela e uma coluna `dataHora` em entregas. Esses dados foram preservados. O exercício usa `data` e `hora`, seguindo a base original. Para importar o script onde já existe essa estrutura diferente, guardar um backup e usar um banco limpo. `CREATE TABLE IF NOT EXISTS` não converte colunas antigas; dados criptografados com outra chave exigem conversão com a chave original.

## Teste de integração

`teste.http` contém login, rejeição sem token, CRUD e busca de motorista, cadastro e listagem de carga, cadastro e atualização de entrega e filtro ordenado. Os códigos HTTP esperados estão indicados em cada pedido. Conferir CPF e CNH legíveis nas respostas, identificação do funcionário na página, logout e expiração de 180 minutos.

## Modelagem

`modelo_logico.mmd` e `diagrama_classe.mmd` contêm os diagramas Mermaid deste exercício. As imagens e documentos PixelFix que já existiam na pasta pertencem à atividade anterior.
