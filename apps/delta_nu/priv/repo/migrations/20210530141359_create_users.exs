defmodule DeltaNu.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :password_hash, :string
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
      
      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
