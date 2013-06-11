class Skill < ActiveRecord::Base
  has_many :skills_users
  has_many :users, through: :skills_users
  validates :name, uniqueness: true

  def user_with_proficiency(level)
    user_id = SkillsUser.where('skill_id = ? and proficiency = ?', 
                                self.id, level)[0].user_id
    User.find(user_id)
  end
end
