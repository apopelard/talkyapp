class RenameAudioUrlToAudio < ActiveRecord::Migration
  def change
    rename_column :stories, :audio_url, :audio
  end
end
