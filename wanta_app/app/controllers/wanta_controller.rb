class WantaController < ApplicationController

  def new
    @w = Wanta.new    
  end

  def create 
    @w = Wanta.new(params.require(:wanta).permit(:content))
    
    # クライアントIPアドレスにランダムな文字列を付加し、uniqeカラムにセット 
    r = [('a'..'z'), ('A'..'Z'), ('0'..'9')].map { |i| i.to_a }.flatten
    rr = (0...10).map { r[rand(r.length)] }.join # ランダムな文字列の生成
    i = request.remote_ip.tr(".", "1") # クライアントIPアドレスのドットを1に変換
    @w.uniqe = i + rr # 両者を連結して、uniqeカラムにセット
    
    @w.save # 保存する
    
    #　メッセージの表示
    @mess1 = 'このURLを相手にメールで送ってください。'
    @mess2 = url_for(action: :new) + '/' + @w.uniqe
    render 'mess' # mess.html.erbを使用
  end

  def show
    @w = Wanta.find_by(uniqe: params[:id])
    
    # 該当データがある場合は、当該データを削除する。既に削除済みのデータの場合は、メッセージを出す。
    if Wanta.find_by(uniqe: params[:id]) != nil
      then
        @w.destroy
      else
        @mess1 = 'メッセージはありません。'
        render 'mess' # mess.html.erbを使用
    end   
  end

  def index
    @w = Wanta.all
  end
  
end
