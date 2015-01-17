module HomeHelper
  def class_name_for_all
    params[:user_group] ? 'btn-default' : 'btn-primary'
  end

  def class_name_for(user_group)
    params[:user_group] == user_group.id.to_s ? 'btn-primary' : 'btn-default'
  end
  
  def class_name_tweet_active(index)
    'active' if index == 0
  end

end
