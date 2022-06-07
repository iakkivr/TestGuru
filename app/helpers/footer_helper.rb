module FooterHelper
  def current_year
    Time.zone.now.year
  end

  def github_url(author, repo)
    link_to 'Github', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noreferrer noopener'
  end

  def link_to_courses
    link_to 'Thinknetica', "http://www.thinknetica.com", target: '_blank', rel: 'noreferrer noopener'
  end
end
