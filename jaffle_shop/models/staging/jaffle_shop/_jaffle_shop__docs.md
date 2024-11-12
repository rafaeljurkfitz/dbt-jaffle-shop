# Models

## Staging

### Requisitos para o modelo `stg_jaffle_shop__customers`

O modelo `stg_jaffle_shop__customers` na pasta base, é responsável por transformar os dados brutos de clientes para um formato preparado para análises adicionais. Aqui estão os requisitos detalhados para cada parte do modelo.

#### Renomeação de Colunas

- __Colunas Renomeadas__:

  - `id` para `customer_id`;
  - `name` para `customer_name`.

- __Motivação__: Renomear colunas para nomes mais descritivos e consistentes com a convenção de nomenclatura do projeto.

### Requisitos para o Modelo `stg_locations`

O modelo `stg_locations` é responsável por transformar os dados brutos de locais (lojas) para um formato preparado para análises adicionais. Aqui estão os requisitos detalhados para cada parte do modelo.

1. **Renomeação de Colunas**
   - **Colunas Renomeadas**:
     - `id` para `location_id`
     - `name` para `location_name`
   - **Motivação**: Renomear colunas para nomes mais descritivos e consistentes com a convenção de nomenclatura do projeto.

2. **Manutenção de Colunas Numéricas**
   - **Colunas Mantidas**:
     - `tax_rate`
   - **Motivação**: Manter a coluna `tax_rate` para análises financeiras e fiscais.

3. **Truncagem de Datas**
   - **Coluna Usada**: `opened_at`
   - **Requisito**: Truncar a data e hora de `opened_at` para o nível de precisão de dias.
   - **Motivação**: Facilitar a agregação e análise de dados temporais em uma granularidade diária.

### Requisitos para o Modelo `stg_order_items`

O modelo `stg_order_items` é responsável por transformar os dados brutos de itens de pedidos para um formato preparado para análises adicionais. Aqui estão os requisitos detalhados para cada parte do modelo.

1. **Renomeação de Colunas**
   - **Colunas Renomeadas**:
     - `id` para `order_item_id`
     - `sku` para `product_id`
   - **Motivação**: Renomear colunas para nomes mais descritivos e consistentes com a convenção de nomenclatura do projeto.

2. **Manutenção de Colunas Essenciais**
   - **Colunas Mantidas**:
     - `order_id`
   - **Motivação**: Manter a coluna `order_id` para assegurar a referência entre itens de pedidos e pedidos.

### Requisitos para o Modelo `stg_orders`

O modelo `stg_orders` é responsável por transformar os dados brutos de pedidos para um formato preparado para análises adicionais. Aqui estão os requisitos detalhados para cada parte do modelo.

1. **Renomeação de Colunas**
   - **Colunas Renomeadas**:
     - `id` para `order_id`
     - `store_id` para `location_id`
     - `customer` para `customer_id`
   - **Motivação**: Renomear colunas para nomes mais descritivos e consistentes com a convenção de nomenclatura do projeto.

2. **Conversão de Centavos para Dólares**
   - **Colunas Usadas**: `subtotal`, `tax_paid`, `order_total`
   - **Requisito**: Converter os valores de `subtotal`, `tax_paid` e `order_total` de centavos para dólares, arredondando para duas casas decimais.
   - **Motivação**: Facilitar a análise financeira e garantir que os valores monetários estejam em um formato padrão de dólares.

3. **Truncagem de Datas**
   - **Coluna Usada**: `ordered_at`
   - **Requisito**: Truncar a data e hora de `ordered_at` para o nível de precisão de dias.
   - **Motivação**: Facilitar a agregação e análise de dados temporais em uma granularidade diária.

### Requisitos para o Modelo `stg_products`

O modelo `stg_products` é responsável por transformar os dados brutos de produtos para um formato preparado para análises adicionais. Aqui estão os requisitos detalhados para cada parte do modelo.

1. **Renomeação de Colunas**
   - **Colunas Renomeadas**:
     - `sku` para `product_id`
     - `name` para `product_name`
     - `type` para `product_type`
     - `description` para `product_description`
   - **Motivação**: Renomear colunas para nomes mais descritivos e consistentes com a convenção de nomenclatura do projeto.

2. **Conversão de Centavos para Dólares**
   - **Coluna Usada**: `price`
   - **Requisito**: Converter o valor do preço de centavos para dólares, arredondando para duas casas decimais.
   - **Motivação**: Facilitar a análise financeira e garantir que os valores monetários estejam em um formato padrão de dólares.

3. **Classificação de Itens por Tipo**
   - **Coluna Usada**: `type`
   - **Requisito**:
     - Determinar se o produto é um item alimentício (`is_food_item`) se o tipo for `jaffle`.
     - Determinar se o produto é uma bebida (`is_drink_item`) se o tipo for `beverage`.
   - **Motivação**: Classificar os produtos de acordo com seu tipo para facilitar análises e relatórios baseados em categorias de produtos.

### Requisitos para o Modelo `stg_supplies`

#### 1. Geração de UUID para Suprimentos

- **Colunas Usadas**: `id` e `sku`
- **Descrição**: Concatenar as colunas `id` e `sku` para criar um identificador único (`supply_uuid`) para cada suprimento.
- **Motivação**: A criação de um identificador único ajuda a garantir a unicidade de registros e facilita a identificação de suprimentos em análises subsequentes.

#### 2. Renomeação de Colunas

- **Colunas Renomeadas**:
  - `id` para `supply_id`
  - `sku` para `product_id`
  - `name` para `supply_name`
- **Motivação**: Renomear colunas para nomes mais descritivos e consistentes com a convenção de nomenclatura do projeto.

#### 3. Conversão de Centavos para Dólares

- **Coluna Usada**: `cost`
- **Descrição**: Converter o valor do custo de centavos para dólares, arredondando para duas casas decimais.
- **Motivação**: Facilitar a análise financeira e garantir que os valores monetários estejam em um formato padrão de dólares.

#### 4. Classificação de Itens Perecíveis

- **Coluna Usada**: `perishable`
- **Descrição**: Determinar se o suprimento é perecível e armazenar essa informação como um valor booleano (`is_perishable_supply`).
- **Motivação**: Identificar itens perecíveis é importante para o gerenciamento de estoque e análises de logística.
