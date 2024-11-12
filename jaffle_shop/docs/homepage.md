{% docs __overview__ %}

# Bem-vindo à Documentação do Projeto Jaffle_shop

## Navegação

Utilize as abas de navegação do __Projeto__ e do __Banco de Dados__ no lado esquerdo para explorar os modelos no seu projeto.

### Aba de Projeto

A aba __Projeto__ reflete a estrutura de diretórios do seu projeto dbt. Nesta aba, você pode ver todos os modelos definidos no seu projeto dbt, bem como os modelos importados de pacotes dbt.

### Aba de Banco de Dados

A aba __Banco de Dados__ também exibe seus modelos, mas em um formato semelhante a um explorador de banco de dados. Esta visão mostra relações (tabelas e visualizações) agrupadas em esquemas de banco de dados. Note que os modelos efêmeros não são mostrados nesta interface, pois eles não existem no banco de dados.

## Exploração de Grafos

Clique no ícone azul no canto inferior direito para visualizar o grafo de linhagem dos seus modelos.

Nas páginas de modelos, você verá os pais e filhos imediatos do modelo que está explorando. Ao clicar no botão __Expandir__ no canto superior direito deste painel de linhagem, você poderá ver todos os modelos que são usados para construir, ou que são construídos a partir, do modelo que está explorando.

Uma vez expandido, você poderá usar a sintaxe ``--select`` e ``--exclude`` para filtrar os modelos no grafo. Para mais informações sobre seleção de modelos, consulte a [documentação do dbt](<https://docs.getdbt.com/docs/model-selection-syntax>).

Observe que você também pode clicar com o botão direito nos modelos para filtrar e explorar o grafo de forma interativa.

## Mais Informações

- Essa é a minha homepage para o meu projeto Dbt. Link para repositório [Github](<https://github.com/rafaeljurkfitz/dbt-jaffle-shop>)

- [O que é dbt](<https://docs.getdbt.com/docs/introduction>)?

- Leia o [dbt viewpoint](<https://docs.getdbt.com/docs/viewpoint>)

- [Instalação](<https://docs.getdbt.com/docs/installation>)

- Junte-se à [Comunidade do dbt](<https://www.getdbt.com/community/>) para perguntas e discussões.

{% enddocs %}
