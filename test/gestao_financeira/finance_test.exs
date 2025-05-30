defmodule GestaoFinanceira.FinanceTest do
  use GestaoFinanceira.DataCase

  alias GestaoFinanceira.Finance

  describe "transactions" do
    alias GestaoFinanceira.Finance.Transaction

    import GestaoFinanceira.FinanceFixtures

    @invalid_attrs %{data: nil, descricao: nil, valor: nil, tipo: nil}

    test "list_transactions/0 returns all transactions" do
      transaction = transaction_fixture()
      assert Finance.list_transactions() == [transaction]
    end

    test "get_transaction!/1 returns the transaction with given id" do
      transaction = transaction_fixture()
      assert Finance.get_transaction!(transaction.id) == transaction
    end

    test "create_transaction/1 with valid data creates a transaction" do
      valid_attrs = %{data: ~U[2025-05-27 18:52:00Z], descricao: "some descricao", valor: "120.5", tipo: "some tipo"}

      assert {:ok, %Transaction{} = transaction} = Finance.create_transaction(valid_attrs)
      assert transaction.data == ~U[2025-05-27 18:52:00Z]
      assert transaction.descricao == "some descricao"
      assert transaction.valor == Decimal.new("120.5")
      assert transaction.tipo == "some tipo"
    end

    test "create_transaction/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Finance.create_transaction(@invalid_attrs)
    end

    test "update_transaction/2 with valid data updates the transaction" do
      transaction = transaction_fixture()
      update_attrs = %{data: ~U[2025-05-28 18:52:00Z], descricao: "some updated descricao", valor: "456.7", tipo: "some updated tipo"}

      assert {:ok, %Transaction{} = transaction} = Finance.update_transaction(transaction, update_attrs)
      assert transaction.data == ~U[2025-05-28 18:52:00Z]
      assert transaction.descricao == "some updated descricao"
      assert transaction.valor == Decimal.new("456.7")
      assert transaction.tipo == "some updated tipo"
    end

    test "update_transaction/2 with invalid data returns error changeset" do
      transaction = transaction_fixture()
      assert {:error, %Ecto.Changeset{}} = Finance.update_transaction(transaction, @invalid_attrs)
      assert transaction == Finance.get_transaction!(transaction.id)
    end

    test "delete_transaction/1 deletes the transaction" do
      transaction = transaction_fixture()
      assert {:ok, %Transaction{}} = Finance.delete_transaction(transaction)
      assert_raise Ecto.NoResultsError, fn -> Finance.get_transaction!(transaction.id) end
    end

    test "change_transaction/1 returns a transaction changeset" do
      transaction = transaction_fixture()
      assert %Ecto.Changeset{} = Finance.change_transaction(transaction)
    end
  end
end
