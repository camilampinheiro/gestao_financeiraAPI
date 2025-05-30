# GestaoFinanceira

To start your Phoenix server:

* Run `mix setup` to install and setup dependencies
* Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

* Official website: https://www.phoenixframework.org/
* Guides: https://hexdocs.pm/phoenix/overview.html
* Docs: https://hexdocs.pm/phoenix
* Forum: https://elixirforum.com/c/phoenix-forum
* Source: https://github.com/phoenixframework/phoenix

## Integrantes da Equipe

* Camila Martins - 2310286
* Ricardo Temporal -
* Luiz Eduardo -

## Funcionalidades Desenvolvidas

### Autenticação com JSON Web Token (JWT)
- Implementação do Guardian para autenticação segura.
- Login com e-mail e senha e geração de token JWT.
- Proteção de rotas autenticadas utilizando token no header (`Authorization: Bearer <token>`).

### Gestão de Usuários (User)
- Cadastro de usuário com criptografia de senha (Bcrypt).
- Login e autenticação de credenciais.
- Listagem de todos os usuários.
- Visualização de um usuário por ID.
- Atualização e exclusão de usuários.
- Controle de acesso por usuário.

### Gestão de Transações (Transaction)
- Criação de transações financeiras vinculadas automaticamente ao usuário autenticado.
- Listagem de todas as transações do usuário autenticado.
- Visualização, atualização e exclusão de uma transação específica (com verificação de proprietário).
- Registro automático da data e hora da criação da transação.

### Gestão de Tags (Categorias)
- Criação de tags/categorias financeiras.
- Listagem de todas as tags existentes.
- Atualização e remoção de tags.
- Associação opcional de tags às transações.

### Recursos Técnicos Adicionais
- API RESTful desenvolvida com Phoenix Framework.
- Utilização de contextos organizados: `Accounts`, `Finance` e `Guardian`.
- Respostas JSON organizadas com `Jason.Encoder`.
- Utilização de `FallbackController` para tratamento consistente de erros.
- Relacionamentos entre entidades com Ecto (`belongs_to`, `has_many`).

  
