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
        assert hooray == %{title: "Great"}
        assert errors == []
      end
end