
def all_contents
    run_sql("SELECT * FROM contents ORDER BY post_timestamp")
end

def count_all_content
    run_sql("SELECT COUNT(*) from contents")[0][:count].to_i
end

def latest_20_contents
    run_sql("SELECT * FROM contents ORDER BY post_timestamp LIMIT 20")
end

def create_content(user_id, title, content, is_image, is_text)
    run_sql("INSERT INTO contents(user_id, post_timestamp, edit_timestamp, title, content, is_image, is_text) VALUES($1, now(), TO_TIMESTAMP(0), $2, $3, $4, $5)", [user_id, title, content, is_image, is_text])
end

def get_content(id)
    run_sql("SELECT * FROM contents WHERE id = $1", [id])[0]
end

def update_content(id, title, content, is_image, is_text)
    run_sql("UPDATE contents SET edit_timestamp = now(), title = $2, content = $3, is_image = $4, is_text = $5 WHERE id = $1", [id, title, content, is_image, is_text])
end

def delete_content(id)
    run_sql("DELETE FROM contents WHERE id = $1", [id])
end
