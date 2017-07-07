defmodule Discuss.Repo.Migrations.AddUserGithubId do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :login, :string
      add :github_id, :string
    end
  end
end
