defmodule GestaoFinanceiraWeb.TransactionController do
  use GestaoFinanceiraWeb, :controller

  alias GestaoFinanceira.Finance
  alias GestaoFinanceira.Finance.Transaction
  alias GestaoFinanceira.Guardian

  action_fallback GestaoFinanceiraWeb.FallbackController

  def index(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    transactions = Finance.list_transactions_by_user(user.id)
    render(conn, :index, transactions: transactions)
  end

  def create(conn, %{"transaction" => transaction_params}) do
    user = Guardian.Plug.current_resource(conn)

    updated_params = Map.put(transaction_params, "user_id", user.id)

    with {:ok, %Transaction{} = transaction} <- Finance.create_transaction(updated_params) do
      conn
      |> put_status(:created)
      |> render(:show, transaction: transaction)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)
    transaction = Finance.get_transaction!(id)

    if transaction.user_id == user.id do
      render(conn, :show, transaction: transaction)
    else
      conn |> put_status(:unauthorized) |> json(%{error: "Acesso não autorizado"})
    end
  end

  def update(conn, %{"id" => id, "transaction" => transaction_params}) do
    user = Guardian.Plug.current_resource(conn)
    transaction = Finance.get_transaction!(id)

    if transaction.user_id == user.id do
      with {:ok, %Transaction{} = updated} <- Finance.update_transaction(transaction, transaction_params) do
        render(conn, :show, transaction: updated)
      end
    else
      conn |> put_status(:unauthorized) |> json(%{error: "Acesso não autorizado"})
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Guardian.Plug.current_resource(conn)
    transaction = Finance.get_transaction!(id)

    if transaction.user_id == user.id do
      with {:ok, %Transaction{}} <- Finance.delete_transaction(transaction) do
        send_resp(conn, :no_content, "")
      end
    else
      conn |> put_status(:unauthorized) |> json(%{error: "Acesso não autorizado"})
    end
  end
end
