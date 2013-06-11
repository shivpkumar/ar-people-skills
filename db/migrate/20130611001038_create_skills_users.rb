class CreateSkillsUsers < ActiveRecord::Migration
  def change
    create_table :skills_users do |t|
      t.references :user, :skill
      t.integer :proficiency, default: 0
    end
  end
end
