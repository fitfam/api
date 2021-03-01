defmodule FitFam.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "users" do
    field(:avatar, :string)
    field(:email, :string)
    field(:name, :string)
    field(:username, :string)
    field(:uid, :string)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :uid, :name, :avatar, :username])
    |> validate_required([:email, :uid, :name, :avatar])
    |> unique_constraint([:email, :username])
  end
end
