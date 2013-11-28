class Slug
  def self.convert str
    return "" if str.nil?
    
    #strip the string
    ret = str.strip.downcase

    #blow away apostrophes
    ret.gsub! /['`]/,""

    # @ --> at, and & --> and
    ret.gsub! /\s*@\s*/, " at "
    ret.gsub! /\s*&\s*/, " and "

    #replace all non alphanumeric, underscore or periods with hyphens
    ret.gsub! /\s*[^A-Za-z0-9\.\-]\s*/, '-'  
    
    #convert double hyphens to single
    ret.gsub! /_+/,"-"

    #strip off leading/trailing underscore
    ret.gsub! /\A[_\.]+|[_\.]+\z/,""

    ret
  end
end
