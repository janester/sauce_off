class HomeController < ApplicationController
  def index
  end

  def new
    @candidates = Candidate.order(:name)
  end

  def vote
    if params[:candidate_id].nil?
      flash[:alert] = "You have to select a sauce"
      @candidates = Candidate.order(:name)
      redirect_to(new_vote_path)
    else
      can = Candidate.find(params[:candidate_id])
      can.votes += 1
      can.save
      Voter.create(params[:voter])
      session[:has_voted] = true
      redirect_to(root_path)
    end
  end

  def results
    @candidates = Candidate.order(:votes).reverse
  end
end
