defmodule Discuss.TopicControllerTest do
  use Discuss.ConnCase


  test "GET /topics/new", %{conn: conn} do
    conn = get conn, "/topics/new"
    assert html_response(conn, 200) =~ "New Topic Created"
  end

end
