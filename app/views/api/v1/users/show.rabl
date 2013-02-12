object @user
attributes :id
child :plan do
  child :settings => :settings do
    attributes :youtube
  end
end
node(:keyword_count) { @user.search_keywords.size }
node(:url_count) { @user.search_keyword_urls.size }
node(:keyword_limit) { @user.plan.settings.keyword_limit }
node(:top10_keyword_count) { @user.top10_keywords.count }
node(:top3_keyword_count) { @user.top3_keywords.count }