class User < ActiveRecord::Base
  has_many :skills_users
  has_many :skills, through: :skills_users
  
  def proficiency_for(skill)
    SkillsUser.where('user_id = ? and skill_id = ?', 
                      self.id, skill.id)[0].proficiency
  end

  def set_proficiency_for(skill, level)
    skills_user = SkillsUser.where('user_id = ? and skill_id = ?', 
                      self.id, skill.id)[0]
    skills_user.proficiency = level
    skills_user.save
  end
end
