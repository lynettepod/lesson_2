require 'yaml'

LANGUAGE = 'es'

# system("clear")

MESSAGES_FILE = YAML.load_file('mortgage_msgs.yml')

# message key/value pairs only, for example
# puts MESSAGES_FILE.inspect
# puts MESSAGES_FILE["test"]
# puts MESSAGES_FILE["test2"]

# language + key/value pairs -- nested
# puts MESSAGES_FILE.inspect
# puts MESSAGES_FILE["en"]["test"]
# puts MESSAGES_FILE["es"]

def prompt(message)
  puts ">>#{message}"
end

#prompt(MESSAGES_FILE["es"]["test"])

def messages(message, lang="en")
  MESSAGES_FILE[lang][message]
end

def prompt(key)
  message = messages(key, LANGUAGE)
  puts ">>#{message}"
end

prompt("test")

