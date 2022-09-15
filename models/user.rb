
def create_user(username, email, password)
    password_digest = BCrypt::Password.create(password)

    run_sql("INSERT INTO users(username, email, password_digest) VALUES($1, $2, $3)", [username, email, password_digest])
end

def find_user_by_username(username)
    users = run_sql("SELECT * FROM users WHERE username = $1", [username])

    if users.to_a.count > 0
        users[0]
    else
        nil
    end
end

def find_user_by_id(id)
    run_sql("SELECT * FROM users WHERE id = $1", [id])[0]
end

def get_users_by_id()
    run_sql("SELECT * FROM users ORDER BY id")
end

def count_all_users
    run_sql("SELECT COUNT(*) from users")[0]['count'].to_i
end

def update_profile_image_url(new_url, id)
    run_sql("UPDATE users SET profile_image_url = $1 WHERE id = $2", [new_url, id])
end