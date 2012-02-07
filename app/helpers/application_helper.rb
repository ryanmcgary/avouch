module ApplicationHelper

def approve_link_text(approvable)  
  approvable.call_completed? ? 'Reject' : 'Approve'  
end  

def resource_name
	current_user
end

def resource
	@resource ||= current_user
end

def devise_mapping
	@devise_mapping ||= Devise.mappings[:user]
end

def wtf_devise #  This is horrible monkey patch just so I can get registration form on a different page working-ish
	if !session[:wtf].nil? 
	  session[:wtf].each do |key,value| 
	  	resource.errors.add(key, value) 
	  end 
	  session.delete(:wtf) 
  end 
end

def url_escape(string)
  string.gsub(/([^ a-zA-Z0-9_-]+)/n) do
  '%' + $1.unpack('H2' * $1.size).join('%').upcase
  end.tr(' ', '+')
end

def url_unescape(string)
  string.tr('+', ' ').gsub(/((?:%[0-9a-fA-F]{2})+)/n) do
  [$1.delete('%')].pack('H*')
  end
end


end
