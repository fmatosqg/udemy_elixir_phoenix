defmodule Discuss.PageController do
  use Discuss.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end

  def wha(conn,_params) do
    render conn,"wha.html"
  end
end
