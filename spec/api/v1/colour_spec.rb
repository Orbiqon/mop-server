require('swagger_helper')

describe 'Colour (Definition Table)' do
  path '/api/v1/colours' do
    get 'Get Colours' do
      tags 'Colour (Definition Table)'
      security []
      produces 'application/json'

      response '200', 'Colours List Retrieved Successfully' do
        run_test!
      end

      response '204', 'No Content' do
        run_test!
      end

      response '404', 'Api Not Found' do
        run_test!
      end

      response '400', 'Bad Request' do
        run_test!
      end

      response '500', 'Internal Server Error' do
        run_test!
      end
    end
  end
end
