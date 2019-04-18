class OrdersController < ApplicationController
  def create
    user = current_user
    order = user.orders.create!
    @cart.contents.each do |song_id, quantity|
      order.order_songs.create(song_id: song_id , quantity: quantity)
    end
    @cart.contents.clear
    redirect_to songs_path
  end
end
