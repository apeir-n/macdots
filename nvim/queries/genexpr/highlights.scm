(identifier) @variable
(number) @number
(string) @string
(comment) @comment

(definition_function
    (identifier) @function)

(call_function
    (identifier) @function.call)

(declaration_param
  "Param" @attribute
  (identifier) @variable)

(declaration_history
  "History" @property
  (number) @number)

(declaration_data
  "Data" @attribute
  (identifier) @variable)

(declaration_buffer
  "Buffer" @property
  (identifier) @variable)

(assignment
    "=" @operator)

(assignment_compound
    ["+=" "-=" "*=" "/="] @operator)

(expression_binary
    ["+" "-" "*" "/" "==" "<" ">" "<=" ">="] @operator)

(statement_for
    "for" @keyword
    ";" @punctuation.delimiter)

(statement_if
    "if" @keyword
    "else" @keyword)

(statement_return
    "return" @keyword)
