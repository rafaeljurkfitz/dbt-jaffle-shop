# 🥪 The Jaffle Shop 🦘

`jaffle_shop` é uma loja fictícia de ecommerce. Este projeto dbt transforma dados brutos de um banco de dados de aplicativo em um modelo de __clientes__ e __pedidos__ pronto para análise de dados.

> [!TIP]
> __O que é um jaffle?__
> Jaffles são sanduíches tostados com as bordas crimpadas e seladas. Inventado em Bondi, em 1949, é um clássico australiano. São feitos em uma máquina específica, com sulcos que criam um padrão no pão, e uma prensa que sela as bordas e corta o sanduíche ao meio. Os jaffles podem ser recheados com uma variedade de opções doces ou salgadas, como: Ham, Atum, Feijão cozido, Tomate, Bolognaise, Queijo.

## 📜 Sumário

- [🥪 The Jaffle Shop 🦘](#-the-jaffle-shop-)
  - [📜 Sumário](#-sumário)
  - [💾 Pré-requisitos](#-pré-requisitos)
  - [🏁 Checkpoint](#-checkpoint)
  - [🛠️ Comandos Úteis do DBT](#️-comandos-úteis-do-dbt)
  - [📊 Carregando os dados](#-carregando-os-dados)
  - [🚀 Deploy](#-deploy)
  - [🔍 Pre-commit and SQLFluff](#-pre-commit-and-sqlfluff)
    - [🔍 Ferramentas de Verificação](#-ferramentas-de-verificação)
    - [🔍 SQLFluff - Linter e Formatador de SQL](#-sqlfluff---linter-e-formatador-de-sql)

## 💾 Pré-requisitos

- __Pyenv__ - Gerenciador de versões do Python.

- __Poetry__ - Gerenciador de dependências para Python.

- __Docker__ - Para ambiente de contêineres.

- __Postgres__ - Banco de dados usado como `datawarehouse` no projeto.

## 🏁 Checkpoint

1. Clonar o repositorio:

    ```bash
        git clone https://github.com/rafaeljurkfitz/dbt-jaffle-shop.git
    ```

2. Instalar o `Python 3.12.0` no Pyenv:

    ```bash
        pyenv install 3.12.0
        pyenv local use 3.12.0
    ```

3. Inicie o ambiente virtual com Poetry:

    ```bash
        poetry shell
    ```

4. Instale as dependências do projeto:

    ```bash
        poetry install
    ```

5. Construa o contêiner do PostgreSQL com Docker:

    ```bash
        docker-compose up -d
    ```

6. Navegue para a pasta do projeto dbt:

    ```bash
        cd ./jaffle_shop
    ```

## 🛠️ Comandos Úteis do DBT

Aqui estão alguns dos comandos mais comuns para usar com o dbt durante o desenvolvimento e a manutenção do projeto:

- __Compilar e executar todos os modelos:__

```bash
dbt run
```

- __Compilar e executar apenas os modelos que foram alterados desde a última execução:__

```bash
    dbt run --models <model_name>
```

- __Executar todos os testes de dados:__

```bash
    dbt test
```

- __Compilar o projeto e atualizar o estado dos modelos:__

```bash
    dbt build
```

- __Atualizar a documentação do projeto:__

```bash
dbt docs generate
```

- __Iniciar o servidor da documentação para visualização no navegador:__

```bash
    dbt docs serve
```

- __Carregar os dados de teste (seeds):__

```bash
dbt seed
```

Esses comandos permitem desenvolver, testar e documentar o projeto de forma eficaz.

## 📊 Carregando os dados

1. Abra o arquivo `dbt_project.yml` na pasta `jaffle_shop`.

2. Edite o arquivo `dbt_project.yml`.

   ```yml
    seeds:
        jaffle_shop:
            +schema: raw
            +enabled: true #<-------troque o false pelo true
   ```

    __Isso permitirá carregar o data warehouse com os dados de teste contidos nos arquivos CSV.__

3. Carregue os dados executando o comando:

    ```bash
    dbt seed
    ```

4. Após o carregamento, edite novamente o arquivo dbt_project.yml para reverter a configuração ao formato original, garantindo que os arquivos CSV não apareçam no Grafo de lineage da documentação do projeto.

## 🚀 Deploy

__Configure o Ambiente: Certifique-se de que o ambiente de produção está configurado corretamente e conectado ao seu data warehouse.__

- __Execute o Projeto dbt__: No ambiente de produção, execute o comando abaixo para construir todos os modelos e aplicar as transformações de dados:

```bash
    dbt build
```

- __Gerar e Publicar a Documentação (opcional)__: Gere a documentação do projeto e visualize-a, o que é útil para equipes e stakeholders acompanharem o grafo de lineage e outras informações sobre os modelos:

```bash
    dbt docs generate
    dbt docs serve
```

- Automatize o Deploy (opcional): Para automatizar o processo de deploy, você pode configurar uma pipeline CI/CD que execute o comando dbt build e gere a documentação a cada atualização. Essa prática garante que o ambiente de produção esteja sempre atualizado com as últimas mudanças.

Esses passos garantirão que seu projeto dbt esteja corretamente implantado e atualizado no ambiente de produção, mantendo os dados prontos para análise.

## 🔍 Pre-commit and SQLFluff

Há uma ferramenta opcional chamada `pre-commit` incluída neste projeto, que automaticamente executa processos de formatação e verificação ao fazer um commit.

O [pre-commit](https://pre-commit.com/) executa automaticamente uma série de processos no seu código, como linters e formatadores, quando você realiza um commit. Se ele encontrar algum problema e atualizar um arquivo, será necessário fazer o stage das alterações e realizar o commit novamente (o primeiro commit não terá sido concluído porque o `pre-commit` encontrou e corrigiu um problema). Com isso, o seu código se torna mais consistente automaticamente, e as mudanças de todos passarão pelos mesmos processos. É uma boa prática o uso do `pre-commit` em qualquer projeto.

> Veja as configurações de `pre-commit` no arquivo `.pre-commit-config.yaml`. Para ativá-lo, use:
>
> ```bash
>   pre-commit install
> ```

Pode-se também executar as verificações manualmente com ```pre-commit run --all-files``` para ver o que ele faz sem realizar um commit.

### 🔍 Ferramentas de Verificação

- `ruff` - Linter e formatador rápido para Python (para quando houver modelos em Python).

- `check-yaml` - Validação dos arquivos YAML.

- `end-of-file-fixer` - Adiciona uma nova linha ao final de cada arquivo.

- `trailing-whitespace` - Remove espaços em branco ao final das linhas.

### 🔍 SQLFluff - Linter e Formatador de SQL

- __SQLFluff__ é uma ferramenta de linting e formatação de SQL que ajuda a manter o código SQL consistente e padronizado. Suas principais funcionalidades incluem:

- __Linting__: Verifica o SQL em busca de erros de sintaxe, inconsistências e outras práticas problemáticas.

- __Formatação__: Ajusta automaticamente o estilo do código para seguir um padrão configurável.

- __Configuração Personalizável__: Permite personalizar regras de acordo com as necessidades do projeto.

- __Compatibilidade com dbt__: Integra-se ao dbt, permitindo verificar arquivos .sql que contêm macros e Jinja.

Para rodar o SQLFluff, você pode usar:

```bash
    sqlfluff lint path/to/file.sql    # Verifica o SQL
    sqlfluff fix path/to/file.sql     # Corrige automaticamente o SQL
```

SQLFluff facilita o gerenciamento e a padronização de código SQL em equipes, especialmente útil em projetos com dbt.
