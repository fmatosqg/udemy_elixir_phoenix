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

        params represents the properties being updated

        ## Examples
            iex> struct = %Discuss.Topic{}
            iex> params = %{title: "Great"}
            iex> _changeset = Discuss.Topic.changeset(struct,params)
            #Ecto.Changeset<action: nil, changes: %{title: "Great"}, errors: [], data: #Discuss.Topic<>, valid?: true>

            iex> changeset = Discuss.Topic.changeset(%Discuss.Topic{})
            iex> %Ecto.Changeset{changes: _hooray, errors: errors} = changeset
            iex> errors
            [title: {"can't be blank", [validation: :required]}]

    """
    def changeset(struct,params \\ %{}) do

      IO.puts "Params is :"
      IO.inspect params

      struct
      |> cast(params,[:title])  # changes the database
      |> validate_required([:title]) # adds errors to changeset if :title is not in the changes

    end
end