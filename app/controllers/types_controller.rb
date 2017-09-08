class TypesController < ApplicationController
  def show
    type = Type.find(params[:id])
    @makes = policy_scope(Make).where(type: type)
  end
end
