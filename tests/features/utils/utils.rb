# frozen_string_literal: false

# ---
class Utils
  def self.get_element_in_list_by_value(elements, value)
    elements.each do |element|
      next unless value.gsub(/\s+/, '').casecmp(element.text.gsub(/\s+/, '')).zero?

      puts "Parameter: #{value.gsub(/\s+/, '')} is the same of Element Text: #{element.text.gsub(/\s+/, '')}\n"
      puts "HTML Element : #{element['outerHTML']}"
      return element
    end
  end

  def self.fill_element_in_list_by_index(elements, index, text)
    elements.each_with_index do |element, idx|
      puts "HTML Element : #{element['outerHTML']} Compare Result: #{index.to_s.gsub(/\s+/, '').casecmp(idx.to_s.gsub(/\s+/, ''))}\n"
      next unless index.to_s.gsub(/\s+/, '').casecmp(idx.to_s.gsub(/\s+/, '')).zero?

      puts "Index: #{index} Idx: #{idx}\n"
      puts "index: #{idx} for #{element['outerHTML']}"
      element.send_keys [:control, 'a'], :delete
      element.send_keys text
      break
    end
  end

  def self.click_on_element_in_list_by_index(elements, index)
    elements.each_with_index do |element, idx|
      puts "HTML Element : #{element['outerHTML']} Compare Result: #{index.to_s.gsub(/\s+/, '').casecmp(idx.to_s.gsub(/\s+/, ''))}\n"
      next unless index.to_s.gsub(/\s+/, '').casecmp(idx.to_s.gsub(/\s+/, '')).zero?

      puts "Index: #{index} Idx: #{idx}\n"
      puts "index: #{idx} for #{element['outerHTML']}"
      element.click
      break
    end
  end

  def self.get_element_click_on_value(element_name, value)
    puts "Locator: //#{element_name}[contains(., '#{value}')]"
    element = Capybara.page.find(:xpath, "//#{element_name}[contains(., '#{value}')]")
    puts "HTML Element : #{element['outerHTML']}"
    element.click
  end

  def self.get_element_and_fill_by_type(element_name, type_value, text)
    puts "Locator: //#{element_name}[@type='#{type_value}']"
    element = Capybara.page.find(:xpath, "//#{element_name}[@type='#{type_value}']")
    puts "HTML Element : #{element['outerHTML']}"
    element.send_keys [:control, 'a'], :delete
    element.send_keys text
  end

  def self.get_element_in_list_and_fill_by_type_and_index(element_name, type_value, index, text)
    puts "Locator: //#{element_name}[@type='#{type_value}']"
    elements = Capybara.page.all(:xpath, "//#{element_name}[@type='#{type_value}']")
    puts "HTML Element : #{elements[index.to_i]['outerHTML']}"
    elements[index.to_i].send_keys [:control, 'a'], :delete
    elements[index.to_i].send_keys text
  end

  def self.get_element_and_check(element_name, prop_value)
    puts "Locator: //#{element_name}[@type='checkbox'][@*='#{prop_value}']"
    element = Capybara.page.find(:xpath, "//#{element_name}[@type='checkbox'][@*='#{prop_value}']")
    puts "HTML Element : #{element['outerHTML']}"
    element.set(true)
  end

  def self.click_on_checkbox_by_index(index)
    Capybara.page.execute_script("$(':checkbox')[#{index}].click();")
  end

  def self.fill_input_by_index(index, value)
    Capybara.page.execute_script("$(':input')[#{index}].value = '#{value}';")
  end
end
