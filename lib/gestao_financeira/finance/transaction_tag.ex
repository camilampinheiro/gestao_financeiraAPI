defmodule GestaoFinanceira.Finance.TransactionTag do
  use Ecto.Schema
  import Ecto.Changeset

  schema "transaction_tags" do
    belongs_to :transaction, GestaoFinanceira.Finance.Transaction
    belongs_to :tag, GestaoFinanceira.Finance.Tag

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction_tag, attrs) do
    transaction_tag
    |> cast(attrs, [:transaction_id, :tag_id])
    |> validate_required([:transaction_id, :tag_id])
    |> foreign_key_constraint(:transaction_id)
    |> foreign_key_constraint(:tag_id)
    |> unique_constraint([:transaction_id, :tag_id])
  end
end 