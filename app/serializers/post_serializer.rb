class PostSerializer
  include FastJsonapi::ObjectSerializer
  attributes :text, :user, :likes, :repost_count
end
