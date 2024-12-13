# typed: false
# frozen_string_literal: true

require "test_helper"

class Site::WelcomeControllerTest < ActionDispatch::IntegrationTest
    test "must have a content" do
      get root_url

      paragraph = "Candidata é a plataforma ideal para conectar recrutadores e candidatos. " \
                  "Com nossas ferramentas, você pode encontrar oportunidades de emprego que " \
                  "correspondam às suas habilidades e experiências, ou encontrar os " \
                  "melhores talentos para sua empresa."

      assert_select "h1", "Encontre talentos. Vagas incríveis."
      assert_select "p", paragraph
      assert_select "a", "Quero contratar"
      assert_select "a", "Quero trabalhar"
    end
end
