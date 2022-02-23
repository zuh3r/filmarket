def all_gallery_images
    run_sql("SELECT * FROM gallery")
end

def create_gallery_images(name, image_url, artist, caption, price)
    run_sql("INSERT INTO gallery(name, image_url, artist, caption, price) VALUES($1, $2, $3, $4, $5)", [name, image_url, artist, caption, price])
end

def get_gallery_images(id)
    planets = run_sql("SELECT * FROM gallery WHERE id=$1", [id])[0]
end

def delete_gallery_images(id)
    run_sql("DELETE FROM gallery WHERE id = $1", [id])
end

def sell_gallery_images(id)
    run_sql("INSERT INTO marketplace(name, image_url, artist, caption, price) SELECT name, image_url, artist, caption, price FROM gallery WHERE id = $1; DELETE FROM gallery WHERE id = $1;", [id])
end