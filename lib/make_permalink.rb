module MakePermalink

  def create_permalink
    if self.permalink.blank?
      self.name = self.name.squeeze(' ').strip
      self.permalink = self.make_permalink(self.name)
    end
  end

  def make_permalink(result)
    res = result
    res = res.gsub(/&(\d)+;/, '') # Ditch Entities
    res = res.gsub('&', 'and')    # Replace & with 'and'
    res = res.gsub(/["]/, '')    # replace quotes by nothing
    #    res = res.gsub(/[^a-zA-Z\.\-\'|\s]/,'')
    res = res.gsub(/\ +/, '_')    # replace all white space sections with a underscore
    res = res.gsub("/", '_')    # replace slashes with underscores
    res = res.gsub(/(_)$/, '')    # trim underscores
    res = res.gsub(/^(_)/, '')    # trim underscores
    res = res.gsub('.','')        # remove periods
    res = res.gsub(',','')        # remove commas
    return res
  end  

end