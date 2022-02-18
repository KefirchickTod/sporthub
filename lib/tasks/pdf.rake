require File.expand_path("../../config/environment", __dir__)

namespace :pdf do
  desc "Generate pfd"

  task :generate, :path do |task, argc|
    pdf = WickedPdf.new.pdf_from_url(argc[:path])

    Dir.mkdir "#{Rails.root}/pdfs" unless File.directory?("#{Rails.root}/pdfs")

    save_path = Rails.root.join("pdfs", "article.pdf")
    File.open(save_path, "wb") do |file|
      file << pdf
    end
  end
end
