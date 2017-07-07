defmodule Discuss.Plugs.SetUser do
    import Plug.Conn
    import Phoenix.Controller

    alias Discuss.Repo
    alias Discuss.User

    @doc """
        Put expensive operations here that will run only once
            ## Examples
    """
    def init(_params) do

    end

    @doc """
        `_params` is whatever return from init
        must return a `conn` type

            ## Examples

    """
    def call(conn,_params) do
        user_id = get_session(conn, :user_id)

        cond do
            user = user_id && Repo.get(User, user_id) ->
                assign(conn,:user, user) # modifies connection and returns
            true ->
                assign(conn,:user,nil)

        end

    end

  
end
