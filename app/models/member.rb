class Member
  def self.create!(membership_hash)    
    group_id = membership_hash.delete :group_id
    memberships = []
    membership_hash.each do |member_class, member_ids|
      #member_class = member_class.to_s.classify.constantize
      #raise "#{member_class} - #{Groupable.types.inspect}"
      member_class = Groupable.types.detect{|t| t.to_s.downcase == member_class.singularize}
      if Groupable.types.include?(member_class)
        member_ids.each do |member_id|
          next if member_id.blank? || member_class.blank?
          memberships << Membership.create!({
            :group_id => group_id,
            :member_id => member_id,
            :member_type => member_class
          })
        end
      end
    end
    memberships
  end
end