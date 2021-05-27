defmodule DeltaNu.Repo do
  use Ecto.Repo,
    otp_app: :delta_nu,
    adapter: Ecto.Adapters.Postgres
end
