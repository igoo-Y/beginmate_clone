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
    end
  end

  filter :email
  filter :name

  scope :all, default: true
  scope :no_status
  scope :job_searching
  scope :job_offering
  scope :in_office

end
