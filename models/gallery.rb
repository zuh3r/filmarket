def get_gallery_images(email)
    gallery_images = run_sql("SELECT * FROM gallery WHERE email=$1", [email])
end

def create_gallery_images(name, image_url, artist, caption, price, email)
    run_sql("INSERT INTO gallery(name, image_url, artist, caption, price, email) VALUES($1, $2, $3, $4, $5, $6)", [name, image_url, artist, caption, price, email])
end

def delete_gallery_images(id)
    run_sql("DELETE FROM gallery WHERE id = $1", [id])
end

def gallery_image_price(id)
    run_sql("SELECT price FROM gallery WHERE id = $1", [id])[0]
end

def sell_gallery_images(id, price, email)
    run_sql("UPDATE gallery SET price = $2 WHERE id = $1", [id, price])
    run_sql("UPDATE gallery SET email = NULL WHERE id = $1", [id])
    run_sql("INSERT INTO marketplace SELECT * FROM gallery WHERE id =$1", [id])
    run_sql("DELETE FROM gallery WHERE id = $1", [id])
    run_sql("UPDATE users SET balance = balance + $1 WHERE email = $2", [price, email])
end

def update_gallery_images(id, name, caption, price)
    run_sql("UPDATE gallery SET name = $2, caption = $3, price = $4 WHERE id = $1", [id, name, caption, price])
end




