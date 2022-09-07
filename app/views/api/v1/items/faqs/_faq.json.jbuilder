# frozen_string_literal: true

json.id(faq.id)
json.question(faq.question)
json.answer(faq.answer)
json.status(boolean_to_text(faq.status))
