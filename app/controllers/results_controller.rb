class ResultsController < ApplicationController
  # GET /results
  # GET /results.json
  #before_filter :crawl, :only => :show

  def index
    @jobs = Job.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @results }
    end
  end

  # GET /results/1
  # GET /results/1.json
  def show
    @result = Result.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/new
  # GET /results/new.json
  def new
    @result = Result.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @result }
    end
  end

  # GET /results/1/edit
  def edit
    @result = Result.find(params[:id])
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(params[:result])

    respond_to do |format|
      if @result.save
        format.html { redirect_to @result, notice: 'Result was successfully created.' }
        format.json { render json: @result, status: :created, location: @result }
      else
        format.html { render action: "new" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /results/1
  # PUT /results/1.json
  def update
    @result = Result.find(params[:id])

    respond_to do |format|
      if @result.update_attributes(params[:result])
        format.html { redirect_to @result, notice: 'Result was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /results/1
  # DELETE /results/1.json
  def destroy
    @result = Result.find(params[:id])
    @result.destroy

    respond_to do |format|
      format.html { redirect_to results_url }
      format.json { head :no_content }
    end
  end

  def crawl
    @results = Result.all
    @burger = ''
    # folder = URI.parse(@result.url).host
    # FileUtils.mkdir_p(File.join(".",folder))
    @results.each do |result|
      FileUtils.mkdir_p("#{Rails.root}/app/assets/cache/")
      Anemone.crawl(result.url) do |anemone|
        anemone.on_pages_like(/posts/) do |page|
          page.links.keep_if {|link| link.to_s.match(/\?page\=|\d{1,2}$/)}
          # filename = page.url.request_uri.to_s
          # filename = "/index.html" if filename == "/" # Make sure the file name is valid
          # folders = filename.split("/")
          # filename = folders.pop
          FileUtils.mkdir_p("#{Rails.root}/app/assets/cache/") # Create the current subfolder
          @file = "#{Rails.root}/app/assets/cache/" + result.title + '.txt'
          print "Downloading '#{page.url}'...\n"
          @burger += page.body.to_s

      
        # File.open(File.join(".",folder,folders,filename),"w") {|f| f.write(page.body.force_encoding('UTF-8'))}
        # puts "done."

        # @burger += page.body
        # @burger += ','
       end


    end
    if @burger != nil
    f = File.new(@file, "w+") 
    f.puts(@burger.force_encoding('UTF-8'))
    # @patties = @burger.split(',')
    end
    end
    redirect_to '/munch'
  end

  def munch
    Job.delete_all
    @files = Dir.entries("#{Rails.root}/app/assets/cache")
    @files.delete('.') 
    @files.delete('..') 
    @files.each do |burger| 
      smash = Nokogiri::HTML(open("#{Rails.root}/app/assets/cache/" + burger )) 
      smash.css('td.views-field-title a').each do |link| 
        eatit = link.to_s.gsub('href="','href="http://www.startupers.com').gsub('">', '" target="blank">')
        Job.create(link: eatit, jobboard: File.basename(burger,".txt"))
      end
    end   
    redirect_to '/dedupe'
  end

  def dedupe
    @jobs = Job.all
    @jobs.each do |job|
    count = Job.find_all_by_link(job.link).count
      if count >1
        count -1
        Job.find_all_by_link(job.link).delete.count.times
      end
    end
  redirect_to :root
  end

end


