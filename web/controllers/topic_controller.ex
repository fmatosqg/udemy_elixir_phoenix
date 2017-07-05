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
            ## Examples

    """
    def index(conn,_params) do

        query = from(t in Topic, order_by: [desc: t.id], limit: 5)
        topics = Repo.all(query)

        render conn, "index.html", topics: topics

    end

    @doc """
        Render page to create new topics

    """
    def new(conn,_params) do

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
            iex> %{"topic" => %{"title" => _title } } = params
            ** (MatchError) no match of right hand side value: %{"topic" => %{"no_title" => ""}}


    """
    def create(conn,%{"topic" => topic}) do

        case insert(topic) do
          {:ok, post}       ->
           %{"title" => title} = topic

            conn
            |> put_flash(:info, "Topic #{title} Created")
            |> redirect(to: topic_path(conn, :index))
          {:error, changeset} ->
            IO.inspect changeset
            render conn, "new.html", changeset: changeset, dummy: "blaa"
        end

#
#        render conn, "create.html", title: title
    end

    @doc """
        ## Examples
            iex> params = %{"topic" => %{"no_title" => "" } }
            iex> res = Discuss.TopicController.insert(params)
            iex> {:error,err_changeset} = res
            iex> %Ecto.Changeset{ action: :insert, errors: errors }  = err_changeset
            iex> errors
            [title: {"can't be blank", [validation: :required]}]
    """

    def insert(topic) do
        changeset = Topic.changeset(%Topic{}, topic)
        Repo.insert(changeset)
    end

end

