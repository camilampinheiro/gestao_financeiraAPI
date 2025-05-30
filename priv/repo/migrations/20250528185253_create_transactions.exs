defmodule GestaoFinanceira.Repo.Migrations.CreateTransactions do
  use Ecto.Migration

  def change do
    create table(:transactions) do
      add :descricao, :string
      add :valor, :decimal
      add :tipo, :string
      add :data, :utc_datetime
      add :user_id, references(:users, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:transactions, [:user_id])
  end
end
