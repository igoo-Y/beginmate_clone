ActiveAdmin.register User do
  index do
    selectable_column
    id_column
    column :email
    column :profile do |user|
      if user.profile.attached?
        image_tag url_for(user.profile), class: "small_image"
      else
        "이미지 없음"
      end
    end
    column :name
    column :status
    column :region
    column :role
    column :career do |user|
      "#{user.career} 년차"
    end
    column :details
    actions
  end

  show do
    attributes_table do
      row :email
      row :profile do |user|
        if user.profile.attached?
          image_tag url_for(user.profile), class: "small_image"
        else
          "이미지 없음"
        end
      end
      row :name
      row :status
      row :region
      row :role
      row :career
      row :created_at
      row :updated_at
    end
  end

  filter :email
  filter :name
  filter :region, as: :select, collection: User.regions
  filter :role, as: :select, collection: User.roles
  filter :career
  filter :details_name_cont, label: "세부사항"

  scope -> {"전체"}, :all, default: true
  scope -> {"표시안함"}, :no_status_status
  scope -> {"구직중"},:job_searching_status
  scope -> {"구인중"},:job_offering_status
  scope -> {"재직중"},:in_office_status

end
