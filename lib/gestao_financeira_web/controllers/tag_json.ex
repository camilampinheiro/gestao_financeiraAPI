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
      inserted_at: format_datetime(tag.inserted_at),
      updated_at: format_datetime(tag.updated_at)
    }
  end

  defp format_datetime(nil), do: nil
  defp format_datetime(%DateTime{} = datetime) do
    datetime
    |> DateTime.truncate(:second)
    |> Calendar.strftime("%d/%m/%Y %H:%M")
  end

end
