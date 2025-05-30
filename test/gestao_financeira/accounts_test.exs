defmodule GestaoFinanceira.AccountsTest do
  use GestaoFinanceira.DataCase

  alias GestaoFinanceira.Accounts

  describe "users" do
    alias GestaoFinanceira.Accounts.User

    import GestaoFinanceira.AccountsFixtures

    @invalid_attrs %{name: nil, password: nil, email: nil, inserted_datetime: nil, updated_datetime: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name", password: "some password", email: "some email", inserted_datetime: ~U[2025-05-27 16:13:00Z], updated_datetime: ~U[2025-05-27 16:13:00Z]}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.password == "some password"
      assert user.email == "some email"
      assert user.inserted_datetime == ~U[2025-05-27 16:13:00Z]
      assert user.updated_datetime == ~U[2025-05-27 16:13:00Z]
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name", password: "some updated password", email: "some updated email", inserted_datetime: ~U[2025-05-28 16:13:00Z], updated_datetime: ~U[2025-05-28 16:13:00Z]}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.password == "some updated password"
      assert user.email == "some updated email"
      assert user.inserted_datetime == ~U[2025-05-28 16:13:00Z]
      assert user.updated_datetime == ~U[2025-05-28 16:13:00Z]
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias GestaoFinanceira.Accounts.User

    import GestaoFinanceira.AccountsFixtures

    @invalid_attrs %{name: nil, email: nil, password_hash: nil, inserted_at: nil, updated_at: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name", email: "some email", password_hash: "some password_hash", inserted_at: ~U[2025-05-27 16:20:00Z], updated_at: ~U[2025-05-27 16:20:00Z]}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.email == "some email"
      assert user.password_hash == "some password_hash"
      assert user.inserted_at == ~U[2025-05-27 16:20:00Z]
      assert user.updated_at == ~U[2025-05-27 16:20:00Z]
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email", password_hash: "some updated password_hash", inserted_at: ~U[2025-05-28 16:20:00Z], updated_at: ~U[2025-05-28 16:20:00Z]}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.email == "some updated email"
      assert user.password_hash == "some updated password_hash"
      assert user.inserted_at == ~U[2025-05-28 16:20:00Z]
      assert user.updated_at == ~U[2025-05-28 16:20:00Z]
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "users" do
    alias GestaoFinanceira.Accounts.User

    import GestaoFinanceira.AccountsFixtures

    @invalid_attrs %{name: nil, email: nil, password_hash: nil, inserted_at: nil, updated_at: nil}

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{name: "some name", email: "some email", password_hash: "some password_hash", inserted_at: ~U[2025-05-27 18:08:00Z], updated_at: ~U[2025-05-27 18:08:00Z]}

      assert {:ok, %User{} = user} = Accounts.create_user(valid_attrs)
      assert user.name == "some name"
      assert user.email == "some email"
      assert user.password_hash == "some password_hash"
      assert user.inserted_at == ~U[2025-05-27 18:08:00Z]
      assert user.updated_at == ~U[2025-05-27 18:08:00Z]
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{name: "some updated name", email: "some updated email", password_hash: "some updated password_hash", inserted_at: ~U[2025-05-28 18:08:00Z], updated_at: ~U[2025-05-28 18:08:00Z]}

      assert {:ok, %User{} = user} = Accounts.update_user(user, update_attrs)
      assert user.name == "some updated name"
      assert user.email == "some updated email"
      assert user.password_hash == "some updated password_hash"
      assert user.inserted_at == ~U[2025-05-28 18:08:00Z]
      assert user.updated_at == ~U[2025-05-28 18:08:00Z]
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
