defmodule GestaoFinanceira.Finance.Transaction do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder,
    only: [:id, :descricao, :valor, :tipo, :data, :user_id, :inserted_at, :updated_at]
  }

  schema "transactions" do
    field :descricao, :string
    field :valor, :decimal
    field :tipo, :string
    field :data, :utc_datetime

    belongs_to :user, GestaoFinanceira.Accounts.User
    belongs_to :tag, GestaoFinanceira.Finance.Tag

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(transaction, attrs) do
    transaction
    |> cast(attrs, [:descricao, :valor, :tipo, :data, :tag_id, :user_id]) 
    |> validate_required([:descricao, :valor, :tipo])
    |> put_change(:data, DateTime.utc_now() |> DateTime.truncate(:second))
  end
end
