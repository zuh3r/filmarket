def all_sale_images
    run_sql("SELECT * FROM marketplace")
end

def purchase_sale_images(id, email, price)
    run_sql("UPDATE marketplace SET email = (SELECT email FROM users WHERE email = $2) WHERE id = $1", [id, email])
    run_sql("INSERT INTO gallery SELECT * FROM marketplace WHERE id =$1", [id])
    run_sql("DELETE FROM marketplace WHERE id = $1", [id])
    run_sql("UPDATE users SET balance = balance - $1 WHERE email = $2", [price, email])
end

def marketplace_image_price(id)
    run_sql("SELECT price FROM marketplace WHERE id = $1", [id])[0]
end

