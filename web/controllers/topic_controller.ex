defmodule Discuss.TopicController do
    use Discuss.Web, :controller


    alias Discuss.Topic


    # this is for :new
    @doc """
        ## Examples
            iex> Discuss.TopicController.get_parameters %{"topic" => "name it" }
            "name it"

            iex> p2 = %{"topic" => %{"title" => "tt"} }
            iex> %{"topic" => t2} = p2
            iex> t2
            %{"title" => "tt"}

            iex> Discuss.TopicController.get_parameters %{"topic" => %{"title" => "tt"} }
            %{"title" => "tt"}

            iex> Discuss.TopicController.get_parameters %{"topic" => %{"no_title" => "" } }
            %{"no_title" => ""}

            iex> Discuss.TopicController.get_parameters %{"no_topic" => "" }
            %{"empty" => "empty"}
    """
    def get_parameters(%{"topic" => topic} = _params) do
        topic
    end


    def get_parameters%{} do
        %{"empty" => "empty"}
    end


    @doc """
        Render page to create new topics

    """
    def new(conn,params) do

        changeset = Topic.changeset(%Topic{},%{})

        render conn,"new.html", changeset: changeset, dummy: 1+2
    end

    @doc """
        Render page for newly created topic

        ## Examples
            iex> params = %{"_csrf_token" => "Gh8YKS4lPQY/ZhsIIQwPAypsOSwqEAAAkkRmKAk7SSNZR5aUGGAJOA==","_utf8" => "✓", "topic" => %{"title" => "aa"} }
            iex> Discuss.TopicController.create(%Plug.Conn{}, params)
            ** (RuntimeError) a view module was not specified, set one with put_view/2

            iex> params = %{"topic" => %{"title" => "" } }
            iex> Discuss.TopicController.create(%Plug.Conn{}, params)
            ** (RuntimeError) a view module was not specified, set one with put_view/2

            iex> params = %{"topic" => %{"no_title" => "" } }
            iex> Discuss.TopicController.create(%Plug.Conn{}, params)
            ** (MatchError) no match of right hand side value: %{"no_title" => ""}

            iex> params = %{"topic" => %{"no_title" => "" } }
            iex> %{"topic" => %{"title" => _title } } = params
            ** (MatchError) no match of right hand side value: %{"topic" => %{"no_title" => ""}}


    """
    def create(conn,params) do

        %{"title" => topic} = get_parameters(params)

        IO.puts "Got a nice new topic #{topic}"

        render conn, "create.html", topic: topic
    end

end

