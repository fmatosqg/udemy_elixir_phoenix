defmodule Discuss.User do
    use Discuss.Web, :model

    schema "users" do
      field :email, :string
      field :provider, :string
      field :token, :string
      field :login, :string
      field :github_id, :string

      has_many :topics, Discuss.Topic

      timestamps()
    end

    @doc """
            ## Examples
                iex> "example"
                "example"
    """
    def changeset(struct,params \\ %{}) do
        struct
        |> cast(params, [:email, :provider, :token])
        |> validate_required([:email, :provider, :token])
    end

end