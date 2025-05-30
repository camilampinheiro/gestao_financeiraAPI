defmodule GestaoFinanceira.FinanceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GestaoFinanceira.Finance` context.
  """

  @doc """
  Generate a transaction.
  """
  def transaction_fixture(attrs \\ %{}) do
    {:ok, transaction} =
      attrs
      |> Enum.into(%{
        data: ~U[2025-05-27 18:52:00Z],
        descricao: "some descricao",
        tipo: "some tipo",
        valor: "120.5"
      })
      |> GestaoFinanceira.Finance.create_transaction()

    transaction
  end

  @doc """
  Generate a tag.
  """
  def tag_fixture(attrs \\ %{}) do
    {:ok, tag} =
      attrs
      |> Enum.into(%{
        nome: "some nome"
      })
      |> GestaoFinanceira.Finance.create_tag()

    tag
  end
end
