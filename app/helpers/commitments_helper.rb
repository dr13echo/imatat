module CommitmentsHelper
  def dest_commitment_status(status)
    elem =  '<div class="checkbox checkbox-switchery checkbox-right">'
    elem += '<label>'
    if status == 'progress'
      elem += '<input type="checkbox" class="switchery">進行中'
    elsif status == 'done'
      elem += '<input type="checkbox" class="switchery" checked="checked">完了'
    else
      elem += ''
    end
    elem += '</label>'
    elem += '</div>'
    elem.html_safe
  end

  def source_commitment_status(me, status)
    elem = ""
    if status == 'progress'
      elem += '<td class="text-danger"><i class="icon-contrast"></i> 未完了</td>'
    elsif status == 'done' && me.review.present?
      elem += '<td><i class="icon-shield-check"></i> レビュー済み</td>'
    elsif status == 'done' && me.review.blank?
      elem += '<td class="text-primary-600"><a href="#" data-toggle="modal" data-target="#new_review_form"><i class="icon-pencil7"></i> レビューを書く</a></td>'
    else
      elem +=''
    end
    elem.html_safe
  end
end
