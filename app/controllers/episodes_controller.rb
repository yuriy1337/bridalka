before_action :load_episode, only: [:show, :edit, :update, :destroy]

private

def episode_params
  params.require(:episode).permit(:description, :name, :seconds, :published_on, :timecode)
end