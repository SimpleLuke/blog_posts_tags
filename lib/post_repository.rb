require_relative 'tag'
require_relative 'post'
class PostRepository
  def find_by_tag(tag_name)
    sql = 'SELECT posts.id, posts.title FROM posts
          JOIN posts_tags ON posts_tags.post_id = posts.id
          JOIN tags ON tags.id = posts_tags.tag_id
          WHERE tags.name = $1'
    params = [tag_name]
    result_set = DatabaseConnection.exec_params(sql,params)

    tag = Tag.new
    posts = tag.posts

  result_set.each do |record|
      # puts record
      post = Post.new
      post.id = record['id']
      post.title = record['title']

      posts << post
    end
    return posts
  end

end
