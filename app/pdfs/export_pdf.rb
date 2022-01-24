class ExportPdf < Prawn::Document
  def initialize(curiosity)
    super()
    @curiosity = curiosity
    head_curiosity
    images
    content
  end

  def head_curiosity
    text curiosity.title.upcase, size: 20, color: "68D3FE", align: :center
  end

  def images
    curiosity.images.each do |img|
      image StringIO.open(img.download), position: :left, fit: [250, 250]
      move_down 10
    end
  end

  def content
    text_box curiosity.content, at: [270, 690]
  end

  private

  attr_reader :curiosity
end
