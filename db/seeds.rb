tags = %w(学習 転職活動 豆知識 その他)
tags.each { |tag| Tag.find_or_create_by!(name: tag) }

3.times do |i|
  i += 1
  user = User.find_or_create_by!(email: "user00#{i}@test.com") do |_user|
    _user.password = 'test1234'
  end

  50.times do |ii|
    ii += 1
    user.articles.find_or_create_by!(title: "No.#{ii}: user00#{i}の記事") do |article|
      article.content = "No.#{ii}: user00#{i}の記事の本文"
      article.tag_ids = Tag.all.pluck(:id)
    end
  end
end

# user 1-多 article
# article 多-多 tag


# items
item_names = ['item1', 'item2', 'item3', 'item4', 'item5']
items = item_names.map do |name|
  Item.create(name: name)
end

# tags
tag_names = ['tag1', 'tag2', 'tag3', 'tag4', 'tag5']
tags = tag_names.map do |name|
  Tag.create(name: name)
end

# item_tags
items.each_with_index do |item, index|
  ItemTag.create(item: item, tag: tags[index])
end

# ストアとハウスのテストデータ作成
stores = Array.new(5) do
  Store.create!(store_name: Faker::Company.name,
                open_date: Faker::Date.between(from: '2020-01-01', to: '2021-12-31'),
                close_date: Faker::Date.between(from: '2022-01-01', to: '2023-12-31'))
end

houses = Array.new(5) do
  House.create!(house_name: Faker::Address.community)
end

# ストアとハウスの関連データ作成
stores.each do |store|
  houses.sample(rand(1..3)).each do |house|
    StoreHouse.create!(store: store, house: house)
  end
end
