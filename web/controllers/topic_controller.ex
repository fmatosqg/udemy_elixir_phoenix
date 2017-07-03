defmodule Discuss.TopicController do
    use Discuss.Web, :controller

    @doc """

    """
    def new(conn,_params) do
        IO.puts "Hit!"
        render conn,"new.html"
    end

end

