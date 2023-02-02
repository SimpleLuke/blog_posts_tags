require 'tag_repository'

def reset_tags_table
  seed_sql = File.read('spec/seeds_posts_tags.sql')
  connection = PG.connect({host:'127.0.0.1', dbname:'blog_posts_tags_test'})
  connection.exec(seed_sql)
end

describe TagRepository do
  before(:each) do
    reset_tags_table
  end

  it 'returns an array of related Tag Objects from a post ID ' do
    repo = TagRepository.new
    tags = repo.find_by_post(4)

    expect(tags.length).to eq 2
  expect(tags.first.id).to eq 1
  expect(tags.first.name).to eq 'coding'
  expect(tags.last.id).to eq 2
  expect(tags.last.name).to eq 'travel'
  end
end
