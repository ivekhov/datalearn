# Homework to Module 02

1 Вам необходимо установить Postgres базу данных к себе на компьютер. Вы можете посмотреть инструкции по установки Postgres.

2.1 Вам необходимо установить клиент SQL для подключения базы данных. Вы можете посмотреть инструкции по установки DBeaver. Так же вы можете использовать любой другой клиент для подключения к ваше БД.

```
PyCharm Professional
```

2.2 Создайте 3 таблицы и загрузите данные из Superstore Excel файл в вашу базу данных. Сохраните в вашем GitHub скрипт загрузки данных и создания таблиц. Вы можете использовать готовый пример sql файлов.

``` 
orders.sql 
returns.sql
people.sql 
```

2.3 Напишите запросы, чтобы ответить на вопросы из Модуля 01. Сохраните в вашем GitHub скрипт загрузки данных и создания таблиц.

```
homework.sql
```

3.1 Вам необходимо нарисовать модель данных для нашего файлика Superstore:

- Концептуальную

- Логическую

- Физическую 

Вы можете использовать бесплатную версию SqlDBM или любой другой софт для создания моделей данных баз данных.


### Логическая модель

![alt text for screen readers](model_logical.png).

### Физическая модель

![alt text for screen readers](model_phisicial.png).


3.2 Когда вы нарисуете модель данных, вам нужно скопировать DDL и выполнить его в SQL клиенте.

```
ddl-02.sql
```

3.3 Вам необходимо сделать INSERT INTO SQL, чтобы заполнить Dimensions таблицы и Sales Fact таблицу. Сначала мы заполняем Dimensions таблицы, где в качестве id мы генерим последовательность чисел, а зачем Sales Fact таблицу, в которую вставляем id из Dimensions таблиц. Такой пример я рассматривал в видео.

```
inserting-02.sql
```

4.1. Вам необходимо создать учетную запись в AWS. Это бесплатно. Если вы запускаете сервис в AWS, не забудьте его удалить, когда он не нужен, а то могут и денюшку списать.

4.2 Используя сервис AWS Lightsail или AWS RDS (смотрите инструкцию) создайте БД Postgres и активируйте Public access

4.3 Подключитесь к новой БД через SQL клиент (например DBeaver)

4.4 Загрузите данные из модуля 2.3 (Superstore dataset) в staging (схема БД stg) и загрузите dimensional model (схема dw). Вы можете использовать мой пример SQL для этого упражнения:

- Staging stg.orders.sql

- Business Layer from_stg_to_dw.sql

```
- Lightsale

- RDS
```

4.5 Попробуйте выполнить свои запросы из предыдущих упражнений. Не забудьте указать схему перед название таблицы. Например, public.orders или stg.orders.

5 В качестве домашнего задания вам необходимо создать дашборд в одном из решений, которые мы рассмотрели. ДЛя идей можно использовать задание из 1го модуля. Данные должны быть в Postgres в AWS и вы сможете подключиться сервисом к БД и создать несколько отчетов. Для практики можно и во всех 3х создать.


- Klipfolio https://app.klipfolio.com/trends/metric/detail/666d4336be85261fe894c39447bd56f5?override_vis_options=eyJ2ZXJzaW9uIjozLCJkYXRhIjp7ImNvbnRleHQiOnsicmFuZ2UiOnsic3RhcnQiOiIyMDE2LTAxLTAxVDAwOjAwOjAwLjAwMFoiLCJlbmQiOiIyMDE2LTAyLTE0VDIzOjU5OjU5Ljk5OVoifSwicGVyaW9kaWNpdHkiOiIxdyIsImZpbHRlcnMiOnt9LCJjb21wYXJpc29uIjoibm9uZSJ9LCJzbG90cyI6eyJjYXRlZ29yaWVzIjpbeyJuYW1lIjoidGltZSJ9XSwiZGltZW5zaW9uIjpbeyJuYW1lIjoic3ViX2NhdGVnb3J5In1dfX0sInVwZGF0ZWQiOnRydWUsInZpcyI6eyJvcHRpb25zIjp7ImxlZ2VuZFBvc2l0aW9uIjoicmlnaHQiLCJzaG93RGF0YUxhYmVscyI6ZmFsc2V9LCJjb2xvdXJpbmdTdHJhdGVneSI6InJvdGF0aW5nIiwidHlwZSI6ImNvbHVtbl9zdGFja2VkIn19

- Google Data Studio https://datastudio.google.com/reporting/2ddcea69-337b-4f9d-bede-938edccb6859 

- AWS Quiksight https://eu-central-1.quicksight.aws.amazon.com/sn/dashboards/3784c473-00d3-43c5-b238-5b1a1aa0fc90/views/084a1d82-f881-42bf-b8fd-f80533f2395c


