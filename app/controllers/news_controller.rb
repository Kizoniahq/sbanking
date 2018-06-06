class NewsController < InheritedResources::Base

  private

    def news_params
      params.require(:news).permit(:title, :body, :date)
    end
end

