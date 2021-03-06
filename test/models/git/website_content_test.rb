require "test_helper"

class Git::WebsiteContentTest < ActiveSupport::TestCase
  test "equal when repo urls are the same" do
    repo = Git::WebsiteContent.new("https://github.com/exercism/website-copy")
    another_repo = Git::WebsiteContent.new("https://github.com/exercism/website-copy")

    assert_equal repo, another_repo
  end

  test "unequal when repo urls are different" do
    repo = Git::WebsiteContent.new("https://github.com/exercism/website-copy")
    another_repo = Git::WebsiteContent.new("https://github.com/exercism/website-copy-v2")

    refute_equal repo, another_repo
  end

  test "returns mentor data" do
    repo = Git::WebsiteContent.new("file://#{Rails.root}/test/fixtures/website-copy")

    expected = [
      {
        github_username: "kytrinyx",
        name: "Katrina Owen",
        link_text: nil,
        link_url: nil,
        avatar_url: nil,
        bio: "Bio",
        track: "go"
      }
    ]

    assert_equal expected, repo.mentors
  end
end
