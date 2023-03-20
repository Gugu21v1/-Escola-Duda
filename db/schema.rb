# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_03_20_155728) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "alunos", force: :cascade do |t|
    t.string "matricula"
    t.string "name"
    t.bigint "sala_id", null: false
    t.string "nascimento"
    t.string "conceitos"
    t.integer "faltas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status"
    t.string "email"
    t.string "password"
    t.string "role"
    t.index ["sala_id"], name: "index_alunos_on_sala_id"
  end

  create_table "horarios", force: :cascade do |t|
    t.string "nome"
    t.integer "aulas_dadas"
    t.integer "aulas_previstas"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "join_materias_profs", force: :cascade do |t|
    t.bigint "professor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "horario_id", null: false
    t.index ["horario_id"], name: "index_join_materias_profs_on_horario_id"
    t.index ["professor_id"], name: "index_join_materias_profs_on_professor_id"
  end

  create_table "joins", force: :cascade do |t|
    t.bigint "professor_id", null: false
    t.bigint "sala_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["professor_id"], name: "index_joins_on_professor_id"
    t.index ["sala_id"], name: "index_joins_on_sala_id"
  end

  create_table "notas_alunos", force: :cascade do |t|
    t.bigint "aluno_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "horario_id", null: false
    t.string "nota"
    t.index ["aluno_id"], name: "index_notas_alunos_on_aluno_id"
    t.index ["horario_id"], name: "index_notas_alunos_on_horario_id"
  end

  create_table "professors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password"
    t.string "email"
    t.string "role"
  end

  create_table "salas", force: :cascade do |t|
    t.string "ano"
    t.string "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "secretaria", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "alunos", "salas"
  add_foreign_key "join_materias_profs", "horarios"
  add_foreign_key "join_materias_profs", "professors"
  add_foreign_key "joins", "professors"
  add_foreign_key "joins", "salas"
  add_foreign_key "notas_alunos", "alunos"
  add_foreign_key "notas_alunos", "horarios"
end
