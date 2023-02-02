require 'post_repository'

def reset_posts_table
  seed_sql = File.read('spec/seeds_posts_tags.sql')
  connection = PG.connect({host:'127.0.0.1', dbname:'blog_posts_tags_test'})
  connection.exec(seed_sql)
end

describe PostRepository do
  before(:each) do
    reset_posts_table
  end

  it 'returns an array of Post objects with coding tag' do
    repo = PostRepository.new
    posts = repo.find_by_tag('coding')

  expect(posts.length).to eq 3
    expect(posts.last.title).to eq 'Coding when traveling'
  end
end
