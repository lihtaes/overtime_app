module ApplicationHelper

  def active?(path)
    "active" if current_page?(path)
  end


  def homepage_view
    if admin_types.include?(current_user.try(:type))
      render 'admin'
    else
      render 'employee'
    end
  end

  def status_label status
    status_span_generator status
  end

  private

    def status_span_generator status
      case status
      when 'submitted'
        content_tag(:span, status.titleize, class: 'label label-primary')
      when 'approved'
        content_tag(:span, status.titleize, class: 'label label-success')
      when 'rejected'
        content_tag(:span, status.titleize, class: 'label label-danger')
      when 'pending'
        content_tag(:span, status.titleize, class: 'label label-primary')
      when 'confirmed'
        content_tag(:span, status.titleize, class: 'label label-success')
      end
    end

    def admin_types
      ['AdminUser']
    end

    def employee?
      current_user.type == 'Employee'
    end

    def admin?
      admin_types.include?(current_user.type)
    end
    
end