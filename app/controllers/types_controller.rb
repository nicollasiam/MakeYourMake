class TypesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @all_types = Type.all.order(:name)
    @type = Type.friendly.find(params[:id])
    @makes = policy_scope(Make).joins(:make_types).where(make_types: { type: @type })
    @makes = @makes.paginate(page: params[:page], per_page: 1)
    authorize(@makes)
  end
end
