# Teste de Temperamento com Ruby on Rails


Esta é uma aplicação web completa, desenvolvida com Ruby on Rails, que permite aos usuários descobrir seu temperamento dominante com base nos quatro temperamentos clássicos da psicologia (Colérico, Sanguíneo, Melancólico e Fleumático). 

O teste foi projetado para ser preciso e interativo, utilizando um sistema de pontuação por intensidade e apresentando os resultados de forma clara e visualmente atraente. Este projeto foi construído como um exercício prático completo, cobrindo desde a configuração inicial do Rails até o design responsivo e funcionalidades interativas com JavaScript.

## ✨ Funcionalidades Principais

* **Questionário de Intensidade:** Um teste com 40 afirmações onde o usuário responde com "Pouco", "Médio" ou "Muito".
* **Barra de Progresso:** Uma barra de progresso visual e um contador (ex: "Questão 5 de 40") que acompanham o avanço do usuário no teste.
* **Botão de Exemplo:** Cada pergunta possui um botão de exemplo para contextualizar a afirmação e ajudar o usuário a dar respostas mais precisas.
* **Página de Resultados Inteligente:** Exibe o temperamento dominante com uma cor e ícone específicos, uma descrição detalhada e a pontuação completa de todos os temperamentos.
* **Sistema de Reset:** Permite que o usuário reinicie o teste a qualquer momento, limpando a pontuação anterior para uma nova avaliação.
* **Design Moderno e Responsivo:** Interface com estilo profissional, utilizando gradientes, sombras, fontes customizadas e um layout que se adapta perfeitamente a desktops e dispositivos móveis.

## 🛠️ Tecnologias Utilizadas

* **Back-end:** Ruby on Rails
* **Front-end:** HTML, CSS (com Flexbox e Grid), JavaScript (Vanilla)
* **Banco de Dados:** PostgreSQL (para produção) e SQLite3 (para desenvolvimento)
* **Frameworks/Bibliotecas:** Font Awesome (para ícones)

## 🚀 Como Executar o Projeto Localmente

Siga os passos abaixo para ter uma cópia do projeto rodando na sua máquina.

### Pré-requisitos

* **Ruby** (versão 3.4.2 ou similar)
* **Bundler** (`gem install bundler`)
* **Node.js** e **Yarn**
* **PostgreSQL** instalado e rodando.

### Instalação

1.  **Clone o repositório:**
    ```bash
    git clone https://github.com/ayslanhugo/temperamentos.git
    ```

2.  **Navegue até a pasta do projeto:**
    ```bash
    cd temperamentos
    ```

3.  **Instale as dependências (gems):**
    ```bash
    bundle install
    ```

4.  **Crie e configure o banco de dados:**
    ```bash
    rails db:create
    rails db:migrate
    ```

5.  **Popule o banco de dados com as perguntas do teste:**
    ```bash
    rails db:seed
    ```

6.  **Inicie o servidor Rails:**
    ```bash
    rails server
    ```

7.  Abra seu navegador e acesse `http://localhost:3000`. Pronto!

## 🧑‍💻 Autor

Desenvolvido por **Ayslan Hugo**.

---