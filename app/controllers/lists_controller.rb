class ListsController < ApplicationController
  def new
    @list = List.new
  end

  # 投稿内容保存アクション
  def create
    #引数(list_params)はprivateメソッド配下のストロングパラメータの呼び出し！
    list = List.new(list_params)
    list.save
    redirect_to list_path(list.id)
  end

  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    list = List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    redirect_to "/lists"
  end


  # アクション制限の境界線
  private
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end
end
