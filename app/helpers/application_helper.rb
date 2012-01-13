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


end
