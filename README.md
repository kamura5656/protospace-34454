## usersテーブル
| Culumn     | Type   | Options  | 
| ---------- | ------ | -------- | 
| email      | string | NOT NULL | 
| password   | string | NOT NULL | 
| name       | string | NOT NULL | 
| profile    | text   | NOT NULL | 
| occupation | text   | NOT NULL | 
| position   | text   | NOT NULL | 

##Associstion
- has_many :prototypes
- has_many :comments

## prototypesテーブル
| Culumn     | Type          | Options  | 
| ---------- | ------------- | -------- | 
| title      | string        | NOT NULL | 
| catch_copy | text          | NOT NULL | 
| concept    | text          | NOT NULL | 
| image      | ActiveStorage |          | 
| user       | references    |          | 

##Associstion
- be_longs :prototypes
- has_many :comments

## commentsテーブル
| Culumn    | Type       | Options  | 
| --------- | ---------- | -------- | 
| text      | text       | NOT NULL | 
| user      | references |          | 
| prototype | references |          | 

##Associstion
- be_longs :users
- be_longs :prototypes

