module Riwiki::Support::RouteMapper
  
  # Defining wiki root mount point
  def riwiki_root( path, options = {} )
    opts = {
      :controller => 'wiki_pages',
      :root => path
    }.merge(options)
        
    connect( "#{path}/edit/*page", opts.merge({ :action => 'edit' }) ) # Wiki edit route
    connect( "#{path}/*page", opts.merge({ :action => 'update', :conditions => { :method => :post } }) ) # Save wiki pages route
    connect( "#{path}/*page", opts.merge({ :action => 'show', :conditions => { :method => :get } }) ) # Wiki pages route
  end
  
end