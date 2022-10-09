# Домашние задания по Rails

Этот туториал раскрывает основные темы, необходимые для комфортного обучения на Хекслете:

* [Как учиться эффективно](#как-учиться-эффективно)
* [Настройка окружения](#настройка-окружения)
* [Структура домашних заданий](#структура-домашних-заданий)
* [Пример решения домашнего задания](#решаем-hello-world)
* [Проверка линтером](#проверка-линтером)
* [Как отправить на проверку](#отправляем-на-проверку)

## Как учиться эффективно

Учебные материалы на Хекслете построены таким образом, чтобы студентам не понадобилось ничего гуглить, а темы для самостоятельного изучения даются дополнительными ссылками в теории или практике. Домашние задания также основаны на предыдущих уроках, поэтому если пройденного ранее материала недостаточно для решения задачи — это наша вина. Напишите об этом в канале группы и оповестите куратора. Он передаст это в методический отдел, а мы улучшим описание задачи и расширим теорию.

### Текст домашнего задания

Текст домашнего задания всегда описывает задачу и несколько требований по её решению. Каждая практика - это закрепление пройденной темы теми подходами, которые уже знакомы студенту. В тексте домашнего задания обычно есть *основное* задание и *дополнительное*.

*Дополнительные задания* необходимы, чтобы глубже погрузиться в тему и ориентированы в первую очередь на тех, кому основное задание показалось слишком простым. Старайтесь выполнять основное задание вовремя, а к дополнителым можно возвращаться позже, когда будет время.

### Если вы не знаете что дальше делать

При решении задач нормально испытывать сложности в поиске решения, экспериментировать отлаживать. Этот чек-лист поможет лучше понять задачу:

* Изучите все файлы упражнения. Они дадут представление об архитектуре кода и способах его запуска.
* Запустите тесты. Текст ошибки покажет, что ожидалось и что получилось.
* Используйте [отладочную печать](https://help.hexlet.io/ru/articles/111500-kak-nayti-oshibki-v-kode). Она поможет увидеть результаты выполнения кода по шагам.

Когда вы застряли и **в течение часа** не можете сдвинуться с места, не видите вариантов решения или не можете справиться с ошибкой, поищите в чате вопросы других студентов или создайте напишите вопрос в чат сами. Если вопросы касаются кода, прикрепляйте в тред ссылки, а не куски кода. При составлении вопроса опирайтесь на наш гайд ["Как правильно задавать вопросы"](https://help.hexlet.io/ru/articles/111495-kak-pravilno-zadavat-voprosy).

### Статьи об обучении на Хекслете

* Статья [«Как учиться и справляться с негативными мыслями»](https://guides.hexlet.io/learning)
* Статья [«Ловушки обучения»](https://ru.hexlet.io/blog/posts/traps-learning)
* Статья [«Сложные простые задачи по программированию»](https://ru.hexlet.io/blog/posts/slozhnye-prostye-zadachi-po-programmirovaniyu)
* Урок [«Как эффективно учиться на Хекслете»](https://ru.hexlet.io/courses/introduction_to_programming/lessons/hexlet-flow/theory_unit)
* Вебинар [«Как самостоятельно учиться»](https://www.youtube.com/watch?v=dCYZppVgGww)

## Домашнее задание

### Настройка окружения

Для решения домашних заданий на компьютере должно быть подготовлено рабочее окружения — установлен Ruby, Rake, Bundler и редактор для кода.
Для скачивания и отправки домашних заданий используется утилита [hexlet/cli](https://github.com/Hexlet/cli/blob/main/src/templates/program/README.md).

Для работы с домашними работами по Rails вам необходимо будет установить также установить NodeJS и Yarn. Инструкция [Установка Node.js](https://github.com/Hexlet/instructions/blob/main/nodejs.md)

  ```bash
  # NodeJS может также устанавливаться с помощью nvm или asdf
  sudo apt-get install curl
  curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
  sudo apt install -y nodejs

  npm install --global yarn
  yarn install
  ```

### Структура домашних заданий

Изучим структуру каталога *exercises* с домашним заданием *Hello, World!*:

```text
hello-world
├── Gemfile
├── lib
│  └── solution.rb
├── Makefile
├── Rakefile
├── README.md
├── TUTORIAL.md <-- мы здесь
├── presentation.pdf
├── ruby-basics.gemspec
├── test
│ ├── solution_test.rb
│ └── test_helper.rb
```

* На верхнем уровне *README.md* содержит текст задачи. Здесь описывается что нужно сделать.
* Каталог *test* содержит один или несколько файлов тестов для проверки решения. Тесты описывают как должно работать решение. Они являются основными требованиями к коду и дополняют задачу, описанную в README.
* Каталог *lib* содержит один или несколько файлов для решения студента.
* *presentation.pdf* - файл с презентацией, которая была на вебинаре. Иногда презентации обновляются, повторная загрузка упражнения позволит получить свежую версию.

### Решаем "Hello, World!"

#### Шаг 1: Запустим тесты без готового решения

Используйте Rake для запуска тестов:

```bash
rake test
```

Эта команда запустит проверку решения и выдаст ошибку, подобную такой:

```bash
# Running:

E

Finished in 0.000547s, 1829.7190 runs/s, 0.0000 assertions/s.

  1) Error:
TestHelloSolution#test_say_hello:
NameError: uninitialized constant TestHelloSolution::Hello
    /usr/src/app/test/solution_test.rb:7:in `setup'

1 runs, 0 assertions, 0 failures, 1 errors, 0 skips
rake aborted!
```

#### Шаг 2: Пишем решение

Откроем в редакторе кода файл для решения по пути *lib/solution.rb*:

```ruby
# BEGIN


Своё решение нужно размещать между маркерами *BEGIN* и *END*. Разместим там код решения:

```ruby
# BEGIN

# END
```

Запустим тесты ещё раз:

```bash
rake test
```

Теперь тесты сообщают, что ожидалась (Expected) строка "This is Hexlet!", а был получена (Actual) строка "Hello, Hexlet!".

```bash
# Running:

F

Finished in 0.000738s, 1354.9677 runs/s, 1354.9677 assertions/s.

  1) Failure:
TestHelloSolution#test_say_hello [/usr/src/app/test/solution_test.rb:11]:
Expected: "This is Hexlet!"
  Actual: "Hello, Hexlet!"

1 runs, 1 assertions, 1 failures, 0 errors, 0 skips
rake aborted!
```

#### Шаг 3: Изучим тесты

Основной спецификацией к коду выступают тесты и раскрывают те детали требований, которые в README могли быть отражены в общих чертах. Откроем файл с тестом *test/solution_test.rb*:

```ruby
require_relative 'test_helper'

class TestHelloSolution < Minitest::Test
  def setup
    @hello = Hello.new
  end

  def test_say_hello
    # здесь происходит сравнение ожидаемой строки с пришедшей
    assert_equal 'This is Hexlet!', @hello.say_hello
  end
end
```

Поправим наше решение и запустим тесты повторно на проверку.

```ruby
# BEGIN

# END
```

```bash
rake test

# Running:

.

Finished in 0.000662s, 1510.5854 runs/s, 1510.5854 assertions/s.

1 runs, 1 assertions, 0 failures, 0 errors, 0 skips
```

Готово, тесты пройдены! Теперь можно сдавать домашнюю работу.

### Проверка линтером

Сейчас домашние задания скачиваются без линтера, чтобы студентам не приходилось загружать много зависимостей в каждом упражнении. Но проверка линтером происходит в CI/CD.

Чтобы сделать локально проверку линтером, необходимо на уровне своего каталога с домашними заданиями создать файлы *Gemfile* с зависимостями линтера и *.rubocop.yml* с правилами линтера. Вот их содержимое:

Gemfile

```Gemfile
# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rubocop'
gem 'rubocop-minitest'
```

.rubocop.yml

```yaml
AllCops:
  NewCops: enable

Style/Documentation:
  Enabled: false

Gemspec/RequiredRubyVersion:
  Enabled: false

Metrics/MethodLength:
  Enabled: false
```

Запуск линтера нужно выполнять в каталоге с упражнением следующей командой:

```bash
bundle exec rubocop exercises
```

Пример ошибки линтера:

```bash
exercises/metaprogramming/lib/model.rb:31:3: C: Metrics/AbcSize: Assignment Branch Condition size for define_attribute_methods is too high. [<13, 22, 6> 26.25/17]
  def self.define_attribute_methods(klass) ...
  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
```

Стайлгайд по Ruby можно найти на [rubystyle.guide](https://rubystyle.guide/)

### Отправляем на проверку

Используя команду *submit* из [hexlet/cli](https://github.com/Hexlet/cli/blob/main/src/templates/program/README.md), отправляем своё решение в Gitlab. Там оно пройдёт проверку автоматической системой. При её успешно завершении можно запрашивать проверку у своего наставника.

Подробнее этот процесс описан в [статье в Notion](https://www.notion.so/hexlet/780f724542b14ecb883a6ebf8ea6e54e#041a70d9e70243d3b4773fa751c3c0fa).