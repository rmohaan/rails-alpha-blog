module UsersHelper
    def gravatar_for(user, options = {size: 80})
        email = user.email.downcase
        hash = Digest::MD5.hexdigest(email)
        size = options[:size]
        url  = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
        image_tag(url, alt: user.username, class: "rounded mx-auto d-block shadow")
    end
end