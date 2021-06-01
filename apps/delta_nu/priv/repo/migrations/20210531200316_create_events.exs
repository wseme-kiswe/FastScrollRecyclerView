defmodule DeltaNu.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :description, :text
      add :start_time, :naive_datetime
      add :end_time, :naive_datetime
      add :picture, :string, null: true
      add :place, :string, null: true
      add :amount_registered_users, :integer, default: 0
      add :max_registered_users, :integer, default: 20

      timestamps()
    end

  end
end
