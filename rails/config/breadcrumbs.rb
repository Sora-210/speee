# frozen_string_literal: true

crumb :root do
  link 'Top'
end

crumb :prefecture do |prefecture|
  link prefecture.name, prefecture_path(prefecture.name)
  parent :root
end

crumb :city do |city|
  link city.name, "/prefectures/#{city.prefecture.name}/cities/#{city.name}"
  parent :prefecture, city.prefecture
end

crumb :company do |company|
  link company.name
  parent :root
end

crumb :branch do |branch|
  link branch.name, branch_path(branch.id)
  parent :company, branch.company
end

crumb :review do |review|
  link '口コミ'
  parent :branch, review.branch
end
