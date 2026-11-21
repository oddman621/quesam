
#####################################
# Entities PEG

(def- entities-peg
  (peg/compile
    '{:space (set " \t\r\n")
      :spaces (any :space)

      :captured-quoted (* "\"" (% (any (if-not "\"" (+ (/ (<- "\\") "/") (<- 1))))) "\"") # Replace Tab to Space

      :pair (group (* :spaces :captured-quoted :spaces :captured-quoted))

      :entity (* :spaces "{" (group (any :pair)) :spaces "}")

      :main (any :entity)}))

#####################################
# Quake Shaders PEG

(def- quake-shaders-peg
  '{:space (set " \t")
    :newline (+ "\r\n" "\r" "\n")
    
    :one-line-comment (* "//" (to :newline))
    :braced-comment (* "/*" (to "*/") "*/")
    :comment (+ :one-line-comment :braced-comment)
    
    :spaces (some (+ :space :newline :comment))

    :name (some (+ (set "-_/$") (range "az" "AZ" "09")))
    :captured-arguments (% (any (if-not (+ :newline :comment) (+ (/ (<- "\t") " ") (<- 1))))) # Replace Tab to Space

    :directive (* (<- :name) (any :space) :captured-arguments)

    :stage (* "{" (any :spaces) (any (* (group :directive) (any :spaces))) "}")
    :shader (* (<- :name)
	       (any :spaces)
	       (group (* "{"
			 (any (* (any :spaces) (+ (group :directive) (group :stage)) (any :spaces)))
			 "}")))

    :main (any (* (any :spaces)
		  (group :shader)
		  (any :spaces)))})


#####################################
# Parse Function

(defn- pair-list->table [pairs]
  (let [table @{}]
    (each pair pairs
      (put table
	   (in pair 0)
	   (in pair 1)))
    table))

(defn parse-entities [text]
  (let [parsed (peg/match entities-peg text)
	result @[]]
    (each entity parsed
      (array/push
	result
	(pair-list->table entity)))
    result))

(defn parse-quake-shaders [text]
  (peg/match quake-shaders-peg text))

#####################################
# JSON Parsing (Requires `spork`)

# (import spork/json)

# (defn entities->json [parsed]
#   (let [result @[]]
#     (each entity parsed
#       (array/push result
# 		  (let [ent-table @{}]
# 		    (each pair entity
# 		      (put ent-table
# 			   (in pair 0)
# 			   (in pair 1)))
# 		    ent-table)))
#     (json/encode result " " "\n")))

# (defn shaders->json [parsed]
#   (json/encode parsed " " "\n"))



#########################################
# Example Code 

# (def entity-text (with [f (file/open "q3dm3.entities" :r)] (file/read f :all)))
# (def parsed-entity (parse-entities entity-text))
# (def shader-text (with [f (file/open "sky.shader" :r)] (file/read f :all)))
# (def parsed-shader (parse-quake-shaders shader-text))

# (setdyn :pretty-format "%m")
# (print "\n<Parsed Entity>\n")
# (pp parsed-entity)
# (print "\n\n<Parsed Shader>\n")
# (pp parsed-shader)

# (spit "entities.jdn" (string/format "%j" parsed-entity))
# (spit "shaders.jdn" (string/format "%j" parsed-shader))

# (spit "entities.json" (entities->json parsed-entity))
# (spit "shaders.json" (shaders->json parsed-shader))
