defmodule DeltaNuWeb.PageController do
  use DeltaNuWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def about_us(conn, _params) do
    render(conn, "about_us.html")
  end
end
