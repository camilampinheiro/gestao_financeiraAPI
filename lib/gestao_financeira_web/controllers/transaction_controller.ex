defmodule GestaoFinanceiraWeb.TransactionController do
  use GestaoFinanceiraWeb, :controller

  alias GestaoFinanceira.Finance
  alias GestaoFinanceira.Finance.Transaction
  alias GestaoFinanceira.Guardian

  action_fallback GestaoFinanceiraWeb.FallbackController

  def index(conn, _params) do
    transactions = Finance.list_transactions()
    render(conn, :index, transactions: transactions)
  end

  def create(conn, %{"transaction" => transaction_params}) do
    user = Guardian.Plug.current_resource(conn)
    transaction_params = Map.put(transaction_params, "user_id", user.id)

    with {:ok, %Transaction{} = transaction} <- Finance.create_transaction(transaction_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", ~p"/api/transactions/#{transaction.id}")
      |> render(:show, transaction: transaction)
    end
  end

  def show(conn, %{"id" => id}) do
    transaction = Finance.get_transaction!(id)
    render(conn, :show, transaction: transaction)
  end

  def update(conn, %{"id" => id, "transaction" => transaction_params}) do
    transaction = Finance.get_transaction!(id)

    with {:ok, %Transaction{} = transaction} <- Finance.update_transaction(transaction, transaction_params) do
      render(conn, :show, transaction: transaction)
    end
  end

  def delete(conn, %{"id" => id}) do
    transaction = Finance.get_transaction!(id)

    with {:ok, %Transaction{}} <- Finance.delete_transaction(transaction) do
      send_resp(conn, :no_content, "")
    end
  end
end
