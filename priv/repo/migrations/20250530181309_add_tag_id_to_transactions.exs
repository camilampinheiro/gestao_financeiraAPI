defmodule GestaoFinanceira.Repo.Migrations.AddTagIdToTransactions do
  use Ecto.Migration

  def change do
    alter table(:transactions) do
      add :tag_id, references(:tags, on_delete: :nilify_all)
    end
  end
end
