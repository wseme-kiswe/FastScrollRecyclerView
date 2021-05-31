defmodule DeltaNu.Users.User do
  use Ecto.Schema
  import Ecto.Changeset
  use Pow.Ecto.Schema
  use Pow.Extension.Ecto.Schema,
    extensions: [PowResetPassword, PowPersistentSession]
  require IEx

  schema "users" do
    
    field :first_name, :string, null: false
    field :last_name, :string, null: false
    field :maiden_name, :string, null: true
    field :graduation_class_year, :integer, null: false
    field :phone_number, :string, null: false
    field :address, :string, null: false
    field :city_town, :string, null: false
    field :state_province, :string, null: false
    field :country, :string, null: false, default: "USA"
    field :profile_pic, :string, null: true
    field :role, :string, null: false, default: "user"
    pow_user_fields()

    timestamps()
  end

  def changeset(user_or_changeset, attrs) do
    changeset=user_or_changeset
    |> cast(attrs, [:first_name, :last_name, :maiden_name, :graduation_class_year, :phone_number, :address, :city_town, :state_province, :country, :profile_pic, :role])
    |> pow_changeset(attrs)
    |> pow_extension_changeset(attrs)
    # |> validate_length(:graduation_class_year, min: 4)
    # |> validate_required([:first_name, :last_name, :graduation_class_year, :phone_number, :address, :city_town, :state_province, :country])

    IO.puts("***********")
    IO.inspect(changeset)
    IO.puts("***********")
    changeset
  end

  @spec changeset_role(Ecto.Schema.t() | Ecto.Changeset.t(), map()) :: Ecto.Changeset.t()
  def changeset_role(user_or_changeset, attrs) do
    user_or_changeset
    |> Ecto.Changeset.cast(attrs, [:role])
    |> Ecto.Changeset.validate_inclusion(:role, ~w(user admin))
  end
end
