defmodule GestaoFinanceira.Repo.Migrations.AddTagIdToTransactions do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      remove :tag_id
    end
  end
end
