class CreateTables < ActiveRecord::Migration
  def change
    create_table :companies, force: true do |t|
      t.string  :status,                :limit => 45,   :null => false
      t.string  :name,                  :limit => 45,   :null => false
      t.string  :busyness,              :limit => 45,   :null => false
      t.string  :zip,                   :limit => 45,   :null => false
      t.string  :prefecture,            :limit => 45,   :null => false
      t.string  :address,               :limit => 45,   :null => false
      t.integer :make_count,                            :null => false
      t.integer :member_count,                          :null => false
      t.string  :body,                  :limit => 1024, :null => false
      t.string  :tel,                   :limit => 45
      t.string  :image
      t.decimal :rate,                  :precision => 3,  :scale => 8
      t.decimal :score1,                :precision => 3,  :scale => 8
      t.decimal :score2,                :precision => 3,  :scale => 8
      t.decimal :score3,                :precision => 3,  :scale => 8
      t.decimal :score4,                :precision => 3,  :scale => 8
      t.decimal :score5,                :precision => 3,  :scale => 8
      t.string  :note,                  :limit => 1024
      t.timestamps                                       :null => false
    end

    create_table  :comments, force: true do |t|
      t.integer :project_id
      t.integer :company_id
      t.string  :kind,                  :limit => 45,   :null => false
      t.string  :status
      t.string  :body,                  :limit => 1024, :null => false
      t.integer :amount
      t.timestamps                                      :null => false
    end

    create_table :reviews, force: true do |t|
      t.integer :commitment_id
      t.integer :source_company_id
      t.integer :dest_company_id
      t.string  :body,                  :limit => 1024, :null => false
      t.integer :score1
      t.integer :score2
      t.integer :score3
      t.integer :score4
      t.integer :score5
      t.timestamps                                      :null => false
    end

    create_table :commitments, force: true do |t|
      t.integer :project_id
      t.integer :source_company_id
      t.integer :dest_company_id
      t.string  :status,                :limit => 45,   :null => false
      t.string  :body,                  :limit => 1024, :null => false
      t.integer :amount
      t.timestamps                                      :null => false
    end

    create_table :projects, force: true do |t|
      t.integer :source_company_id
      t.integer :dest_company_id
      t.string  :status,                :limit => 45,   :null => false
      t.string  :name,                  :limit => 45,   :null => false
      t.string  :body,                  :limit => 1024, :null => false
      t.string  :kind_body,             :limit => 100,  :null => false
      t.string  :kind_edge,             :limit => 100,  :null => false
      t.integer :need_amount,                           :null => false
      t.date    :deadline,                              :null => false
      t.float   :estimated_sum,                         :null => false
      t.string  :note,                  :limit => 1024
      t.timestamps                                      :null => false
    end

    add_index :comments,    [:project_id, :company_id]
    add_index :reviews,     [:commitment_id, :source_company_id]
    add_index :commitments, [:project_id, :source_company_id]
    add_index :projects,    [:source_company_id]
  end
end
