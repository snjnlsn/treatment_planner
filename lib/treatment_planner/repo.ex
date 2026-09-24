defmodule TreatmentPlanner.Repo do
  use Ecto.Repo,
    otp_app: :treatment_planner,
    adapter: Ecto.Adapters.Postgres
end
