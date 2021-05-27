defmodule DeltaNu.Schemas.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "user" do
      field :email, :string
      field :first_name, :string
      field :last_name, :string
      field :maiden_name, :string
      field :graduation_class_year, :integer
      field :phone_number, :string
      field :address, :string
      field :city_town, :string
      field :state_province, :string
      field :country, :string, default: "USA"
      field :profile_pic, :string
      field :role, :string

      timestamps()
  end
end