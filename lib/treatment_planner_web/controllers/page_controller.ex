defmodule TreatmentPlannerWeb.PageController do
  use TreatmentPlannerWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
