class HomeController < ApplicationController
  def top
    @status = Status.new
  end
  
  def main_per(main,mh_main,ap_main)
    difference = mh_main - main
    difference_mh = (ap_main*0.15).floor
    temp_per = (difference-difference_mh)/difference_mh.to_f
    return  (temp_per*100).round
    
  end

  def pure_main(main,mh_main,ap_main,arc_main,aut_main,hyper_main,inner_main,union_main)
    sum_main = main-(arc_main+aut_main+hyper_main+inner_main+union_main)
    per = (main_per(main,mh_main,ap_main)/100.to_f)+1
    return (sum_main/per).round
  end

  def nopure_main(arc_main,aut_main,hyper_main,inner_main,union_main)
    return arc_main + aut_main + hyper_main + inner_main + union_main
  end

  def attack(main,status,sub,dame,final_dame,wepon)
    up = status*100
    sum1 = (main*4)+sub
    sum2 = (100+dame)/100.to_f
    sum3 = (100+final_dame)/100.to_f
    down = wepon*sum1*sum2*sum3
    return (up/down.to_f).round
  end

  def attack_per(wepon_main_per,wepon_add_per,addwepon_main_per,addwepon_add_per,em_main_per,em_add_per,fb)
    return wepon_main_per+wepon_add_per+addwepon_main_per+addwepon_add_per+em_main_per+em_add_per+fb
  end

  def pure_attack(main,status,sub,dame,final_dame,wepon,wepon_main_per,wepon_add_per,addwepon_main_per,addwepon_add_per,em_main_per,em_add_per,fb)
    up = attack(main,status,sub,dame,final_dame,wepon)
    down = (attack_per(wepon_main_per,wepon_add_per,addwepon_main_per,addwepon_add_per,em_main_per,em_add_per,fb)/100.to_f)+1
    return (up/down).round
  end

  def sub_per(sub,union_sub)
    return (((union_sub - sub - 20)/20.to_f)*100).round  #20は４枠埋めた時にあがるサブステ
  end
  
  def pure_sub(sub,union_sub)
    up = sub
    down = (sub_per(sub,union_sub)/100.to_f)+1
    return (up/down).round
  end

  def difference_status(before,after,down)
    up = after -before
    return up/down
  end

  def after
    @status = Status.find_by(id: params[:id])
    @main_per = main_per(@status.main,@status.mh_main,@status.ap_main)
    @pure_main = pure_main(@status.main,@status.mh_main,@status.ap_main,@status.arc_main,@status.aut_main,@status.hyper_main,@status.inner_main,@status.union_main)
    @nopure_main = nopure_main(@status.arc_main,@status.aut_main,@status.hyper_main,@status.inner_main,@status.union_main)
    @attack = attack(@status.main,@status.status,@status.sub,@status.dame,@status.final_dame,@status.wepon)
    @pure_attack = pure_attack(@status.main,@status.status,@status.sub,@status.dame,@status.final_dame,@status.wepon,@status.wepon_main_per,@status.wepon_add_per,@status.addwepon_main_per,@status.addwepon_add_per,@status.em_main_per,@status.em_add_per,@status.fb)
    @attack_per = attack_per(@status.wepon_main_per,@status.wepon_add_per,@status.addwepon_main_per,@status.addwepon_add_per,@status.em_main_per,@status.em_add_per,@status.fb)
    @pure_sub = pure_sub(@status.sub,@status.union_sub)
    @sub_per = sub_per(@status.sub, @status.union_sub)

    @status_attack = (@status.wepon)*(4*(@pure_main*((100+@main_per)/100.to_f) + @nopure_main) + (@pure_sub*((100+@sub_per)/100.to_f)))*((@pure_attack*((100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)


    @add_pure_main = (@status.wepon)*(4*((@pure_main+1)*((100+@main_per)/100.to_f) + @nopure_main) + (@pure_sub*((100+@sub_per)/100.to_f)))*((@pure_attack*((100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)

    @add_nopure_main = (@status.wepon)*(4*(@pure_main*((100+@main_per)/100.to_f) + @nopure_main + 1) + (@pure_sub*((100+@sub_per)/100.to_f)))*((@pure_attack*((100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)

    @add_main_per = (@status.wepon)*(4*(@pure_main*((1+100+@main_per)/100.to_f) + @nopure_main) + (@pure_sub*((100+@sub_per)/100.to_f)))*((@pure_attack*((100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)

    @add_pure_sub = (@status.wepon)*(4*(@pure_main*((100+@main_per)/100.to_f) + @nopure_main) + ((1+@pure_sub)*((100+@sub_per)/100.to_f)))*((@pure_attack*((100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)

    @add_sub_per = (@status.wepon)*(4*(@pure_main*((100+@main_per)/100.to_f) + @nopure_main) + (@pure_sub*((1+100+@sub_per)/100.to_f)))*((@pure_attack*((100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)

    @add_all_per = (@status.wepon)*(4*(@pure_main*((1+100+@main_per)/100.to_f) + @nopure_main) + (@pure_sub*((1+100+@sub_per)/100.to_f)))*((@pure_attack*((100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)

    @add_pure_attack = (@status.wepon)*(4*(@pure_main*((100+@main_per)/100.to_f) + @nopure_main) + (@pure_sub*((100+@sub_per)/100.to_f)))*(((1+@pure_attack)*((100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)

    @add_attack_per = (@status.wepon)*(4*(@pure_main*((100+@main_per)/100.to_f) + @nopure_main) + (@pure_sub*((100+@sub_per)/100.to_f)))*((@pure_attack*((1+100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)

    @add_dame = (@status.wepon)*(4*(@pure_main*((100+@main_per)/100.to_f) + @nopure_main) + (@pure_sub*((100+@sub_per)/100.to_f)))*((@pure_attack*((100+@attack_per)/100.to_f))/100.to_f)*((1+100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)

    @add_criticaldamage = (@status.wepon)*(4*(@pure_main*((100+@main_per)/100.to_f) + @nopure_main) + (@pure_sub*((100+@sub_per)/100.to_f)))*((@pure_attack*((100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((1+35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)

    if @status.criticalper < 100
      @add_criticalper = (@status.wepon)*(4*(@pure_main*((100+@main_per)/100.to_f) + @nopure_main) + (@pure_sub*((100+@sub_per)/100.to_f)))*((@pure_attack*((100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*((1+@status.criticalper)/100.to_f))*((100+@status.final_dame)/100.to_f)
    else
      @add_criticalper = (@status.wepon)*(4*(@pure_main*((100+@main_per)/100.to_f) + @nopure_main) + (@pure_sub*((100+@sub_per)/100.to_f)))*((@pure_attack*((100+@attack_per)/100.to_f))/100.to_f)*((100+@status.dame+@status.bossdamage)/100.to_f)*(1+((35+@status.criticaldamage)/100.to_f)*(@status.criticalper/100.to_f))*((100+@status.final_dame)/100.to_f)
    end  


    @difference_pure_main = (difference_status(@status_attack,@add_pure_main,@add_pure_main-@status_attack)).round(2)
    @difference_nopure_main = (difference_status(@status_attack,@add_nopure_main,@add_pure_main-@status_attack)).round(2)
    @difference_main_per =  (difference_status(@status_attack,@add_main_per,@add_pure_main-@status_attack)).round(2)
    @difference_pure_sub = (difference_status(@status_attack,@add_pure_sub,@add_pure_main-@status_attack)).round(2)
    @difference_sub_per = (difference_status(@status_attack,@add_sub_per,@add_pure_main-@status_attack)).round(2)
    @difference_all_per = (difference_status(@status_attack,@add_all_per,@add_pure_main-@status_attack)).round(2)
    @difference_pure_attack = (difference_status(@status_attack,@add_pure_attack,@add_pure_main-@status_attack)).round(2)
    @difference_attack_per = (difference_status(@status_attack,@add_attack_per,@add_pure_main-@status_attack)).round(2)
    @difference_dame = (difference_status(@status_attack,@add_dame,@add_pure_main-@status_attack)).round(2)
    @difference_criticaldamage = (difference_status(@status_attack,@add_criticaldamage,@add_pure_main-@status_attack)).round(2)
    @difference_criticalper = (difference_status(@status_attack,@add_criticalper,@add_pure_main-@status_attack)).round(2)

  end

  def exchange
    @status = Status.new(
      main: params[:main],
      mh_main: params[:mh_main],
      ap_main: params[:ap_main],
      arc_main: params[:arc_main],
      aut_main: params[:aut_main],
      hyper_main: params[:hyper_main],
      inner_main: params[:inner_main],
      union_main: params[:union_main],
      status: params[:status],
      sub: params[:sub],
      dame: params[:dame],
      final_dame: params[:final_dame],
      wepon: params[:wepon],
      wepon_main_per: params[:wepon_main_per],
      wepon_add_per: params[:wepon_add_per],
      addwepon_main_per: params[:addwepon_main_per],
      addwepon_add_per: params[:addwepon_add_per],
      em_main_per: params[:em_main_per],
      em_add_per: params[:em_add_per],
      fb: params[:fb],
      union_sub: params[:union_sub],
      bossdamage: params[:bossdamage],
      criticaldamage: params[:criticaldamage],
      criticalper: params[:criticalper]
    )
    if @status.save
       redirect_to("/#{@status.id}")
    else
      render :top, status: :unprocessable_entity
    end
  end
end
