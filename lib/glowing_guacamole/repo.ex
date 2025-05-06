defmodule GlowingGuacamole.Repo do
  use Ecto.Repo,
    otp_app: :glowing_guacamole,
    adapter: Ecto.Adapters.Postgres
end
