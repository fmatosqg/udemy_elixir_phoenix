defmodule Discuss.PageControllerTest do
  use Discuss.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200) =~ "Welcome to Phoenix!"
  end

  test "GET /wha", %{conn: conn} do
    conn = get conn, "/wha"
    assert html_response(conn, 200) =~ "wha"
  end
end
