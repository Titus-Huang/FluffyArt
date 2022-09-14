
def all_contents
    run_sql("SELECT * FROM contents ORDER BY post_timestamp")
end

def count_all_content
    run_sql("SELECT COUNT(*) from contents")[0]['count'].to_i
end

def latest_20_contents
    run_sql("SELECT * FROM contents ORDER BY post_timestamp LIMIT 20")
end

def create_content(user_id, title, content, content_description, is_image, is_html)
    run_sql("INSERT INTO contents(user_id, post_timestamp, edit_timestamp, title, content, content_description, is_image, is_html) VALUES($1, now(), TO_TIMESTAMP(0), $2, $3, $4, $5, $6)", [user_id, title, content, content_description, is_image, is_html])
end

def get_content(id)
    run_sql("SELECT * FROM contents WHERE id = $1", [id])[0]
end

def update_content(id, title, content, is_image, is_html)
    run_sql("UPDATE contents SET edit_timestamp = now(), title = $2, content = $3, content_description = $4, is_image = $5, is_html = $6 WHERE id = $1", [id, title, content, content_description, is_image, is_html])
end

def delete_content(id)
    run_sql("DELETE FROM contents WHERE id = $1", [id])
end



def truncate_content_string(string)
    if string.length > 120
        truncated_string = string.slice(0..120) + "..."
        return truncated_string
    end
    string
end