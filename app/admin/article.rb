ActiveAdmin.register Article do
  permit_params :title, :etitle, :description, :edescription, :body, :ebody, :category, :category_id

  menu :label => "Материалы", :priority => 1

  show do
    attributes_table do
      # row "ID", :id do |article|
      #   raw article.id
      # end
      row "Название", :title do |article|
        raw article.title
      end
      row "Название (ENG)", :etitle do |article|
        raw article.etitle
      end
      row "Категория", :category do |article|
        if !article.category.nil?
          raw article.category.title
        end
      end
      row "Описание", :description do |article|
        raw article.description
      end
      row "Описание (ENG)", :edescription do |article|
        raw article.edescription
      end
      row "Содержание", :body do |article|
        raw article.body
      end
      row "Содержание (ENG)", :ebody do |article|
        raw article.ebody
      end
    end
  end
  form do |f|
    f.inputs "Не забудьте выбрать категорию : )" do
      f.input :title, as: :string, :label => "Заголовок"
      f.input :etitle, as: :string, :label => "Заголовок (ENG)"
      f.input :category, :as => :select, :collection => Category.all.map {|c| [c.title, c.id]}, :label => "Категория"
    end
    f.inputs "Описание" do
      f.cktext_area :description, :ckeditor => { :uiColor => '#FFF07B', toolbar: 'Full', filebrowserImageBrowseUrl: '/ckeditor/pictures', filebrowserImageUploadUrl: '/ckeditor/pictures', filebrowserUploadUrl: "/ckeditor/attachment_files" }
    end
    f.inputs "Описание (ENG)" do
      f.cktext_area :edescription, :ckeditor => { :uiColor => '#89FA27', toolbar: 'Full', filebrowserImageBrowseUrl: '/ckeditor/pictures', filebrowserImageUploadUrl: '/ckeditor/pictures', filebrowserUploadUrl: "/ckeditor/attachment_files" }
    end
    f.inputs "Весь материал" do
      f.cktext_area :body, :ckeditor => { :uiColor => '#FFF07B', toolbar: 'Full', filebrowserImageBrowseUrl: '/ckeditor/pictures', filebrowserImageUploadUrl: '/ckeditor/pictures', filebrowserUploadUrl: "/ckeditor/attachment_files" }
    end
    f.inputs "Весь материал (ENG)" do
      f.cktext_area :ebody, :ckeditor => { :uiColor => '#89FA27', toolbar: 'Full', filebrowserImageBrowseUrl: '/ckeditor/pictures', filebrowserImageUploadUrl: '/ckeditor/pictures', filebrowserUploadUrl: "/ckeditor/attachment_files" }
    end
    f.actions
  end

  index do
    column "Название",:title
    column "Описание", :description do |article|
      raw article.description
    end
    column "Содержание", :body do |article|
      raw article.body
    end
    column "Категория", :category do |i|
      if !i.category.nil?
        i.category.title
      end
    end
    actions
  end
  
  # See permitted parameters documentation:
  # https://github.com/gregbell/active_admin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #  permitted = [:permitted, :attributes]
  #  permitted << :other if resource.something?
  #  permitted
  # end
  
end
