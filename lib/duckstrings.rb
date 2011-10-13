class Module
  def ___ ds
    @last_docstring = ds
  end

  def describe &printer
    printer_impl = printer || lambda { |method_name|
      20.times { print '-' }
      puts
      
      puts "#{self.inspect}##{method_name.to_s}"
      puts "(args go here)"
      puts "  #{self.doc_for method_name}"
      puts
    }

    puts "Instance Methods"
    (self.instance_methods - Object.instance_methods).sort.each &printer_impl

    puts "Class Methods"
    (self.methods - Object.methods).sort.each &printer_impl

    @docstrings.count
  end

  def doc_for method_name
    @docstrings[method_name] # || (class << self; self; end).ancestors.find do |kind|
    #   if desc = kind.doc_for(method_name)
    #     return desc
    #   end
    # end
  end

  private 

  alias old_method_added method_added

  def do_magic method_name
    if defined? @last_docstring
      (@docstrings ||= {})[method_name] = @last_docstring
      @last_docstring = nil
    end

    old_method_added method_name    
  end  

  def singleton_method_added method_name
    do_magic method_name
  end

  def method_added method_name
    do_magic method_name    
  end
end

<<-philos
Fogus refers first to Nietzsche and his figure of thought that all interactions and interpretations of the external world through the lens of an individual perspective are completed. Even something like "truth" is therefore subject to constant interpretation, occupational change, and the intake of alternative viewpoints is essential in order to reach a higher level of knowledge.

For the transmission of this figure of thought on the IT world Fogus notes that just a software developer of industry-high standards and best practices are shaped, are ultimately subjective in nature. Were strongly dependent on the subjective views of the developers of one's own history of the learned languages, and here comes again programming pioneer Alan Perlis into play...
philos
