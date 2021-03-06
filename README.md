# Non Spaghetti Validation

## Постановка задачи
В школе на уроке ученики с учителем решают, кто поедет в поездку.
Учеников можно поделить на типы.

Острые:

- иголка (needle)
- трезубец (trident)
- нож (knife)

Круглые:

- шарик с гелием (helium balloon)
- воздушный шар (air balloon)
- мяч (ball)

Нейтральные:

- звезда (star)
- луна (moon)

Круглые предметы не могут ехать вместе в острыми (даже с одним из), так как боятся, что их уколят. Но среди учеников присутсвует такая личность, как примиритель (mediator). Если он будет в поездке, острые предметы могут ехать с круглыми.

Также каждому предмету присущи уникальные "хотелки":

- у каждого участника должно быть игровое прозвище;
- у круглых предметов должен быть цвет;
- иголка хочет, чтобы у ножа игровое прозвище состояло из 5 символов;
- трезубец хочет, чтобы у ножа игровое прозвище состояло из 7 символов, и желание трезубца сильнее желания иголки;
- если круглые поедут с острыми, у ножа должен быть зеленый цвет;
- игровое прозвище должно быть не у всех, а только у выбранных учеников (но может быть и у всех);
- у каждого ученика могут быть отдельные условия для его игрового прозвища, например: “игровое прозвище звезды не может содержать одинаковых символов“, “игровое прозвище ножа не должно начинаться с цифры”.
- воздушный шара едет, если едет иголка (требуется медиатор)
- нож едет, если едет иголка и трезубец

Нужно создать интерфейс, где каждый ученик - это поле в таблице. В базовой реализации ячейки может должна быть задана возможность через модель сообщить ей цвет, дефолтное наименование, а также комплишены для обработки эвентов с UI - ных элентов (text fileld и switch - а).

## Описание решения

Решение адаптировано под использование архитектуры MVP. Для управления таблицей используется зависимость RDDM.

Сперва нам необходимо в презентере завести учителя `Teacher` (это псевдоним для класса `Referee`). Инициализация происходит вызовом статической функции:

```Swift
private lazy var teacher: Teacher = {
	Teacher.make(with: [
		Mediator(),
		Star(),
		Moon(),
		HeliumBalloon(),
		AirBalloon(),
		Ball(),
		Needle(),
		Trident(),
		Knife()
	])
}()
```

Экземляры классов, которые мы передаем учителю, можно воспринимать как список учеников. Кратко, каждый ученик:

1. знает о каждом ученике (то есть знаком со всеми учениками в классе);
2. содержит в себе характеристики (готов ли к поездке, цвет, прозвище и т.д.);
3. содержит в себе правила валидации   

Опишем каждый пункт подробнее.

- Ученики знают друг о друге

Это необходимо для того, чтобы ученик мог свериться, не вступает ли он в конфликт еще с каким-то учеником. Такое решение покрывает достаточно много кейсов валидации.

Ученик узнает о других учениках через делегат, тип которого - протокол `SurveyableObjectsProvider`. Под него подписан класс `Teacher`. Он заставляет его реализовать хранимое свойство `var surveyableObjects: [Surveyable]`, где и будут храниться все ученики. По сути, это поле и так логично для учителя, который и должен хранить список учеников. Делегат же просто обеспечивает доступ ученика к этому полю.

Делегат не стоит задавать ученику самостоятельно. Он сетится автоматически при создании учителя. **(Выглядит как недоработка, ужать бы интерфейс)**.

- Ученик содержит в себе характеристики

Протокол `Pupil` является композицией протоколов `ViewRepresentable` и `Surveyable`. О втором поговорим позже. Роль в контексте текущей `ViewRepresentable` - подчеркнуть, что поля какого-то из учеников могут быть репрезентованы через UI. Например, свойство `var color: UIColor` задает цвет ячейки, `var nickname: String`- никнейм ученика в ячейке, `var isWantGoTrip: Bool` - позицию тоггла (on/off). При любом изменении в ячейке, (например, я задал ячейке другой никнейм), все изменения должны сразу переноситься в модель.

Данный слой может быть переработан на усмотрение того, кто будет пользоваться данным решением.

- Ученик содержит правила валидации

В ученике содержится сущность валидатор, который может принимать в себя правила валидации. Реализовать данное поле нас заставляет протокол `Validable`. Рассмотрим же уже протокол `Surveyable`, наследующийся от `Validable`. Объект, который реализовывает `Surveyable`, помимо знания списка остальных учеников, может проверить

1. Не нарушил ли он какие-то собственные правила. Сделать это можно через функцию `checkYourself()`. В случае ошибки эта функция выдаст массив `[Conflict]`. В нём будут содержаться структуры `DummyConflict`, но можно реализовать и свои кастомные.
2. Проверка правил в валидаторе нацелена на выявление конфликтов в требованиях одного поля к другому. Например, ученик Moon требует, что ученика Star не было в поездке. В свою же очередь, поле Star может тоже наложить какие-то ограничение к Moon. Эти два случая выставления требования необходимо различать. Каждое поле гарантированно обратится ко всем полям в списке. Валидатор получает указ проерить поля в дефолтной реализации функции:

```Swift
func haveNoConflict(with pupil: Surveyable) -> [Conflict] {
	validator.validate(for: pupil)
}
``` 

Эту функцию можно переопределить для более тонкой настройки.

На данный момент в проекте есть только один тип правил `DefaultRule`. Для него можно установить тег и приоритет (описано далее), а проверяемое правило передается через кложур. В качестве параметров в него передается ученик, с которым и будет проверяться конфликт, а в качестве возвращаемного значения передаётся булево значение. Пример использования:

```Swift
var validator: Validator {
	Validator(rules: [
		DefaultRule(
			priority: .hight,
			tag: RuleTagger.starShouldBeInTrip.rawValue
		) { [weak self] pupil in
			guard pupil is Star,
				let pupil = pupil as? ViewRepresentable,
				let self = self else {
			return true
			}
			return !pupil.isWantGoTrip && self.isWantGoTrip
		}
	])
}
```

Периодически несколько условий могут накладываться друг на друга. Например, два поля могут накладывать условия на никнейм. Первое поле требует его длину, равной 6, второе - 8. Для решения этого конфликта служит приоритизация правил. Для того, чтобы система приоритетов работала корректно, нужно выставить одинаковый тег и двух правил, которые могут дать коллизию, и задать каждой из них приоритет.