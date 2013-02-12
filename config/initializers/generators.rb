Rails.application.config.generators do |g|
    g.fixture_replacement = :factory_girl
    g.test_framework = :rspec
end
