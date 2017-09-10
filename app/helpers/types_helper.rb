module TypesHelper
  def make_is_liked_by_user?(make)
    is_liked = false

    make.liked_makes.each do |liked_make|
      if liked_make.user == current_user
        is_liked = true
        break
      end
    end

    is_liked
  end
end
