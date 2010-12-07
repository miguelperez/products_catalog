module ProductsHelper
  #returns an array with the names of the tags that the objects have
  def unique_tags_for(object)
    if object.is_a?(Array)
      object.map{|pr| pr.tags}.flatten.map{|obj| obj.to_s}.uniq
    else
      return [] unless object.tags
      object.tags.map{|pr| pr.to_s}.uniq
    end
  end
end
