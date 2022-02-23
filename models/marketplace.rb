def all_sale_images
    run_sql("SELECT * FROM marketplace")
end

def create_sale_images(name, image_url, artist, caption, price)
    run_sql("INSERT INTO marketplace(name, image_url, artist, caption, price) VALUES($1, $2, $3, $4, $5)", [name, image_url, artist, caption, price])
end

def get_sale_images(id)
    planets = run_sql("SELECT * FROM marketplace WHERE id=$1", [id])[0]
end

def purchase_sale_images(id)
    run_sql("INSERT INTO gallery(name, image_url, artist, caption, price) SELECT name, image_url, artist, caption, price FROM marketplace WHERE id = $1; DELETE FROM marketplace WHERE id = $1;", [id])
end