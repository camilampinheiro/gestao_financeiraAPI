defmodule GestaoFinanceira.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `GestaoFinanceira.Accounts` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        inserted_at: ~U[2025-05-27 16:20:00Z],
        name: "some name",
        password_hash: "some password_hash",
        updated_at: ~U[2025-05-27 16:20:00Z]
      })
      |> GestaoFinanceira.Accounts.create_user()

    user
  end
end
