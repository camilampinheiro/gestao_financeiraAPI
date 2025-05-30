defmodule GestaoFinanceiraWeb.SessionController do
  use GestaoFinanceiraWeb, :controller

  alias GestaoFinanceira.Accounts
  alias GestaoFinanceira.Guardian

  def create(conn, %{"email" => email, "password" => password}) do
    case Accounts.get_user_by_email(email) do
      nil ->
        conn |> put_status(:unauthorized) |> json(%{error: "Usuário não encontrado"})

      user ->
        if Bcrypt.verify_pass(password, user.password_hash) do
          {:ok, token, _claims} = Guardian.encode_and_sign(user)
          json(conn, %{token: token})
        else
          conn |> put_status(:unauthorized) |> json(%{error: "Senha inválida"})
        end
    end
  end
end
