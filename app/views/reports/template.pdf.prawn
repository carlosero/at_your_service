img = "#{Rails.root}/public/pdf/logo.png"
pdf.font("Helvetica")
pdf.fill_color("5C5C5C")
# BANNER
pdf.font_size(30)
pdf.image img, :width => 100
pdf.draw_text "At Your Service", at: [148,644]
# HEADER
pdf.font_size(22)
pdf.draw_text "Report: #{@report_title}", at: [0, 590]
pdf.font_size(16)
pdf.draw_text "Month: #{Date::MONTHNAMES[params[:report_month]]}, Year: #{params[:report_year]}", at: [0, 565]
# DATE
pdf.font_size(10)
pdf.text_box "Date: #{Date.today}", at: [425,598]
# TABLE HEADERS
pdf.font_size(14)
x_pos = 0
x_jump = (pdf.bounds.width / @columns.values.count) + 30
@columns.values.each do |column_names|
  pdf.draw_text column_names, at: [x_pos,529]
  x_pos += x_jump
end
# TABLE CONTENT
pdf.font_size(11)
y_jump = 16
y_pos = 0
@model.each do |model|
  x_pos = 0
  @columns.keys.each do |column_key|
    pdf.draw_text model.send(column_key), at: [x_pos, 500 - y_pos]
    x_pos += x_jump
  end
  y_pos += y_jump
end
