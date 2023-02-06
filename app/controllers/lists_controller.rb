class ListsController < ApplicationController
  def new
    @list = List.new
  end

  # 投稿内容保存アクション
  def create
    #引数(list_params)はprivateメソッド配下のストロングパラメータの呼び出し?
    # DWOではフォームからの入力データ受取とあるが(list: params[:list])と同義か？
    list = List.new(list_params)
    list.save
    redirect_to("list_path(list.id)")
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
  end

  # アクション制限の境界線
  private
  def list_params
    params.require(:list).permit(:title, :body)
  end
end
