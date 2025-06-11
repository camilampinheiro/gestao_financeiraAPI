defmodule GestaoFinanceiraWeb.SessionJSON do
  alias GestaoFinanceiraWeb.UserJSON

  def create(%{token: token, user: user}) do
    %{
      token: token,
      user: UserJSON.data(user)
    }
  end
end 