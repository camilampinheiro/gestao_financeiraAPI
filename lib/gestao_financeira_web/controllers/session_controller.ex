defmodule GestaoFinanceiraWeb.SessionController do
  use GestaoFinanceiraWeb, :controller

  alias GestaoFinanceira.Accounts
  alias GestaoFinanceira.Guardian

  def create(conn, %{"email" => email, "password" => password}) do
    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        {:ok, token, _claims} = Guardian.encode_and_sign(user)
        conn
        |> put_status(:ok)
        |> render(:create, %{token: token, user: user})

      {:error, :unauthorized} ->
        conn
        |> put_status(:unauthorized)
        |> json(%{error: "Email ou senha inválidos"})
    end
  end
end
