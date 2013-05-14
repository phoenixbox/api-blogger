class Client
  attr_reader :base_path

  def initialize(base_path)
    @base_path = base_path
  end

  def get_articles
    json = RestClient.get(base_path+'/articles.json')
  end

  def get_article(id)
    json = RestClient.get(base_path+"/articles/#{id}.json")
  end

  def post_article(params)
    path = base_path+"/articles.json"
    json = RestClient.post( path, {article: params } )
  end

  def post_comment(params)
    path = base_path+"/comments.json"
    json = RestClient.post( path, {article: {comment: params} } )
  end

end
