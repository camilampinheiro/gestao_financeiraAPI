defmodule GestaoFinanceiraWeb.TagJSON do
  alias GestaoFinanceira.Finance.Tag

  @doc """
  Renders a list of tags.
  """
  def index(%{tags: tags}) do
    %{data: for(tag <- tags, do: data(tag))}
  end

  @doc """
  Renders a single tag.
  """
  def show(%{tag: tag}) do
    %{data: data(tag)}
  end

  defp data(%Tag{} = tag) do
    %{
      id: tag.id,
      nome: tag.nome,
      inserted_at: tag.inserted_at,
      updated_at: tag.updated_at
    }
  end
end
