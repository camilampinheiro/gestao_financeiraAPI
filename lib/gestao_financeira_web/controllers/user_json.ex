defmodule GestaoFinanceiraWeb.UserJSON do
  alias GestaoFinanceira.Accounts.User

  @doc """
  Renders a list of users.
  """
  def index(%{users: users}) do
    %{data: for(user <- users, do: data(user))}
  end

  @doc """
  Renders a single user.
  """
  def show(%{user: user}) do
    %{data: data(user)}
  end

  defp data(%User{} = user) do
    %{
      id: user.id,
      name: user.name,
      email: user.email,
      password_hash: user.password_hash,
      inserted_at: format_datetime(user.inserted_at),
      updated_at: format_datetime(user.updated_at)
    }
  end

  defp format_datetime(nil), do: nil
  defp format_datetime(%DateTime{} = datetime) do
    datetime
    |> DateTime.shift_zone!("America/Sao_Paulo")
    |> DateTime.truncate(:second)
    |> Calendar.strftime("%d/%m/%Y %H:%M")
  end
end
