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

  scope :all, default: true
  scope :no_status_status
  scope :job_searching_status
  scope :job_offering_status
  scope :in_office_status

end
