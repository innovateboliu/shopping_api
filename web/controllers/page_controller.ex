defmodule ShoppingApi.PageController do
  use ShoppingApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
