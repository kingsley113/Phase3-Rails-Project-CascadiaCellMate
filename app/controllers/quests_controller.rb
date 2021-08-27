class QuestsController < ApplicationController

	def index
		@quests = Quest.all_by_title
	end

	def new
		@quest = Quest.new
	end

	def show
		set_quest
	end

	def create
		@quest = Quest.new(quest_params)

		if @quest.save
			redirect_to quest_path(@quest)
		else
			render 'new'
		end
	end

	def edit
		set_quest
	end

	def update
		set_quest

		@quest.update(quest_params)

		if @quest.save
			redirect_to quest_path(@quest)
		else
			render 'edit'
		end
	end

	def destroy
		# admin only
		set_quest
		@quest.delete
		redirect_to quests_path
	end

	private

	def set_quest
		@quest = Quest.find_by_slug(params[:id])
	end

	def quest_params
		params.require(:quest).permit(:title, :summary, :details, :wiki_link, :category, cell_ids: [])
	end
end