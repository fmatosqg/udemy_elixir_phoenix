defmodule Discuss.AuthController do
    use Discuss.Web, :controller
    plug Ueberauth

    alias Discuss.User


    def callback(%{assigns: %{ueberauth_failure: auth}} = conn, params) do

        IO.puts "Authentication failure"
        conn
        |> put_flash(:info, "Error logging in")
        |> redirect(to: topic_path(conn,:index))

    end

    @doc """
            ## Examples

    """
    def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do

        IO.puts "=========================="
        IO.inspect auth
        IO.puts "=========================="
        IO.inspect params
        IO.puts "=========================="

        user_params = %{token: auth.credentials.token,
            email: auth.info.email,
            provider: "github" }

        changeset = User.changeset(%User{},user_params)

        IO.inspect user_params

        {:ok, provider: username } = signin(conn,changeset)



    end

    @doc """
        ## Examples
            iex> user_params = %{email: "hello@hi.hi", provider: "test", token: "fake" }
            iex> changeset = Discuss.User.changeset(%Discuss.User{},user_params)
            iex> res = Discuss.AuthController.upsert_user(changeset)
            iex> {:ok, %Discuss.User{email: email } } = res
            iex> email
            "hello@hi.hi"

            iex> user_params = %{email: "hello@hi.hi", provider: "test", token: "fake" }
            iex> changeset = Discuss.User.changeset(%Discuss.User{},user_params)
            iex> res = Discuss.AuthController.upsert_user(changeset)
            iex> {:ok, %Discuss.User{id: id1 } } = res
            iex> res = Discuss.AuthController.upsert_user(changeset)
            iex> {:ok, %Discuss.User{id: id2 } } = res
            iex> id1 == id2
            true

    """
    def upsert_user(changeset) do

        case Repo.get_by(User, email: changeset.changes.email) do
          nil ->  # insert
            Repo.insert(changeset)
          user ->  # update
            {:ok, user}
        end

    end


    @doc """
            ## Examples

    """
    defp signin(conn,changeset) do
        case upsert_user(changeset) do
            {:ok, user } ->
                %Discuss.User{email: username} = user
                conn
                |> put_flash(:info, "Welcome back #{username} !")
                |> put_session(:user_id, user.id)
                |> redirect(to: topic_path(conn,:index))
            {:error, _reason} ->
                conn
                |> put_flash(:error, "Error signing in")
                |> redirect(to: topic_path(conn, :index))

        end

    end

end