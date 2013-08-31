class HomeController < ApplicationController
  def index
  end

  def new
    @candidates = Candidate.all
  end

  def vote
    can = Candidate.find(params[:candidate_id])
    can.votes += 1
    can.save
    Voter.create(params[:voter])
    redirect_to(root_path)
  end

  def results
  end
end
