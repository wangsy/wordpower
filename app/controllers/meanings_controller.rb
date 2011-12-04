class MeaningsController < ApplicationController
  # GET /meanings
  # GET /meanings.json
  def index
    @meanings = Meaning.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meanings }
    end
  end

  # GET /meanings/1
  # GET /meanings/1.json
  def show
    @meaning = Meaning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meaning }
    end
  end

  # GET /meanings/new
  # GET /meanings/new.json
  def new
    @word = Word.find(params[:word_id])
    @meaning = Meaning.new
    @meaning.word = @word

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @meaning }
    end
  end

  # GET /meanings/1/edit
  def edit
    @meaning = Meaning.find(params[:id])
    @word = @meaning.word
  end

  # POST /meanings
  # POST /meanings.json
  def create
    @meaning = Meaning.new(params[:meaning])

    respond_to do |format|
      if @meaning.save
        format.html { redirect_to word_path(@meaning.word), notice: 'Meaning was successfully created.' }
        format.json { render json: @meaning, status: :created, location: @meaning }
      else
        format.html { render action: "new" }
        format.json { render json: @meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meanings/1
  # PUT /meanings/1.json
  def update
    @meaning = Meaning.find(params[:id])

    respond_to do |format|
      if @meaning.update_attributes(params[:meaning])
        format.html { redirect_to @meaning, notice: 'Meaning was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @meaning.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meanings/1
  # DELETE /meanings/1.json
  def destroy
    @meaning = Meaning.find(params[:id])
    @meaning.destroy

    respond_to do |format|
      format.html { redirect_to meanings_url }
      format.json { head :ok }
    end
  end
end
