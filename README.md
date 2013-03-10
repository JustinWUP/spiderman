# Spiderman
This is a configurable web spider for searching job board sites and pulling job listings off. You can enter job sites into the backend, configure the search with regular expressions. Running the spider caches entire pages and then Nokogiri scrubs out the job link, company name, city and post date and munches them into the database using configurable settings in the job site settings.

Once this is complete, they will display in a list on the home page using jquery pagination.
You can also search for jobs in fulltext, which uses Sunspot SOLR.


