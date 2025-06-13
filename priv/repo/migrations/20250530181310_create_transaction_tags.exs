defmodule GestaoFinanceira.Repo.Migrations.CreateTransactionTags do
  use Ecto.Migration

  def change do
    create table(:transaction_tags) do
      add :transaction_id, references(:transactions, on_delete: :delete_all)
      add :tag_id, references(:tags, on_delete: :delete_all)

      timestamps(type: :utc_datetime)
    end

    create index(:transaction_tags, [:transaction_id])
    create index(:transaction_tags, [:tag_id])
    create unique_index(:transaction_tags, [:transaction_id, :tag_id])
  end
end 