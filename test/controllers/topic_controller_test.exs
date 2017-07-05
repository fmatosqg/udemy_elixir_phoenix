defmodule Discuss.TopicControllerTest do
  use Discuss.ConnCase

  doctest Discuss.TopicController


  test "GET /topics/new", %{conn: conn} do
    conn = get conn, "/topics/new"
    assert html_response(conn, 200) =~ "New Topic Creation"
  end

  test "GET /topics/new?what=it", %{conn: conn} do
    conn = get conn, "/topics/new?what=it"
    assert html_response(conn, 200) =~ "New Topic Creation"
  end

  test "Nasty error matching expected" do

    params = %{"topic" => %{"no_title" => "" } }
    assert catch_error( Discuss.TopicController.create(%Plug.Conn{}, params) ) == {:badmatch, %{"no_title" => ""}}
   end

  test "Simplified error matching expected" do
    params = %{"topic" => %{"no_title" => "" } }
    assert catch_error( %{"topic" => %{"title" => _title } } = params ) == {:badmatch, %{"topic" => %{"no_title" => ""}} }
   end


end
