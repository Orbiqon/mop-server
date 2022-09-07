# frozen_string_literal: true

json.id(faq.id)
json.name(faq.question)
json.name(faq.answer)
json.status(boolean_to_text(faq.status))
