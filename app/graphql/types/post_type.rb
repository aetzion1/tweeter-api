module Types
  class PostType < Types::BaseObject
    field :id, ID, null: false
    field :text, String, null: false
    field :likes, Integer, null: false
    field :respost_count, Integer, null: false
    field :user, Types::UserType, null: false
  end
end
