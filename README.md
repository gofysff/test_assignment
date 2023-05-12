# Приложение погоды

## Что это?

Тестовое задание, требовавшее написания клиента погоды

## Заявленные требования

### Функционал приложения

В приложении 3 экрана.

1. На экране 1, при первом входе, должно быть поле для ввода
 названия города и кнопка подтвердить.

2. На экране 2 должна показываться детальная информация о погоде
 в выбранном городе (температура, влажность, скорость ветра).

3. На экране 2, в аппбаре реализовать кнопку, при нажатие на которую
пользователь переходит на экран 3, где можно посмотреть
информацию о погоде за 3 дня списком, где самый первый элемент
списка с самой низкой температурой!!! (важный пункт).

4. На экране 2, в аппбаре реализовать кнопку, при нажатие на которую
пользователь переходит на экран 1, где можно заново получить
информацию о погоде другого города.

### Требования

1. Для реализации, можно использовать открытый API
 <https://openweathermap.org/api/hourly-forecast>

2. Любой дизайн

3. В случае отсутствия интернета или получения ошибки из api при
переходе на 2 экран, приложение, должно показать SnackBar в
центре экрана с ошибкой. Также, в центре экран отобразить текст
“Ошибка получения данных”.

4. Весь код должен быть покрыт комментариями.

5. Для управления состоянием использовать [flutter_bloc](https://pub.dev/packages/flutter_bloc).

## Что использовали?

В качестве глобальной архитектуры была выбрана "Чистая архитектура", позволяющая в дальнейшем легко расширять и менять функционал приложения по-минимуму трогая остальные части приложения:

- мигрировать на другие источники(как на другие rest Api, так и например на сервис работающий с graphQl)
- изменять внешний вид: как экраны, так и отдельные части
- Легко производить локализацию под другие языки
- изменять архитектуру состояния
- добавлять кэширование

и тд

### Библиотеки

- взимодействие с http - Dio(он удобный и при расширении функционала не придется никуда мигрировать)
- State management - bloc

И прочии мелкие утилиты

## Дизайн

За основу был взят открытый дизайн, адаптированный под ТЗ

<https://app.uizard.io/templates/LWx3MdogOJspY56ZdBV8>

## Что получилось сделать?

- приложение полностью соответсвует данному ТЗ
- был освоен bloc, как способ для работы с состоянием, а также было опробовано тестирование bloc'ов
- реализована "чистая архитектура", позволяющая легко менять модули между собой, делая их слабо связанными, а код более простым для понимания
- добавлены возможности для дальнейшего расширения: например, смена сервиса для получения погоды или использования других вариантов этого сервиса(другие api), возможности локализации, смены пользовательского интерфейса и тд
- на уровне ui реализована логика отработки каждого возможного состояния приложения
- стилизация приложения через темы
- следование принципам Solid, dart и bloc conventions при написании кода, разделение кода на маленькие блоки, а экранов на виджеты(для ускорения  работы) с возможностью вынесения отдельных виджетов в утилиты для переиспользования
- написана документация

## Документация

[Документация](doc/api/search.html) (требует размещения и пока не доступна публично из гита)
