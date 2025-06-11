defmodule GestaoFinanceiraWeb.TransactionJSON do
  alias GestaoFinanceira.Finance.Transaction

  @doc """
  Renders a list of transactions.
  """
  def index(%{transactions: transactions}) do
    %{data: for(transaction <- transactions, do: data(transaction))}
  end

  @doc """
  Renders a single transaction.
  """
  def show(%{transaction: transaction}) do
    %{data: data(transaction)}
  end

  defp data(%Transaction{} = transaction) do
    %{
      id: transaction.id,
      descricao: transaction.descricao,
      valor: transaction.valor,
      tipo: transaction.tipo,
      data: format_datetime(transaction.data),
      user_id: transaction.user_id,
      tag_id: transaction.tag_id,
      inserted_at: format_datetime(transaction.inserted_at),
      update_at: format_datetime(transaction.updated_at)
    }
  end

  defp format_datetime(nil), do: nil
  defp format_datetime(%DateTime{} = datetime) do
    datetime
    |> DateTime.truncate(:second)
    |> Calendar.strftime("%d/%m/%Y %H:%M")
  end
end
