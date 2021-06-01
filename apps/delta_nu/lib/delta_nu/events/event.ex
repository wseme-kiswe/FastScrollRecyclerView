defmodule DeltaNu.Events.Event do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :amount_registered_users, :integer, default: 0
    field :description, :string
    field :end_time, :naive_datetime
    field :max_registered_users, :integer, default: 20
    field :picture, :string
    field :place, :string
    field :start_time, :naive_datetime
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(event, attrs) do
    event
    |> cast(attrs, [:title, :description, :start_time, :end_time, :picture, :place, :amount_registered_users, :max_registered_users])
    |> validate_required([:title, :description, :start_time, :end_time, :max_registered_users])
  end
end
