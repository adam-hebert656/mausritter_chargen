defmodule MausritterChargen.Repo do
  use Ecto.Repo,
    otp_app: :mausritter_chargen,
    adapter: Ecto.Adapters.Postgres
end
