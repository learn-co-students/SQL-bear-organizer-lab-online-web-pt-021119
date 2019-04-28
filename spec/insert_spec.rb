describe 'populating the bears table' do
  before do
    @db = SQLite3::Database.new(':memory:')
    @sql_runner = SQLRunner.new(@db)
    @sql_runner.execute_create_file
    @sql_runner.execute_insert_file
  end

  it 'has 8 bears' do
    expect(@db.execute("SELECT COUNT(*) FROM bears;").flatten[0]).to eq(8)
  end

INSERT INTO bears (name, age, gender, color, temperament, alive)
VALUEs ('Mr.Chocolate', 8, 'male', 'black', 'relaxed', 'alive');

INSERT INTO  bears (name, age, gender, color, temperament, alive)
VALUEs ('Rowdy', 16, 'male', 'brown', 'loud', 'alive');

INSERT INTO  bears (name, age, gender, color, temperament, alive)
VALUEs ('Tabitha',28, 'female', 'black_white', 'sassy', 'alive');

INSERT INTO  bears (name, age, gender, color, temperament, alive)
VALUEs ('Sergeant Brown', 32, 'male', 'red_white', 'aggressive', 'alive');

INSERT INTO bears (name, age, gender, color, temperament, alive)
VALUEs ('Melissa', 22, 'female', 'brown', 'sweet', 'alive');

INSERT INTO bears (name, age, gender, color, temperament, alive)
VALUEs ('Grinch', 31, 'male', 'green', 'nasty', 'alive');

INSERT INTO  bears (name, age, gender, color, temperament, alive)
VALUEs ('Wendy', 14, 'female', 'pink', 'sweet', 'alive');

INSERT INTO bears ( name, age, gender, color, temperament, alive)
VALUEs (NULL, NULL, NULL, NULL, 'alive');



  it 'has an unnamed bear' do
    expect(@db.execute("SELECT COUNT(*) FROM bears WHERE name IS NULL;").flatten[0]).to eq(1)
  end
end
