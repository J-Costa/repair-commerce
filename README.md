<!-- TODO: Verificar gem ActiveUUID, ao invés do secureRandom como string -->

## Iniciar banco de dados via docker:

```DOCKER
  docker run -p 3306:3306 --name db_jpnatal -e MYSQL_ROOT_PASSWORD=root -e MYSQL_ROOT_HOST=% -d mysql/mysql-server
```

## Setup inicial:

- No arquivo `Gemfile` adicione aos grupos `development` e `test` o seguinte: `gem fabrication` antes de criar os models. 
  - No arquivo `config/application.rb` para substituir as `fixtures` pelos fabricators adicionamos: 
    ```RUBY
      config.generators do |g|
      g.test_framework      :test_unit, fixture_replacement: :fabrication
      g.fixture_replacement :fabrication, dir: "test/fabricators"
    end
    ```
- No mesmo arquivo, para sempre criar uma migration com o primary key type como string, adicionamos: 
  ```RUBY
    config.generators do |g|
      g.orm :active_record, primary_key_type: :string
    end
  ```
- No arquivo `app/models/application_record.rb`, para criarmos todos os models com uuid como chave primária, adicionamos:
  ```RUBY
    class ApplicationRecord < ActiveRecord::Base
      default_scope { order(:created_at) }
      before_create -> { self.id = SecureRandom.uuid }
    end
  ```

### Criando os models de dados para o projeto:
```SHELL
  rails g model user name password:digest document email type
  rails g model admin name password:digest document email type --parent=User
  rails g model customer name password:digest document email type --parent=User
  rails g model operator name password:digest document email type --parent=User
  rails g model device brand model color observations:text defect:text user:references
  rails g model service_order number:integer user:references device:references
  rails g model phone prefix number type user:references
  rails g model address state city dstrict number street cep complement user:references
```