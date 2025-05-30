defmodule GestaoFinanceira.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias GestaoFinanceira.Repo
  alias GestaoFinanceira.Accounts.User

  @doc """
  Lista todos os usuários.
  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Retorna um usuário pelo ID.
  Levanta erro se não existir.
  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Retorna um usuário pelo e-mail.
  """
  def get_user_by_email(email) do
    Repo.get_by(User, email: email)
  end

  @doc """
  Cria um usuário com senha criptografada.
  Espera que a `attrs` tenha o campo `password`.
  """
  def create_user(attrs) do
    attrs = Map.put(attrs, "password_hash", Bcrypt.hash_pwd_salt(attrs["password"] || ""))

    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Atualiza dados de um usuário.
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Exclui um usuário.
  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Retorna um changeset para um usuário.
  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end

  @doc """
  Autentica um usuário pelo e-mail e senha.
  Retorna {:ok, user} se válido, {:error, :unauthorized} caso contrário.
  """
  def authenticate_user(email, plain_text_password) do
    case get_user_by_email(email) do
      nil ->
        {:error, :unauthorized}

      user ->
        if Bcrypt.verify_pass(plain_text_password, user.password_hash) do
          {:ok, user}
        else
          {:error, :unauthorized}
        end
    end
  end
end
