module ApplicationHelper
  def flash_class(flash_type)
    case flash_type.to_sym
    when :notice then "alert-success"
    when :alert then "alert-danger"
    when :error then "alert-danger"
    when :warning then "alert-warning"
    else
      "alert-info"
    end
  end
end

def oauth_providers
  [ {name: "Google",url: "/auth/google_oauth2", style: "btn-outline-danger"},
    {name: "GitHub", url: "/auth/github", style: "btn-dark" }
  ]
end