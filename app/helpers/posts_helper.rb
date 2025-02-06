module PostsHelper
  def formatted_post_body(post)
    simple_format(post.body)
  end

  def formatted_post_date(post)
    l(post.created_at, format: :long)
  end
end
