module NavigationHelpers
  # Maps a name to a path. Used by the
  #
  #   When /^I go to (.+)$/ do |page_name|
  #
  # step definition in web_steps.rb
  #
  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /(?:|the )login page/
      login_path
    when /(?:|the )logout page/
      logout_path
    when /that user's edit page/
      edit_admin_user_path(@user)
    when /that user's show page/
      admin_user_path(@user)
    when /the dashboard page/
      admin_path
    when /the categories page/
      admin_categories_path
    when /the products page/
      admin_products_path
    when /the banners page/
      admin_banners_path
    when /the new subscriber page/
      new_subscriber_path
    when /the new subscriber admin page/
      new_admin_subscriber_path
    when /the subscribers admin page/
      admin_subscribers_path
      
    #The following paths refers to the front end
    when /the frontend products page/
      products_path
    when /that product's frontend page/
      product_path(@product)
    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
