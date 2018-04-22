module ApplicationHelper
  def simple_time(time)
    time.strftime("%m月%d日 %H:%M")
  end


  def calc_your_payment(new_charges, group, each_user)
      total_mycheck = calc_debt_or_check(new_charges, each_user)
    each_user_charges = Charge.where("user_id = ? and group_id = ?", each_user.id, group.id)
      total_mydebt = calc_debt_or_check(each_user_charges, current_user)
    return (total_mycheck - total_mydebt).to_s + "円"
  end


  def calc_debt_or_check(new_charges, any_user)
    total_amount = []
    new_charges.each do |charge|
      charge.charged_users.each do |charged_user|
        if charged_user.user_id == any_user.id and charged_user.status == 0
          total_amount <<  charge.amount / charge.charged_users.length
          break
        end
      end
    end
    if total_amount.length == 0
      return 0
    else
      return total_amount.inject(:+)
    end
  end


  def change_status(charger_id, target_id)
    charges= Charge.where("group_id = ? and user_id = ?", params[:group_id], charger_id)
    charges.each do |charge|
      charge.charged_users.each do |charged_user|
        if charged_user.user_id == target_id.to_i
          charged_user.update(status: 1)
          break
        end
      end
    end
  end

end
