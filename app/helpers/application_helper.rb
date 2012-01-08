module ApplicationHelper

def approve_link_text(approvable)  
  approvable.call_completed? ? 'Reject' : 'Approve'  
end  

end
