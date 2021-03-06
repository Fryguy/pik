module Pik

  class BatchFile < ScriptFile

    def extname
      ".bat"
    end

    def header
      string =  "@ECHO OFF\n\n" 
      string << "::  This batch file generated by Pik, the\n"
      string << "::  Ruby Manager for Windows\n"  
    end  

    def call(bat)
      @file_data << "CALL #{bat}\n"
      self
    end

    def set(items)
      items.each{|k,v| @file_data << "SET #{k}=#{v}" }
      self
    end

    def unset(*items)
      items.flatten.each{|k| @file_data << "SET #{k}=" }
      self
    end

  end

end