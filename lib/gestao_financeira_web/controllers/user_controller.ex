defmodule GestaoFinanceiraWeb.UserController do
  use GestaoFinanceiraWeb, :controller

  alias GestaoFinanceira.Accounts
  alias GestaoFinanceira.Accounts.User
  import Ecto.Query

  action_fallback GestaoFinanceiraWeb.FallbackController

  def index(conn, _params) do
    users = Accounts.list_users()
    render(conn, :index, users: users)
  end

  def show(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)
    render(conn, :show, user: user)
  end

  def create(conn, %{"user" => user_params}) do
    with {:ok, %User{} = user} <- Accounts.create_user(user_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/users/#{user}")
      |> render(:show, user: user)
    end
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Accounts.get_user!(id)

    with {:ok, %User{} = updated_user} <- Accounts.update_user(user, user_params) do
      render(conn, :show, user: updated_user)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Accounts.get_user!(id)

    from(t in GestaoFinanceira.Finance.Transaction, where: t.user_id == ^user.id)
    |> GestaoFinanceira.Repo.delete_all()

    with {:ok, %User{}} <- Accounts.delete_user(user) do
      send_resp(conn, :no_content, "")
    end
  end
end
