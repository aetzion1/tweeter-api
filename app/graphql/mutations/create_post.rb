module Mutations
  class CreatePost < BaseMutation
    # arguments passed to the `resolve` method
    argument :text, String, required: true

    # return type from the mutation
    type Types::PostType

    def resolve(text: nil)
      Post.create!(
        text: text,
      )
    end
  end
end