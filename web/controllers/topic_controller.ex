defmodule Discuss.TopicController do
    use Discuss.Web, :controller



    def get_parameters%{"topic" => topic} do
        topic
    end

    def get_parameters%{} do
        "empty"
    end


    @doc """
        Create new topics
    """
    def new(conn,params) do

        _topic = get_parameters(params)

#        IO.puts "+++++++++++++++++++"
#        IO.inspect conn
#        IO.puts "+++++++++++++++++++"
#        IO.inspect _params
#        IO.puts  "Hit new topic! '#{topic}'"
#        IO.puts "+++++++++++++++++++"

        render conn,"new.html"
    end

end

