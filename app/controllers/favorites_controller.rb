class FavoritesController < ApplicationController

	# def create
	# 	# url（rake routesでかくにん）に代入されたidを参照（link_toでおくられたid）
	# 	# ようするに、さっきまで見てた投稿
	# 	post_image = PostImage.find(params[:post_image_id])
	# 	# current_user.favoritesでアソシエーションにより、user_idカラムにcurrent_user.idを代入
	# 	# favoritesテーブルのpost_image_idカラムに、上で定義したpost_image.idを代入
 #        favorite = current_user.favorites.new(post_image_id: post_image.id)
 #        favorite.save
 #        redirect_to post_images_path
	# end

	def  create
		favorite = Favorite.new
		# current_userはdeviseのメソッドで、今ログインしているユーザーのidがはいる。
		favorite.user_id = current_user.id
		# paramsってのはformやlink_toからおくられてきたデータを持ってくるメソッド。:post_image_idってのはurlにふくまれている。
		favorite.post_image_id = params[:post_image_id]
		favorite.save
		redirect_to post_images_path
	end

	def destroy
		favorite = current_user.favorites.find_by(post_image_id: params[:post_image_id])
        favorite.destroy
        redirect_to post_images_path
	end

end
