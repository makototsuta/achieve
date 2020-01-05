module ClonesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm' || action_name == 'create'
      confirm_clones_path
    elsif action_name == 'edit'
      clone_path
    end
  end
end
