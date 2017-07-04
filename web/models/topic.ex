defmodule Discuss.Topic do
    @moduledoc """
    Topic is backed by a DB table
    """

    use Discuss.Web, :model

    @doc """
    Holds model from DB
    """
    schema "topics" do
      field :title, :string
    end

    @doc """
        struct represents a record from the database or
        that's going to be inserted

        params represents the properties being updated and stuff
        stuff

        ## Examples
            iex> struct = %Discuss.Topic{}
            iex> params = %{title: "Great"}
            iex> changeset = Discuss.Topic.changeset(struct,params)
            #Ecto.Changeset<action: nil, changes: %{title: "Great"}, errors: [], data: #Discuss.Topic<>, valid?: true>

    """
    def changeset(struct,params \\ %{}) do
      struct
      |> cast(params,[:title])  # creates a changeset ( changes the database )
      |> validate_required([:title]) # adds errors to changeset

    end
end