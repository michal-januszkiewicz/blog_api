class CreateDbSchema < ActiveRecord::Migration[5.2]
  def up
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false

      t.timestamps
    end
    add_index :users, :name
    add_index :users, :email, unique: true

    create_table :posts do |t|
      t.string :title, null: false
      t.string :content, null: false

      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
    add_index :posts, :title, unique: true

    create_table :comments do |t|
      t.string :content

      t.references :user, foreign_key: true, null: false
      t.references :post, foreign_key: true
      t.references :comment, foreign_key: true

      t.timestamps
    end

    # NOTE: Exclusive arc check. Comment cannot belong to post and comment simultaneously.
    execute <<-SQL
      ALTER TABLE comments ADD CONSTRAINT commentable_check CHECK (
        ((post_id is not null)::integer + (comment_id is not null)::integer) = 1
      );
    SQL
  end

  def down
    execute <<-SQL
      ALTER TABLE comments DROP CONSTRAINT commentable_check;
    SQL

    drop_table :comments
    drop_table :posts
    drop_table :users
  end
end
