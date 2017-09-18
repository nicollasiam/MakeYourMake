class TypesController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  def show
    @all_types = Type.all.order(:name)
    @type = Type.friendly.find(params[:id])
    @makes = policy_scope(Make).joins(:make_types).where(make_types: { type: @type })
    authorize(@makes)
  end
end
