class Alert < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :item
  
  def self.runAlertsForUser(userId) 
  
    @results = Array.new
    @alerts = Alert.where(:user_id => userId) # needs user and time limit
    
    @alerts.each do |alert| 
      @searchTerm = "%#{alert.freetext}%"
      @items = Item.where("title LIKE ? OR desc LIKE ?", @searchTerm, @searchTerm)  
      @results << @items unless @items.size == 0
    end
    
    puts @results
    return @results
    
    #@user = User.first
    #UserMailer.welcome_email(@user).deliver
    mail(:to => 'larsf2005@gmail.com', :subject => "Registered")  
    
  end
  
end