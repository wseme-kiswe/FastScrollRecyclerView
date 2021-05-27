defmodule DeltaNu.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :first_name, :string
      add :last_name, :string
      add :maiden_name, :string
      add :graduation_class_year, :integer
      add :phone_number, :string
      add :address, :string
      add :city_town, :string
      add :state_province, :string
      add :country, :string, default: "USA"
      add :profile_pic, :string
      add :role, :string

      timestamps()
    end
  end
end
