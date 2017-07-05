defmodule Discuss.TopicTest do
    use ExUnit.Case
    doctest Discuss.Topic

      test "Truth" do
        assert 1 == 1
      end

      test "Create changeset" do
        struct = %Discuss.Topic{}
        params = %{title: "Great"}
        changeset = Discuss.Topic.changeset(struct,params)

        %Ecto.Changeset{changes: hooray, errors: errors} = changeset


        assert changeset.valid?
        assert hooray == params
        assert errors == []
      end

      test "Make error if title is empty" do
        struct = %Discuss.Topic{}
        params = %{title: ""}
        changeset = Discuss.Topic.changeset(struct,params)

        %Ecto.Changeset{changes: _hooray, errors: errors} = changeset

        assert changeset.valid? == false
        assert errors == [title: {"can't be blank", [validation: :required]}]

      end

      test "Make error if title is empty spaces" do
        struct = %Discuss.Topic{}
        params = %{title: "    "}
        changeset = Discuss.Topic.changeset(struct,params)

        %Ecto.Changeset{changes: _hooray, errors: errors} = changeset

        assert changeset.valid? == false
        assert errors == [title: {"can't be blank", [validation: :required]}]

      end

      test "Make error if params is nil, but no crash" do
        struct = %Discuss.Topic{}

        changeset = Discuss.Topic.changeset(struct)

        %Ecto.Changeset{changes: _hooray, errors: errors} = changeset

        assert changeset.valid? == false
        assert errors == [title: {"can't be blank", [validation: :required]}]

      end

end