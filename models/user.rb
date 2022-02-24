def create_user(first_name, last_name, email, password)
    password_digest = BCrypt::Password.create(password)

    run_sql("INSERT INTO users(first_name, last_name, email, password_digest) VALUES ($1, $2, $3, $4)", [first_name, last_name, email, password_digest])
end

def find_user_by_email(email)
    users = run_sql("SELECT * FROM users WHERE email = $1", [email])
    if users.to_a.count > 0
        users[0]
    else
        nil
    end
end

def find_email_by_id(id)
    email = run_sql("SELECT email FROM users WHERE id = $1", [id])
    if email.to_a.count > 0
        email[0]
    else
        nil
    end
end

def find_user_by_id(id)
    user = run_sql("SELECT * FROM users WHERE id = $1", [id])
    if user.to_a.count > 0
        user[0]
    else
        nil
    end
end

def find_balance_by_id(id)
    balance = run_sql("SELECT balance FROM users WHERE id = $1", [id])
    if balance.to_a.count > 0
        balance[0]
    else
        nil
    end
end

def add_balance(balance, id)
    run_sql("UPDATE users SET balance = balance + $1 WHERE id = $2", [balance, id])
end

def withdraw_balance(balance, id)
    run_sql("UPDATE users SET balance = balance - $1 WHERE id = $2", [balance, id])
end