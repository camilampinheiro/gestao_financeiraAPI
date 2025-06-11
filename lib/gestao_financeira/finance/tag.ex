defmodule GestaoFinanceira.Finance.Tag do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Jason.Encoder,
  only: [:id, :nome, :inserted_at, :updated_at]
  }

  schema "tags" do
    field :nome, :string

    has_many :transactions, GestaoFinanceira.Finance.Transaction

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(tag, attrs) do
    tag
    |> cast(attrs, [:nome])
    |> validate_required([:nome])
  end
end
